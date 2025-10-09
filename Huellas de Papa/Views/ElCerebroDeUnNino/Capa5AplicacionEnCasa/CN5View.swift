import SwiftUI

/// Vista principal de la Capa 5 (Aplicación en Casa)
/// Actividades, rutinas y recordatorios para implementar las estrategias diariamente
struct CN5View: View {
    @State private var selectedActivity: CN5Activity?
    @State private var selectedRoutine: CN5Routine?
    @State private var showingActivityDetail = false
    @State private var showingRoutineDetail = false
    @State private var selectedTab: ApplicationTab = .activities
    
    enum ApplicationTab {
        case activities, routines, reminders, fromBook
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 32) {
                // Header
                headerSection
                
                // Tab Selector
                tabSelector
                
                // Content based on tab
                switch selectedTab {
                case .activities:
                    activitiesSection
                case .routines:
                    routinesSection
                case .reminders:
                    remindersSection
                case .fromBook:
                    fromBookSection
                }
            }
            .padding()
        }
        .background(Color(.systemGroupedBackground))
        .navigationTitle("Aplicación en Casa")
        .navigationBarTitleDisplayMode(.large)
        .sheet(isPresented: $showingActivityDetail) {
            if let activity = selectedActivity {
                CN5ActivityDetailView(activity: activity)
            }
        }
        .sheet(isPresented: $showingRoutineDetail) {
            if let routine = selectedRoutine {
                CN5RoutineDetailView(routine: routine)
            }
        }
    }
    
    // MARK: - Header
    private var headerSection: some View {
        VStack(spacing: 16) {
            Text("Lleva el Libro a Casa")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(
                    LinearGradient(
                        colors: [.blue, .mint],
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
            
            Text("Actividades, rutinas y recordatorios para integrar las estrategias en tu vida diaria")
                .font(.title3)
                .fontWeight(.medium)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
        }
        .padding(.vertical)
    }
    
    // MARK: - Tab Selector
    private var tabSelector: some View {
        HStack(spacing: 0) {
            CN5TabButton(
                title: "Actividades",
                icon: "figure.play",
                isSelected: selectedTab == .activities
            ) {
                withAnimation {
                    selectedTab = .activities
                }
            }
            
            CN5TabButton(
                title: "Rutinas",
                icon: "clock.fill",
                isSelected: selectedTab == .routines
            ) {
                withAnimation {
                    selectedTab = .routines
                }
            }
            
            CN5TabButton(
                title: "Recordatorios",
                icon: "bell.fill",
                isSelected: selectedTab == .reminders
            ) {
                withAnimation {
                    selectedTab = .reminders
                }
            }
            
            CN5TabButton(
                title: "Del Libro",
                icon: "book.fill",
                isSelected: selectedTab == .fromBook
            ) {
                withAnimation {
                    selectedTab = .fromBook
                }
            }
        }
        .padding(4)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color(.systemBackground))
        )
    }
    
    // MARK: - Activities Section
    private var activitiesSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Actividades Prácticas")
                .font(.title2)
                .fontWeight(.semibold)
            
            Text("Misiones específicas para practicar estrategias del libro")
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            VStack(spacing: 12) {
                ForEach(cn5Activities) { activity in
                    CN5ActivityCard(activity: activity)
                        .onTapGesture {
                            selectedActivity = activity
                            showingActivityDetail = true
                        }
                }
            }
        }
    }
    
    // MARK: - Routines Section
    private var routinesSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Rutinas Familiares")
                .font(.title2)
                .fontWeight(.semibold)
            
            Text("Integra las estrategias en tus rutinas diarias")
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            VStack(spacing: 12) {
                ForEach(cn5Routines) { routine in
                    CN5RoutineCard(routine: routine)
                        .onTapGesture {
                            selectedRoutine = routine
                            showingRoutineDetail = true
                        }
                }
            }
        }
    }
    
    // MARK: - Reminders Section
    private var remindersSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Recordatorios Rápidos")
                .font(.title2)
                .fontWeight(.semibold)
            
            Text("Frases clave para momentos específicos del día")
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            VStack(spacing: 12) {
                ForEach(cn5Reminders) { reminder in
                    CN5ReminderCard(reminder: reminder)
                }
            }
        }
    }
    
    // MARK: - From Book Section
    private var fromBookSection: some View {
        VStack(alignment: .leading, spacing: 24) {
            Text("Contenido Original del Libro")
                .font(.title2)
                .fontWeight(.semibold)
            
            Text("Hojas de refrigerador, ejemplos y reflexiones que Daniel Siegel incluye en el libro")
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            // Refrigerator Sheets
            VStack(alignment: .leading, spacing: 16) {
                Label("Hojas de Refrigerador", systemImage: "doc.text.fill")
                    .font(.headline)
                    .foregroundColor(.blue)
                
                Text("Resúmenes que puedes imprimir y poner en tu refrigerador")
                    .font(.caption)
                    .foregroundColor(.secondary)
                
                ForEach(cn5RefrigeratorSheets) { sheet in
                    CN5RefrigeratorSheetCard(sheet: sheet)
                }
            }
            
            // Ejemplos del Libro
            VStack(alignment: .leading, spacing: 16) {
                Label("Ejemplos del Libro", systemImage: "book.pages.fill")
                    .font(.headline)
                    .foregroundColor(.green)
                    .padding(.top)
                
                Text("Situaciones reales que Daniel Siegel narra en el libro")
                    .font(.caption)
                    .foregroundColor(.secondary)
                
                ForEach(cn5BookExamples) { example in
                    CN5BookExampleCard(example: example)
                }
            }
            
            // Preguntas de Reflexión
            VStack(alignment: .leading, spacing: 16) {
                Label("Preguntas de Reflexión", systemImage: "questionmark.circle.fill")
                    .font(.headline)
                    .foregroundColor(.orange)
                    .padding(.top)
                
                Text("Preguntas que el libro propone para auto-evaluación")
                    .font(.caption)
                    .foregroundColor(.secondary)
                
                ForEach(cn5ReflectionQuestions) { question in
                    CN5ReflectionCard(question: question)
                }
            }
        }
    }
}

// MARK: - Tab Button
struct CN5TabButton: View {
    let title: String
    let icon: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            VStack(spacing: 4) {
                Image(systemName: icon)
                    .font(.title3)
                Text(title)
                    .font(.caption)
                    .fontWeight(.medium)
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 12)
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .fill(isSelected ? Color.blue : Color.clear)
            )
            .foregroundColor(isSelected ? .white : .secondary)
        }
    }
}

// MARK: - Activity Card
struct CN5ActivityCard: View {
    let activity: CN5Activity
    
    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: activity.icon)
                .font(.system(size: 32))
                .foregroundColor(colorFromString(activity.color))
                .frame(width: 60, height: 60)
                .background(
                    Circle()
                        .fill(colorFromString(activity.color).opacity(0.2))
                )
            
            VStack(alignment: .leading, spacing: 6) {
                Text(activity.title)
                    .font(.headline)
                    .fontWeight(.bold)
                
                Text(activity.category)
                    .font(.subheadline)
                    .foregroundColor(colorFromString(activity.color))
                
                HStack(spacing: 12) {
                    Label(activity.frequency, systemImage: "calendar")
                        .font(.caption)
                        .foregroundColor(.secondary)
                    
                    Label(activity.duration, systemImage: "clock")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
            }
            
            Spacer()
            
            Image(systemName: "chevron.right.circle.fill")
                .foregroundColor(.blue.opacity(0.3))
                .font(.title2)
        }
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(.systemBackground))
                .shadow(radius: 4)
        )
    }
    
    private func colorFromString(_ colorName: String) -> Color {
        switch colorName {
        case "orange": return .orange
        case "blue": return .blue
        case "purple": return .purple
        case "teal": return .teal
        case "mint": return .mint
        case "pink": return .pink
        case "yellow": return .yellow
        case "indigo": return .indigo
        default: return .blue
        }
    }
}

// MARK: - Routine Card
struct CN5RoutineCard: View {
    let routine: CN5Routine
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Image(systemName: routine.icon)
                    .font(.title)
                    .foregroundColor(colorFromString(routine.color))
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(routine.title)
                        .font(.headline)
                        .fontWeight(.bold)
                    
                    Text(routine.timeOfDay)
                        .font(.subheadline)
                        .foregroundColor(colorFromString(routine.color))
                }
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .foregroundColor(.secondary)
            }
            
            Text(routine.description)
                .font(.body)
                .foregroundColor(.secondary)
                .lineLimit(2)
            
            HStack(spacing: 8) {
                ForEach(routine.strategiesIntegrated, id: \.self) { strategy in
                    Text("#\(strategy)")
                        .font(.caption)
                        .fontWeight(.bold)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(
                            Capsule()
                                .fill(Color.blue.opacity(0.2))
                        )
                        .foregroundColor(.blue)
                }
            }
        }
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(.systemBackground))
                .shadow(radius: 4)
        )
    }
    
    private func colorFromString(_ colorName: String) -> Color {
        switch colorName {
        case "orange": return .orange
        case "blue": return .blue
        case "purple": return .purple
        case "teal": return .teal
        case "mint": return .mint
        default: return .blue
        }
    }
}

// MARK: - Reminder Card
struct CN5ReminderCard: View {
    let reminder: CN5Reminder
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Text(reminder.moment)
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(.blue)
                
                Spacer()
                
                Text("#\(reminder.strategy)")
                    .font(.caption)
                    .fontWeight(.bold)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(Circle().fill(Color.blue.opacity(0.2)))
                    .foregroundColor(.blue)
            }
            
            Text(reminder.reminder)
                .font(.body)
                .foregroundColor(.primary)
            
            Divider()
            
            HStack(spacing: 8) {
                Image(systemName: "hand.point.right.fill")
                    .foregroundColor(.orange)
                
                Text(reminder.quickAction)
                    .font(.subheadline)
                    .foregroundColor(.orange)
                    .fontWeight(.medium)
            }
        }
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color(.systemBackground))
                .shadow(radius: 2)
        )
    }
}

// MARK: - Refrigerator Sheet Card
struct CN5RefrigeratorSheetCard: View {
    let sheet: CN5RefrigeratorSheet
    @State private var isExpanded = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Button(action: {
                withAnimation(.spring()) {
                    isExpanded.toggle()
                }
            }) {
                HStack {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Capítulo \(sheet.chapterNumber)")
                            .font(.caption)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.horizontal, 8)
                            .padding(.vertical, 4)
                            .background(Capsule().fill(Color.blue))
                        
                        Text(sheet.title)
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundColor(.primary)
                        
                        Text(sheet.subtitle)
                            .font(.subheadline)
                            .foregroundColor(.blue)
                    }
                    
                    Spacer()
                    
                    Image(systemName: isExpanded ? "chevron.up.circle.fill" : "chevron.down.circle.fill")
                        .foregroundColor(.blue)
                        .font(.title2)
                }
            }
            
            if isExpanded {
                Divider()
                
                VStack(alignment: .leading, spacing: 12) {
                    Text("Puntos Clave:")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                    
                    ForEach(Array(sheet.keyPoints.enumerated()), id: \.offset) { _, point in
                        HStack(alignment: .top, spacing: 8) {
                            Image(systemName: "brain.head.profile")
                                .foregroundColor(.blue)
                                .font(.caption)
                            Text(point)
                                .font(.body)
                                .fixedSize(horizontal: false, vertical: true)
                        }
                    }
                    
                    Divider()
                    
                    Text("Qué Hacer:")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .padding(.top, 8)
                    
                    ForEach(Array(sheet.whatToDo.enumerated()), id: \.offset) { index, action in
                        HStack(alignment: .top, spacing: 8) {
                            Text("\(index + 1)")
                                .font(.caption)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .frame(width: 20, height: 20)
                                .background(Circle().fill(Color.green))
                            Text(action)
                                .font(.body)
                                .fixedSize(horizontal: false, vertical: true)
                        }
                    }
                    
                    Text("Edades y Etapas:")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .padding(.top, 8)
                    
                    Text(sheet.agesAndStages)
                        .font(.body)
                        .foregroundColor(.secondary)
                        .italic()
                }
            }
        }
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(.systemBackground))
                .shadow(radius: 4)
        )
    }
}

// MARK: - Book Example Card
struct CN5BookExampleCard: View {
    let example: CN5BookExample
    @State private var isExpanded = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Button(action: {
                withAnimation(.spring()) {
                    isExpanded.toggle()
                }
            }) {
                HStack {
                    VStack(alignment: .leading, spacing: 4) {
                        Text(example.title)
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundColor(.primary)
                        
                        Text(example.pageReference)
                            .font(.caption)
                            .foregroundColor(.green)
                            .italic()
                    }
                    
                    Spacer()
                    
                    Image(systemName: isExpanded ? "chevron.up.circle.fill" : "chevron.down.circle.fill")
                        .foregroundColor(.green)
                        .font(.title2)
                }
            }
            
            if isExpanded {
                Divider()
                
                VStack(alignment: .leading, spacing: 12) {
                    Label("Situación", systemImage: "exclamationmark.triangle.fill")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.orange)
                    
                    Text(example.situation)
                        .font(.body)
                    
                    Label("Lo Que el Padre Hizo", systemImage: "person.fill.checkmark")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.blue)
                        .padding(.top, 8)
                    
                    Text(example.whatParentDid)
                        .font(.body)
                    
                    Label("Resultado", systemImage: "checkmark.circle.fill")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.green)
                        .padding(.top, 8)
                    
                    Text(example.result)
                        .font(.body)
                    
                    Label("Lección del Libro", systemImage: "lightbulb.fill")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.purple)
                        .padding(.top, 8)
                    
                    Text(example.lessonFromBook)
                        .font(.body)
                        .padding(12)
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color.purple.opacity(0.1))
                        )
                }
            }
        }
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(.systemBackground))
                .shadow(radius: 4)
        )
    }
}

// MARK: - Reflection Card
struct CN5ReflectionCard: View {
    let question: CN5ReflectionQuestion
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Label(question.category, systemImage: "tag.fill")
                .font(.caption)
                .foregroundColor(.orange)
            
            Text(question.question)
                .font(.body)
                .fontWeight(.medium)
                .foregroundColor(.primary)
            
            Text(question.purpose)
                .font(.caption)
                .foregroundColor(.secondary)
                .italic()
        }
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.orange.opacity(0.1))
        )
    }
}

// MARK: - Preview
struct CN5View_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CN5View()
        }
    }
}


