import SwiftUI

/// Vista de seguimiento de hábitos diarios
struct BM9HabitTrackerView: View {
    @State private var todayHabits = HabitDay()
    @AppStorage("BM_UserStreak") private var userStreak: Int = 0
    @AppStorage("BM_TotalDaysActive") private var totalDaysActive: Int = 0
    @AppStorage("BM_LastSaveDate") private var lastSaveDateString: String = ""
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                headerSection
                habitsListSection
                saveButtonSection
            }
            .padding()
        }
        .background(Color(.systemGroupedBackground))
        .navigationTitle("Seguimiento Diario")
    }
    
    private var headerSection: some View {
        VStack(spacing: 12) {
            Text("📅")
                .font(.system(size: 50))
            
            Text("Hoy: \(Date(), style: .date)")
                .font(.headline)
            
            Text("\(todayHabits.completedCount) / \(todayHabits.totalCount) completados")
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
        .padding()
    }
    
    private var habitsListSection: some View {
        VStack(spacing: 16) {
            HabitRow(title: "Colecho", icon: "moon.stars.fill", isCompleted: $todayHabits.colecho)
            HabitRow(title: "Lactancia a Demanda", icon: "heart.circle.fill", isCompleted: $todayHabits.lactanciaADemanda)
            HabitRow(title: "Respuesta al Llanto", icon: "hand.raised.fill", isCompleted: $todayHabits.respuestaAlLlanto)
            HabitRow(title: "Sin Gritar", icon: "speaker.slash.fill", isCompleted: $todayHabits.sinGritar)
            HabitRow(title: "Sin Castigos", icon: "shield.fill", isCompleted: $todayHabits.sinCastigos)
            HabitRow(title: "Contacto Físico", icon: "figure.2.arms.open", isCompleted: $todayHabits.contactoFisico)
            HabitRow(title: "Validación Emocional", icon: "face.smiling.fill", isCompleted: $todayHabits.validacionEmocional)
            HabitRow(title: "Lectura del Libro", icon: "book.fill", isCompleted: $todayHabits.lecturaLibro)
        }
    }
    
    private var saveButtonSection: some View {
        Button(action: {
            saveHabitsForToday()
        }) {
            Text("Guardar Registro del Día")
                .font(.headline)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(LinearGradient(colors: [.blue, .mint], startPoint: .leading, endPoint: .trailing))
                )
        }
    }
    
    // MARK: - Save Function
    private func saveHabitsForToday() {
        let today = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let todayString = dateFormatter.string(from: today)
        
        // Update streak
        if !lastSaveDateString.isEmpty {
            if let lastDate = dateFormatter.date(from: lastSaveDateString) {
                let daysDifference = Calendar.current.dateComponents([.day], from: lastDate, to: today).day ?? 0
                
                if daysDifference == 1 {
                    userStreak += 1
                } else if daysDifference > 1 {
                    userStreak = 1
                }
            }
        } else {
            userStreak = 1
        }
        
        // Update total days if new day
        if lastSaveDateString != todayString {
            totalDaysActive += 1
        }
        
        // Save date
        lastSaveDateString = todayString
        
        // Haptic feedback
        #if !os(macOS)
        let impactFeedback = UIImpactFeedbackGenerator(style: .medium)
        impactFeedback.impactOccurred()
        #endif
    }
}

struct HabitRow: View {
    let title: String
    let icon: String
    @Binding var isCompleted: Bool
    
    var body: some View {
        Button(action: {
            withAnimation(.spring()) {
                isCompleted.toggle()
            }
        }) {
            HStack(spacing: 16) {
                Image(systemName: icon)
                    .font(.title2)
                    .foregroundColor(isCompleted ? .green : .gray)
                
                Text(title)
                    .font(.body)
                    .foregroundColor(.primary)
                
                Spacer()
                
                Image(systemName: isCompleted ? "checkmark.circle.fill" : "circle")
                    .font(.title2)
                    .foregroundColor(isCompleted ? .green : .gray)
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color(.systemBackground))
                    .shadow(color: isCompleted ? Color.green.opacity(0.2) : Color.gray.opacity(0.1), radius: 4)
            )
        }
    }
}

