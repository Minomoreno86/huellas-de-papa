import SwiftUI

/// Modal de recompensa que aparece al completar un día del entrenamiento
struct YBTrainingRewardModal: View {
    let day: YBTrainingDay
    let onDismiss: () -> Void
    
    @State private var showLeaf = false
    @State private var leafScale: CGFloat = 0.0
    @State private var showText = false
    
    var body: some View {
        ZStack {
            // Background blur
            Color.black.opacity(0.4)
                .ignoresSafeArea()
            
            // Content
            VStack(spacing: 24) {
                Spacer()
                
                // Animated Leaf
                ZStack {
                    Circle()
                        .fill(
                            LinearGradient(
                                colors: [phaseColor.opacity(0.2), phaseColor.opacity(0.05)],
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        )
                        .frame(width: 200, height: 200)
                        .scaleEffect(showLeaf ? 1.0 : 0.0)
                    
                    Image(systemName: "leaf.fill")
                        .font(.system(size: 80))
                        .foregroundStyle(
                            LinearGradient(
                                colors: [phaseColor, phaseColor.opacity(0.7)],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .scaleEffect(leafScale)
                        .rotation3DEffect(
                            .degrees(showLeaf ? 360 : 0),
                            axis: (x: 0, y: 1, z: 0)
                        )
                }
                
                if showText {
                    VStack(spacing: 16) {
                        Text("¡Día \(day.dayNumber) completado!")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.primary)
                            .multilineTextAlignment(.center)
                        
                        Text(day.rewardPhrase)
                            .font(.body)
                            .foregroundColor(.secondary)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                        
                        // Phase Badge
                        HStack(spacing: 8) {
                            Image(systemName: day.icon)
                                .font(.caption)
                            
                            Text(day.phase)
                                .font(.subheadline)
                                .fontWeight(.semibold)
                        }
                        .foregroundColor(phaseColor)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .fill(phaseColor.opacity(0.2))
                        )
                    }
                    .transition(.opacity.combined(with: .move(edge: .bottom)))
                }
                
                Spacer()
                
                // Continue Button
                if showText {
                    Button(action: {
                        #if !os(macOS)
                        UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                        #endif
                        onDismiss()
                    }) {
                        HStack {
                            Text("Continuar")
                                .font(.headline)
                            
                            Image(systemName: "arrow.right.circle.fill")
                                .font(.title3)
                        }
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 16)
                                .fill(
                                    LinearGradient(
                                        colors: [phaseColor, phaseColor.opacity(0.8)],
                                        startPoint: .leading,
                                        endPoint: .trailing
                                    )
                                )
                        )
                    }
                    .padding(.horizontal)
                    .transition(.opacity.combined(with: .move(edge: .bottom)))
                }
            }
            .padding()
        }
        .onAppear {
            startAnimation()
        }
    }
    
    // MARK: - Animation
    private func startAnimation() {
        // Leaf grows
        withAnimation(.spring(response: 0.6, dampingFraction: 0.6)) {
            showLeaf = true
            leafScale = 1.0
        }
        
        // Text appears
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
            withAnimation(.easeOut(duration: 0.5)) {
                showText = true
            }
        }
        
        // Haptic feedback
        #if !os(macOS)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            UINotificationFeedbackGenerator().notificationOccurred(.success)
        }
        #endif
    }
    
    // MARK: - Helpers
    private var phaseColor: Color {
        switch day.color {
        case "blue": return .blue
        case "green": return .green
        case "orange": return .orange
        case "pink": return .pink
        default: return .blue
        }
    }
}

// MARK: - Preview
struct YBTrainingRewardModal_Previews: PreviewProvider {
    static var previews: some View {
        YBTrainingRewardModal(
            day: YBTrainingData.createTrainingDays()[0],
            onDismiss: {}
        )
    }
}

