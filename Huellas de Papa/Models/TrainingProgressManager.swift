import Foundation
import SwiftUI
import UserNotifications

// MARK: - SISTEMA DE PERSISTENCIA PARA CAPA 6
/// Manager completo para persistir el progreso del Plan de Entrenamiento de 28 días

// MARK: - Estructura de Progreso del Usuario
struct UserTrainingProgress: Codable {
    var currentDay: Int
    var currentPhase: Int
    var completedDays: [Int]
    var streak: Int
    var totalProgress: Double
    var startDate: Date?
    var lastActivityDate: Date?
    var reflections: [DayReflection]
    var rewards: [RewardEarned]
    var phaseProgress: [PhaseProgress]
    
    init() {
        self.currentDay = 1
        self.currentPhase = 1
        self.completedDays = []
        self.streak = 0
        self.totalProgress = 0.0
        self.startDate = nil
        self.lastActivityDate = nil
        self.reflections = []
        self.rewards = []
        self.phaseProgress = []
    }
}


// MARK: - Progreso por Fase
struct PhaseProgress: Codable, Identifiable {
    let id: UUID
    let phaseNumber: Int
    let phaseName: String
    let completedDays: [Int]
    let startDate: Date?
    let endDate: Date?
    let totalDays: Int
    let progress: Double
    
    init(phaseNumber: Int, phaseName: String, totalDays: Int) {
        self.id = UUID()
        self.phaseNumber = phaseNumber
        self.phaseName = phaseName
        self.completedDays = []
        self.startDate = nil
        self.endDate = nil
        self.totalDays = totalDays
        self.progress = 0.0
    }
}

// MARK: - Training Progress Manager
class TrainingProgressManager: ObservableObject {
    @Published var userProgress: UserTrainingProgress
    @Published var isFirstTime: Bool = true
    @Published var notificationsEnabled: Bool = true
    @Published var reminderTime: Date = Calendar.current.date(bySettingHour: 20, minute: 0, second: 0, of: Date()) ?? Date()
    
    private let userDefaults = UserDefaults.standard
    private let progressKey = "TrainingProgress"
    private let firstTimeKey = "IsFirstTime"
    private let notificationsKey = "NotificationsEnabled"
    private let reminderTimeKey = "ReminderTime"
    
    init() {
        self.userProgress = UserTrainingProgress()
        loadProgress()
    }
    
    // MARK: - Persistencia Principal
    
    func saveProgress() {
        do {
            let data = try JSONEncoder().encode(userProgress)
            userDefaults.set(data, forKey: progressKey)
            userDefaults.set(isFirstTime, forKey: firstTimeKey)
            userDefaults.set(notificationsEnabled, forKey: notificationsKey)
            userDefaults.set(reminderTime, forKey: reminderTimeKey)
            print("✅ Progreso guardado exitosamente")
        } catch {
            print("❌ Error guardando progreso: \(error)")
        }
    }
    
    private func loadProgress() {
        // Cargar progreso del usuario
        if let data = userDefaults.data(forKey: progressKey) {
            do {
                userProgress = try JSONDecoder().decode(UserTrainingProgress.self, from: data)
                print("✅ Progreso cargado exitosamente")
            } catch {
                print("❌ Error cargando progreso: \(error)")
                userProgress = UserTrainingProgress()
            }
        }
        
        // Cargar configuraciones
        isFirstTime = userDefaults.object(forKey: firstTimeKey) as? Bool ?? true
        notificationsEnabled = userDefaults.object(forKey: notificationsKey) as? Bool ?? true
        
        if let savedTime = userDefaults.object(forKey: reminderTimeKey) as? Date {
            reminderTime = savedTime
        }
    }
    
    // MARK: - Gestión del Progreso
    
    func startTraining() {
        userProgress.startDate = Date()
        userProgress.currentDay = 1
        userProgress.currentPhase = 1
        isFirstTime = false
        saveProgress()
    }
    
    func completeDay(_ dayNumber: Int) {
        if !userProgress.completedDays.contains(dayNumber) {
            userProgress.completedDays.append(dayNumber)
            userProgress.streak += 1
            userProgress.lastActivityDate = Date()
            updateProgress()
            saveProgress()
        }
    }
    
    func addReflection(_ reflection: DayReflection) {
        // Remover reflexión anterior del mismo día si existe
        userProgress.reflections.removeAll { $0.dayNumber == reflection.dayNumber }
        userProgress.reflections.append(reflection)
        saveProgress()
    }
    
    func addReward(_ reward: RewardEarned) {
        userProgress.rewards.append(reward)
        saveProgress()
    }
    
    private func updateProgress() {
        userProgress.totalProgress = Double(userProgress.completedDays.count) / 28.0
        
        // Actualizar fase actual
        if userProgress.currentDay <= 7 {
            userProgress.currentPhase = 1
        } else if userProgress.currentDay <= 14 {
            userProgress.currentPhase = 2
        } else if userProgress.currentDay <= 21 {
            userProgress.currentPhase = 3
        } else {
            userProgress.currentPhase = 4
        }
        
        // Actualizar progreso por fase
        updatePhaseProgress()
    }
    
    private func updatePhaseProgress() {
        let phaseDays = [
            (1, 1...7),
            (2, 8...14),
            (3, 15...21),
            (4, 22...28)
        ]
        
        for (phaseNumber, dayRange) in phaseDays {
            let completedInPhase = userProgress.completedDays.filter { dayRange.contains($0) }
            
            if let existingPhase = userProgress.phaseProgress.first(where: { $0.phaseNumber == phaseNumber }) {
                // Actualizar fase existente
                if let index = userProgress.phaseProgress.firstIndex(where: { $0.phaseNumber == phaseNumber }) {
                    userProgress.phaseProgress[index] = PhaseProgress(
                        phaseNumber: phaseNumber,
                        phaseName: getPhaseName(phaseNumber),
                        totalDays: dayRange.count
                    )
                }
            } else {
                // Crear nueva fase
                let newPhase = PhaseProgress(
                    phaseNumber: phaseNumber,
                    phaseName: getPhaseName(phaseNumber),
                    totalDays: dayRange.count
                )
                userProgress.phaseProgress.append(newPhase)
            }
        }
    }
    
    private func getPhaseName(_ phaseNumber: Int) -> String {
        switch phaseNumber {
        case 1: return "Conecta"
        case 2: return "Regula"
        case 3: return "Guía"
        case 4: return "Integra"
        default: return "Desconocida"
        }
    }
    
    // MARK: - Funciones de Consulta
    
    func getReflection(for dayNumber: Int) -> DayReflection? {
        return userProgress.reflections.first { $0.dayNumber == dayNumber }
    }
    
    func getRewards(for dayNumber: Int) -> [RewardEarned] {
        return userProgress.rewards.filter { $0.dayNumber == dayNumber }
    }
    
    func isDayCompleted(_ dayNumber: Int) -> Bool {
        return userProgress.completedDays.contains(dayNumber)
    }
    
    func getPhaseProgress(_ phaseNumber: Int) -> Double {
        let phaseDays = getPhaseDays(phaseNumber)
        let completedInPhase = userProgress.completedDays.filter { phaseDays.contains($0) }
        return Double(completedInPhase.count) / Double(phaseDays.count)
    }
    
    private func getPhaseDays(_ phaseNumber: Int) -> [Int] {
        switch phaseNumber {
        case 1: return Array(1...7)
        case 2: return Array(8...14)
        case 3: return Array(15...21)
        case 4: return Array(22...28)
        default: return []
        }
    }
    
    // MARK: - Estadísticas
    
    func getTrainingStats() -> TrainingStats {
        let totalDays = userProgress.completedDays.count
        let currentStreak = userProgress.streak
        let totalReflections = userProgress.reflections.count
        let totalRewards = userProgress.rewards.count
        
        return TrainingStats(
            totalDaysCompleted: totalDays,
            currentStreak: currentStreak,
            totalReflections: totalReflections,
            totalRewards: totalRewards,
            startDate: userProgress.startDate,
            lastActivityDate: userProgress.lastActivityDate
        )
    }
    
    // MARK: - Configuración de Notificaciones
    
    func updateReminderTime(_ time: Date) {
        reminderTime = time
        saveProgress()
        scheduleNotification()
    }
    
    func toggleNotifications(_ enabled: Bool) {
        notificationsEnabled = enabled
        saveProgress()
        
        if enabled {
            scheduleNotification()
        } else {
            cancelNotifications()
        }
    }
    
    private func scheduleNotification() {
        guard notificationsEnabled else { return }
        
        // Cancelar notificaciones existentes
        cancelNotifications()
        
        // Programar nueva notificación
        let content = UNMutableNotificationContent()
        content.title = "🌱 Plan de Entrenamiento"
        content.body = "Es hora de tu práctica diaria de conexión emocional"
        content.sound = .default
        
        let calendar = Calendar.current
        let components = calendar.dateComponents([.hour, .minute], from: reminderTime)
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: components, repeats: true)
        let request = UNNotificationRequest(identifier: "dailyTraining", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("❌ Error programando notificación: \(error)")
            } else {
                print("✅ Notificación programada para \(self.reminderTime)")
            }
        }
    }
    
    private func cancelNotifications() {
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
    }
    
    // MARK: - Reset del Progreso
    
    func resetProgress() {
        userProgress = UserTrainingProgress()
        saveProgress()
    }
    
    func resetToDay(_ dayNumber: Int) {
        userProgress.currentDay = dayNumber
        userProgress.completedDays = userProgress.completedDays.filter { $0 < dayNumber }
        userProgress.streak = userProgress.completedDays.count
        updateProgress()
        saveProgress()
    }
}

// MARK: - Estadísticas de Entrenamiento
struct TrainingStats {
    let totalDaysCompleted: Int
    let currentStreak: Int
    let totalReflections: Int
    let totalRewards: Int
    let startDate: Date?
    let lastActivityDate: Date?
    
    var completionPercentage: Double {
        return Double(totalDaysCompleted) / 28.0
    }
    
    var averageMoodRating: Double {
        // Esta función se implementaría con datos reales de las reflexiones
        return 4.0 // Valor simulado
    }
}

// MARK: - Extensión para Notificaciones
import UserNotifications

extension TrainingProgressManager {
    func requestNotificationPermission() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            if granted {
                print("✅ Permisos de notificación concedidos")
            } else {
                print("❌ Permisos de notificación denegados: \(error?.localizedDescription ?? "Desconocido")")
            }
        }
    }
}
