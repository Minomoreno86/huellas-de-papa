import SwiftUI

/// Vista principal de la Capa 5 (Aplicación en Casa) del módulo Bésame Mucho
/// Presenta 12 situaciones cotidianas con guías prácticas detalladas
struct BM5View: View {
    @State private var selectedCategory: SituationCategory? = nil
    
    var body: some View {
        ScrollView {
            VStack(spacing: 32) {
                headerSection
                categoryFilterSection
                situationsGridSection
                activitiesSection
                remindersSection
                motivationalQuoteSection
            }
            .padding()
        }
        .background(Color(.systemGroupedBackground))
        .navigationTitle("Aplicación en Casa")
        .navigationBarTitleDisplayMode(.large)
    }
    
    // MARK: - Header
    private var headerSection: some View {
        VStack(spacing: 16) {
            Image(systemName: "house.fill")
                .font(.system(size: 50))
                .foregroundStyle(
                    LinearGradient(
                        colors: [.blue, .mint],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
            
            Text("Aplicación en Casa")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(
                    LinearGradient(
                        gradient: Gradient(colors: [.blue, .mint]),
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
            
            Text("Cómo aplicar Bésame Mucho en tu vida diaria")
                .font(.title3)
                .fontWeight(.medium)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
            
            Text("15 guías prácticas para situaciones reales")
                .font(.subheadline)
                .foregroundColor(.blue)
                .italic()
        }
        .padding(.vertical)
    }
    
    // MARK: - Category Filter
    private var categoryFilterSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Filtrar por categoría")
                .font(.headline)
                .foregroundColor(.primary)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    Button(action: {
                        triggerHaptic()
                        withAnimation { selectedCategory = nil }
                    }) {
                        Text("Todas")
                            .font(.subheadline)
                            .fontWeight(.medium)
                            .foregroundColor(selectedCategory == nil ? .white : .blue)
                            .padding(.horizontal, 16)
                            .padding(.vertical, 8)
                            .background(
                                Capsule()
                                    .fill(selectedCategory == nil ? Color.blue : Color.blue.opacity(0.1))
                            )
                    }
                    
                    ForEach([SituationCategory.sleep, .feeding, .contact, .limits], id: \.self) { category in
                        Button(action: {
                            triggerHaptic()
                            withAnimation { selectedCategory = category }
                        }) {
                            HStack(spacing: 6) {
                                Image(systemName: category.icon)
                                Text(category.rawValue)
                            }
                            .font(.subheadline)
                            .fontWeight(.medium)
                            .foregroundColor(selectedCategory == category ? .white : colorForCategory(category))
                            .padding(.horizontal, 16)
                            .padding(.vertical, 8)
                            .background(
                                Capsule()
                                    .fill(selectedCategory == category ? colorForCategory(category) : colorForCategory(category).opacity(0.1))
                            )
                        }
                    }
                }
                .padding(.horizontal, 4)
            }
        }
    }
    
    // MARK: - Situations Grid
    private var situationsGridSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("15 Situaciones Cotidianas")
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(.primary)
            
            LazyVGrid(columns: [GridItem(.flexible())], spacing: 16) {
                ForEach(filteredSituations) { situation in
                    BM5SituationCard(situation: situation)
                }
            }
        }
    }
    
    // MARK: - Activities Section
    private var activitiesSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Actividades Rápidas (15-30 min)")
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(.primary)
            
            Text("Actividades simples para fortalecer el vínculo diariamente")
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(quickActivities) { activity in
                        BM5ActivityCard(activity: activity)
                    }
                }
                .padding(.horizontal, 4)
            }
        }
    }
    
    // MARK: - Reminders
    private var remindersSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Recordatorios del Libro")
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(.primary)
            
            VStack(spacing: 12) {
                ForEach(reminders) { reminder in
                    HStack(alignment: .top, spacing: 12) {
                        Image(systemName: "heart.fill")
                            .foregroundColor(.pink)
                            .font(.title3)
                        
                        VStack(alignment: .leading, spacing: 6) {
                            Text(reminder.quote)
                                .font(.body)
                                .fontWeight(.semibold)
                                .foregroundColor(.primary)
                                .italic()
                            
                            Text(reminder.context)
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color(.systemBackground))
                            .shadow(color: Color.pink.opacity(0.1), radius: 4, x: 0, y: 2)
                    )
                }
            }
        }
    }
    
    // MARK: - Motivational Quote
    private var motivationalQuoteSection: some View {
        VStack(spacing: 20) {
            Text("💙 Para Recordar")
                .font(.headline)
                .fontWeight(.semibold)
                .foregroundColor(.primary)
            
            VStack(spacing: 12) {
                Text("\"Lo importante no es la cantidad de tiempo, pero la cantidad también importa.\"")
                    .font(.title3)
                    .fontWeight(.medium)
                    .foregroundColor(.primary)
                    .multilineTextAlignment(.center)
                    .italic()
                
                Text("— Carlos González")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            .padding(.vertical, 24)
            .padding(.horizontal, 20)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(
                        LinearGradient(
                            gradient: Gradient(colors: [
                                Color.blue.opacity(0.1),
                                Color.mint.opacity(0.05)
                            ]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(
                                LinearGradient(
                                    gradient: Gradient(colors: [
                                        Color.blue.opacity(0.3),
                                        Color.mint.opacity(0.2)
                                    ]),
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                ),
                                lineWidth: 1
                            )
                    )
            )
            .shadow(color: Color.blue.opacity(0.1), radius: 8, x: 0, y: 4)
        }
    }
    
    // MARK: - Computed Properties
    private var filteredSituations: [BM5Situation] {
        if let selectedCategory = selectedCategory {
            return allSituations.filter { $0.category == selectedCategory }
        }
        return allSituations
    }
    
    // MARK: - Data
    private var allSituations: [BM5Situation] {
        [situationsPart1, situationsPart2, situationsPart3, situationsPart4].flatMap { $0 }
    }
    
    private func colorForCategory(_ category: SituationCategory) -> Color {
        switch category {
        case .sleep: return .indigo
        case .feeding: return .pink
        case .contact: return .blue
        case .limits: return .orange
        }
    }
    
    private func triggerHaptic() {
        #if !os(macOS)
        let impactFeedback = UIImpactFeedbackGenerator(style: .light)
        impactFeedback.impactOccurred()
        #endif
    }
}

// MARK: - Preview
struct BM5View_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            BM5View()
        }
    }
}

