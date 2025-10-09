import SwiftUI

/// Vista principal de la Capa 9 - Círculo de Crecimiento
/// Dashboard final y celebración del viaje completo
struct TA9View: View {
    @State private var showingCertificate = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 32) {
                headerSection
                progressDashboard
                badgesGallery
                milestonesSection
                certificateSection
                finalMessageSection
            }
            .padding()
        }
        .background(
            LinearGradient(
                colors: [Color.pink.opacity(0.05), Color.mint.opacity(0.05), Color.yellow.opacity(0.05)],
                startPoint: .top,
                endPoint: .bottom
            )
        )
        .navigationTitle("Círculo de Crecimiento")
        .navigationBarTitleDisplayMode(.large)
        .sheet(isPresented: $showingCertificate) {
            TA9CertificateView()
        }
    }
    
    private var headerSection: some View {
        VStack(spacing: 16) {
            Image(systemName: "circle.hexagonpath.fill")
                .font(.system(size: 80))
                .foregroundStyle(
                    LinearGradient(
                        colors: [.pink, .mint, .yellow],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .symbolEffect(.pulse, options: .repeat(3))
            
            Text("¡Celebra Tu Viaje!")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(
                    LinearGradient(
                        colors: [.pink, .mint, .yellow],
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
                .multilineTextAlignment(.center)
            
            Text("Resumen de tu transformación en amor incondicional")
                .font(.title3)
                .fontWeight(.medium)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
        }
        .padding(.vertical)
    }
    
    private var progressDashboard: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Tu Progreso")
                .font(.title2)
                .fontWeight(.semibold)
            
            // Capas completadas
            VStack(spacing: 16) {
                ProgressRow(icon: "checkmark.circle.fill", title: "Capas completadas", value: "9/9", color: .green)
                ProgressRow(icon: "heart.fill", title: "Emociones validadas", value: "0", color: .pink)
                ProgressRow(icon: "book.pages.fill", title: "Cuentos leídos juntos", value: "0/6", color: .mint)
                ProgressRow(icon: "moon.stars.fill", title: "Rituales nocturnos", value: "0", color: .indigo)
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color(.systemBackground))
                    .shadow(color: Color.pink.opacity(0.1), radius: 10)
            )
        }
    }
    
    private var badgesGallery: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                Text("Galería de Logros")
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Spacer()
                
                Text("0/12")
                    .font(.headline)
                    .foregroundColor(.mint)
            }
            
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                ForEach(TA9Badge.createAllBadges()) { badge in
                    TA9BadgeView(badge: badge)
                }
            }
        }
    }
    
    private var milestonesSection: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Hitos del Viaje")
                .font(.title2)
                .fontWeight(.semibold)
            
            VStack(spacing: 12) {
                ForEach(TA9Milestone.allMilestones) { milestone in
                    TA9MilestoneCard(milestone: milestone)
                }
            }
        }
    }
    
    private var certificateSection: some View {
        VStack(spacing: 16) {
            Text("Certificado de Maestría")
                .font(.title2)
                .fontWeight(.semibold)
            
            Button(action: { showingCertificate = true }) {
                VStack(spacing: 16) {
                    Image(systemName: "rosette")
                        .font(.system(size: 60))
                        .foregroundStyle(LinearGradient(colors: [.yellow, .orange], startPoint: .topLeading, endPoint: .bottomTrailing))
                    
                    Text("Ver Tu Certificado")
                        .font(.headline)
                        .foregroundColor(.primary)
                    
                    Text("Maestro del Amor Incondicional")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                .padding(.vertical, 24)
                .frame(maxWidth: .infinity)
                .background(
                    RoundedRectangle(cornerRadius: 16)
                        .fill(LinearGradient(colors: [Color.yellow.opacity(0.15), Color.orange.opacity(0.1)], startPoint: .topLeading, endPoint: .bottomTrailing))
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(LinearGradient(colors: [.yellow, .orange], startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 2)
                        )
                )
            }
        }
    }
    
    private var finalMessageSection: some View {
        VStack(spacing: 20) {
            Image(systemName: "heart.circle.fill")
                .font(.system(size: 60))
                .foregroundStyle(LinearGradient(colors: [.pink, .mint], startPoint: .topLeading, endPoint: .bottomTrailing))
            
            VStack(spacing: 12) {
                Text("\"Te amo ahora y para siempre, en todas tus emociones.\"")
                    .font(.title2)
                    .fontWeight(.medium)
                    .foregroundColor(.primary)
                    .multilineTextAlignment(.center)
                    .italic()
                
                Text("— Erin Winters")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                Divider()
                    .padding(.vertical)
                
                Text("Has completado este viaje de transformación. El amor incondicional es ahora parte de tu crianza diaria. Continúa practicando, celebrando y amando a tu hijo en cada emoción.")
                    .font(.body)
                    .foregroundColor(.primary)
                    .multilineTextAlignment(.center)
            }
            .padding(.vertical, 24)
            .padding(.horizontal, 20)
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(
                        LinearGradient(
                            colors: [Color.pink.opacity(0.1), Color.mint.opacity(0.1)],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(
                                LinearGradient(
                                    colors: [.pink, .mint],
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                ),
                                lineWidth: 2
                            )
                    )
            )
            .shadow(color: Color.pink.opacity(0.15), radius: 15)
        }
        .padding(.top)
    }
}

// MARK: - Components
struct ProgressRow: View {
    let icon: String
    let title: String
    let value: String
    let color: Color
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(color)
                .frame(width: 30)
            
            Text(title)
                .font(.subheadline)
                .foregroundColor(.primary)
            
            Spacer()
            
            Text(value)
                .font(.headline)
                .foregroundColor(color)
        }
    }
}

struct TA9BadgeView: View {
    let badge: TA9Badge
    
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: badge.iconName)
                .font(.largeTitle)
                .foregroundColor(badge.unlocked ? Color(badge.color) : .gray.opacity(0.3))
            
            Text(badge.title)
                .font(.caption2)
                .fontWeight(.semibold)
                .foregroundColor(.primary)
                .multilineTextAlignment(.center)
                .lineLimit(2)
                .frame(height: 32)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 12)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(badge.unlocked ? Color(badge.color).opacity(0.15) : Color.gray.opacity(0.05))
        )
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(badge.unlocked ? Color(badge.color).opacity(0.4) : Color.gray.opacity(0.2), lineWidth: 1)
        )
        .grayscale(badge.unlocked ? 0 : 0.9)
    }
}

struct TA9MilestoneCard: View {
    let milestone: TA9Milestone
    
    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: milestone.achieved ? "checkmark.circle.fill" : "circle")
                .font(.title)
                .foregroundColor(milestone.achieved ? .green : .gray.opacity(0.3))
            
            VStack(alignment: .leading, spacing: 4) {
                Text(milestone.title)
                    .font(.headline)
                    .foregroundColor(.primary)
                
                Text(milestone.milestoneDescription)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color(.systemBackground))
        )
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(milestone.achieved ? Color.green.opacity(0.3) : Color.gray.opacity(0.2), lineWidth: 1)
        )
    }
}

