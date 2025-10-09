import SwiftUI

/// Vista del certificado de maestría
struct TA9CertificateView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 32) {
                    // Diseño del certificado
                    VStack(spacing: 24) {
                        // Header
                        VStack(spacing: 16) {
                            Image(systemName: "rosette")
                                .font(.system(size: 100))
                                .foregroundStyle(
                                    LinearGradient(
                                        colors: [.yellow, .orange, .pink],
                                        startPoint: .topLeading,
                                        endPoint: .bottomTrailing
                                    )
                                )
                            
                            Text("Certificado de Maestría")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .multilineTextAlignment(.center)
                        }
                        
                        Divider()
                        
                        // Contenido del certificado
                        VStack(spacing: 20) {
                            Text("Se certifica que")
                                .font(.headline)
                                .foregroundColor(.secondary)
                            
                            Text("[Tu Nombre]")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundStyle(
                                    LinearGradient(
                                        colors: [.pink, .mint],
                                        startPoint: .leading,
                                        endPoint: .trailing
                                    )
                                )
                            
                            Text("ha completado exitosamente el módulo")
                                .font(.headline)
                                .foregroundColor(.secondary)
                            
                            Text("\"Te Amo Cuando Estás Enojado\"")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(.pink)
                                .multilineTextAlignment(.center)
                            
                            Text("Por Erin Winters")
                                .font(.subheadline)
                                .italic()
                                .foregroundColor(.secondary)
                            
                            Divider()
                                .padding(.vertical)
                            
                            Text("Maestro del Amor Incondicional")
                                .font(.title3)
                                .fontWeight(.semibold)
                                .foregroundStyle(
                                    LinearGradient(
                                        colors: [.yellow, .orange],
                                        startPoint: .leading,
                                        endPoint: .trailing
                                    )
                                )
                            
                            VStack(spacing: 12) {
                                Text("Has aprendido a:")
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                                
                                VStack(alignment: .leading, spacing: 8) {
                                    CertificateCheckmark(text: "Validar todas las emociones de tu hijo")
                                    CertificateCheckmark(text: "Mantener el amor visible en momentos difíciles")
                                    CertificateCheckmark(text: "Respetar la autonomía emocional")
                                    CertificateCheckmark(text: "Practicar rituales de conexión")
                                    CertificateCheckmark(text: "Modelar humanidad compartida")
                                }
                            }
                            
                            Divider()
                                .padding(.vertical)
                            
                            VStack(spacing: 8) {
                                Text("\"Te amo ahora y para siempre\"")
                                    .font(.title3)
                                    .italic()
                                    .foregroundColor(.primary)
                                    .multilineTextAlignment(.center)
                                
                                Text("— Erin Winters")
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                            }
                            
                            Text("Fecha: \(Date().formatted(date: .long, time: .omitted))")
                                .font(.caption)
                                .foregroundColor(.secondary)
                                .padding(.top)
                        }
                    }
                    .padding(32)
                    .background(
                        RoundedRectangle(cornerRadius: 24)
                            .fill(Color(.systemBackground))
                            .shadow(color: Color.pink.opacity(0.2), radius: 20)
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: 24)
                            .stroke(
                                LinearGradient(
                                    colors: [.yellow, .orange, .pink, .mint],
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                ),
                                lineWidth: 3
                            )
                    )
                }
                .padding()
            }
            .background(Color(.systemGroupedBackground))
            .navigationTitle("Certificado")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Cerrar") {
                        dismiss()
                    }
                }
            }
        }
    }
}

struct CertificateCheckmark: View {
    let text: String
    
    var body: some View {
        HStack(spacing: 8) {
            Image(systemName: "checkmark.seal.fill")
                .foregroundColor(.green)
            
            Text(text)
                .font(.subheadline)
                .foregroundColor(.primary)
        }
    }
}

