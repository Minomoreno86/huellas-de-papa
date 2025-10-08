import SwiftUI

/// Tarjeta visual para mostrar un desencadenante ("botón") del volcán
struct TV2TriggerCard: View {
    let trigger: TV2Trigger
    @State private var isExpanded = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            // Header
            Button {
                withAnimation(.spring()) {
                    isExpanded.toggle()
                }
            } label: {
                HStack {
                    Image(systemName: trigger.iconName)
                        .font(.title2)
                        .foregroundColor(.red)
                        .frame(width: 50, height: 50)
                        .background(
                            Circle()
                                .fill(Color.red.opacity(0.1))
                        )
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text(trigger.name)
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundColor(.primary)
                        
                        Text(trigger.description)
                            .font(.caption)
                            .foregroundColor(.secondary)
                            .lineLimit(isExpanded ? nil : 2)
                    }
                    
                    Spacer()
                    
                    Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
                        .foregroundColor(.secondary)
                        .font(.caption)
                }
            }
            
            if isExpanded {
                Divider()
                
                // Ejemplos comunes
                VStack(alignment: .leading, spacing: 12) {
                    Text("Ejemplos comunes:")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.red)
                    
                    ForEach(trigger.commonExamples, id: \.self) { example in
                        HStack(alignment: .top, spacing: 8) {
                            Image(systemName: "circle.fill")
                                .font(.system(size: 6))
                                .foregroundColor(.red)
                                .padding(.top, 6)
                            
                            Text(example)
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                    }
                }
                
                Divider()
                
                // Perspectiva del niño
                VStack(alignment: .leading, spacing: 8) {
                    HStack {
                        Image(systemName: "quote.opening")
                            .foregroundColor(.orange)
                            .font(.caption)
                        
                        Text("Lo que siente el niño:")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundColor(.orange)
                    }
                    
                    Text(trigger.childPerspective)
                        .font(.caption)
                        .foregroundColor(.secondary)
                        .italic()
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color.orange.opacity(0.1))
                        )
                }
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(.systemBackground))
                .shadow(color: Color.black.opacity(0.1), radius: 8, x: 0, y: 2)
        )
    }
}

#Preview {
    ScrollView {
        VStack {
            ForEach(TV2Data.triggers) { trigger in
                TV2TriggerCard(trigger: trigger)
            }
        }
        .padding()
    }
    .background(Color(.systemGroupedBackground))
}

