import SwiftUI

// MARK: - Badge Unlock Animation View
// Vista de celebración cuando se desbloquea un nuevo badge
// SuperDesign: Animación emocional y gratificante

struct BadgeUnlockView: View {
    let badge: Capa9Badge
    @Binding var isPresented: Bool
    
    @State private var scale: CGFloat = 0.5
    @State private var opacity: Double = 0
    @State private var rotation: Double = -180
    @State private var glowIntensity: Double = 0
    @State private var confettiOpacity: Double = 0
    @State private var badgeOffset: CGFloat = 100
    
    var body: some View {
        ZStack {
            // Fondo semi-transparente con blur
            Color.black.opacity(0.4)
                .ignoresSafeArea()
                .onTapGesture {
                    dismiss()
                }
            
            VStack(spacing: 24) {
                // Confetti Effect (símbolos flotantes)
                ZStack {
                    ForEach(0..<20, id: \.self) { index in
                        ConfettiParticle(index: index, show: confettiOpacity > 0)
                    }
                }
                .frame(height: 300)
                .opacity(confettiOpacity)
                
                // Badge Icon con Glow
                ZStack {
                    // Glow exterior
                    Circle()
                        .fill(
                            RadialGradient(
                                colors: [
                                    badge.category.color.opacity(glowIntensity * 0.6),
                                    badge.category.color.opacity(0)
                                ],
                                center: .center,
                                startRadius: 60,
                                endRadius: 120
                            )
                        )
                        .frame(width: 240, height: 240)
                        .scaleEffect(glowIntensity)
                    
                    // Badge principal
                    Circle()
                        .fill(
                            LinearGradient(
                                colors: [
                                    badge.category.color,
                                    badge.category.color.opacity(0.7)
                                ],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .frame(width: 120, height: 120)
                        .overlay(
                            Image(systemName: badge.symbol)
                                .font(.system(size: 50, weight: .bold))
                                .foregroundColor(.white)
                        )
                        .shadow(color: badge.category.color.opacity(0.6), radius: 20, x: 0, y: 10)
                }
                .scaleEffect(scale)
                .rotationEffect(.degrees(rotation))
                .offset(y: badgeOffset)
                
                // Información del Badge
                VStack(spacing: 12) {
                    Text("🎉 ¡Logro Desbloqueado! 🎉")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Text(badge.name)
                        .font(.title)
                        .fontWeight(.heavy)
                        .foregroundColor(badge.category.color)
                    
                    Text(badge.meaning)
                        .font(.body)
                        .foregroundColor(.white.opacity(0.9))
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 32)
                    
                    // Badge Category
                    HStack(spacing: 8) {
                        Image(systemName: badge.category.icon)
                            .font(.caption)
                        Text(badge.category.rawValue)
                            .font(.caption)
                            .fontWeight(.semibold)
                    }
                    .foregroundColor(.white.opacity(0.8))
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
                    .background(
                        Capsule()
                            .fill(badge.category.color.opacity(0.3))
                    )
                }
                .opacity(opacity)
                .offset(y: badgeOffset)
                
                // Botón de cierre
                Button(action: dismiss) {
                    Text("Continuar")
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(width: 200)
                        .padding(.vertical, 16)
                        .background(
                            RoundedRectangle(cornerRadius: 16, style: .continuous)
                                .fill(
                                    LinearGradient(
                                        colors: [badge.category.color, badge.category.color.opacity(0.8)],
                                        startPoint: .leading,
                                        endPoint: .trailing
                                    )
                                )
                                .shadow(color: badge.category.color.opacity(0.5), radius: 10, x: 0, y: 5)
                        )
                }
                .opacity(opacity)
                .scaleEffect(scale)
                .padding(.top, 20)
            }
            .padding()
        }
        .onAppear {
            startAnimation()
            playHaptics()
        }
    }
    
    // MARK: - Animation Sequence
    
    private func startAnimation() {
        // Fase 1: Badge aparece con bounce (0-0.6s)
        withAnimation(.spring(response: 0.6, dampingFraction: 0.6)) {
            scale = 1.0
            opacity = 1.0
            badgeOffset = 0
        }
        
        withAnimation(.easeOut(duration: 0.6)) {
            rotation = 0
        }
        
        // Fase 2: Glow pulse (0.2-1.0s)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            withAnimation(.easeInOut(duration: 0.8).repeatForever(autoreverses: true)) {
                glowIntensity = 1.0
            }
        }
        
        // Fase 3: Confetti (0.3s)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            withAnimation(.easeIn(duration: 0.5)) {
                confettiOpacity = 1.0
            }
        }
    }
    
    private func playHaptics() {
        // Háptico fuerte inicial
        let impact = UIImpactFeedbackGenerator(style: .heavy)
        impact.impactOccurred()
        
        // Hápticos secundarios
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            let notification = UINotificationFeedbackGenerator()
            notification.notificationOccurred(.success)
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
            let impact2 = UIImpactFeedbackGenerator(style: .medium)
            impact2.impactOccurred()
        }
    }
    
    private func dismiss() {
        withAnimation(.easeOut(duration: 0.3)) {
            scale = 0.8
            opacity = 0
            confettiOpacity = 0
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            isPresented = false
        }
    }
}

// MARK: - Confetti Particle

private struct ConfettiParticle: View {
    let index: Int
    let show: Bool
    
    @State private var offset: CGSize = .zero
    @State private var opacity: Double = 1
    @State private var rotation: Double = 0
    
    private let symbols = ["star.fill", "heart.fill", "sparkles", "leaf.fill", "circle.fill"]
    private let colors: [Color] = [.yellow, .orange, .pink, .purple, .blue, .green, .red]
    
    var body: some View {
        Image(systemName: symbols[index % symbols.count])
            .font(.system(size: CGFloat.random(in: 12...24)))
            .foregroundColor(colors[index % colors.count])
            .offset(offset)
            .opacity(opacity)
            .rotationEffect(.degrees(rotation))
            .onAppear {
                if show {
                    animateParticle()
                }
            }
    }
    
    private func animateParticle() {
        let randomX = CGFloat.random(in: -150...150)
        let randomY = CGFloat.random(in: -200...200)
        let duration = Double.random(in: 1.5...3.0)
        let delay = Double(index) * 0.05
        
        withAnimation(.easeOut(duration: duration).delay(delay)) {
            offset = CGSize(width: randomX, height: randomY)
            opacity = 0
            rotation = Double.random(in: -360...360)
        }
    }
}

// MARK: - Badge Unlock Modifier

extension View {
    /// Modifier para mostrar la animación de badge desbloqueado
    func badgeUnlockOverlay(badge: Binding<Capa9Badge?>, isPresented: Binding<Bool>) -> some View {
        self.overlay {
            if let badge = badge.wrappedValue, isPresented.wrappedValue {
                BadgeUnlockView(badge: badge, isPresented: isPresented)
                    .transition(.opacity.combined(with: .scale))
                    .zIndex(999)
            }
        }
    }
}

// MARK: - Preview

#Preview {
    ZStack {
        Color.blue.ignoresSafeArea()
        
        BadgeUnlockView(
            badge: Capa9Badge(
                name: "Escucha Activa",
                meaning: "Has desarrollado la capacidad de escuchar con el corazón",
                symbol: "ear.fill",
                category: .empathy,
                isUnlocked: true
            ),
            isPresented: .constant(true)
        )
    }
}

