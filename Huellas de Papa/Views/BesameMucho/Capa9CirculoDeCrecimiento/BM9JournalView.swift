import SwiftUI

/// Vista de diario de reflexión
struct BM9JournalView: View {
    @State private var todayEntry = BM9JournalEntry(date: Date())
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                headerSection
                
                JournalSectionView(
                    title: "Victorias de Hoy",
                    icon: "star.fill",
                    color: .yellow,
                    placeholder: "¿Qué lograste hoy?",
                    text: $todayEntry.victories
                )
                
                JournalSectionView(
                    title: "Desafíos",
                    icon: "exclamationmark.triangle.fill",
                    color: .orange,
                    placeholder: "¿Qué te costó?",
                    text: $todayEntry.challenges
                )
                
                JournalSectionView(
                    title: "Aprendizajes",
                    icon: "lightbulb.fill",
                    color: .blue,
                    placeholder: "¿Qué descubriste?",
                    text: $todayEntry.learnings
                )
                
                JournalSectionView(
                    title: "Momentos Especiales",
                    icon: "heart.fill",
                    color: .pink,
                    placeholder: "¿Qué momentos quieres recordar?",
                    text: $todayEntry.specialMoments
                )
                
                saveButtonSection
            }
            .padding()
        }
        .background(Color(.systemGroupedBackground))
        .navigationTitle("Diario de Reflexión")
    }
    
    private var headerSection: some View {
        VStack(spacing: 8) {
            Text("📖")
                .font(.system(size: 50))
            Text(todayEntry.date, style: .date)
                .font(.headline)
        }
        .padding()
    }
    
    private var saveButtonSection: some View {
        Button(action: {
            // Guardar entrada del diario
        }) {
            Text("Guardar Reflexión")
                .font(.headline)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(LinearGradient(colors: [.purple, .pink], startPoint: .leading, endPoint: .trailing))
                )
        }
    }
}

struct JournalSectionView: View {
    let title: String
    let icon: String
    let color: Color
    let placeholder: String
    @Binding var text: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Label(title, systemImage: icon)
                .font(.headline)
                .foregroundColor(color)
            
            TextEditor(text: $text)
                .frame(minHeight: 100)
                .padding(8)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color(.secondarySystemGroupedBackground))
                )
                .overlay(
                    Group {
                        if text.isEmpty {
                            Text(placeholder)
                                .foregroundColor(.secondary)
                                .padding(.leading, 12)
                                .padding(.top, 16)
                        }
                    },
                    alignment: .topLeading
                )
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(.systemBackground))
        )
    }
}

