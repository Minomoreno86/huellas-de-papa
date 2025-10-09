import SwiftUI

// MARK: - Activity Card
struct TA5ActivityCard: View {
    let activity: TA5Activity
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Image(systemName: activity.iconName)
                    .font(.title2)
                    .foregroundColor(.white)
                    .frame(width: 44, height: 44)
                    .background(Circle().fill(LinearGradient(colors: [.pink, .mint], startPoint: .topLeading, endPoint: .bottomTrailing)))
                
                Spacer()
                
                Text(activity.frequency.rawValue)
                    .font(.caption)
                    .foregroundColor(.mint)
            }
            
            Text(activity.title)
                .font(.headline)
                .foregroundColor(.primary)
            
            Text(activity.description)
                .font(.subheadline)
                .foregroundColor(.secondary)
                .lineLimit(2)
            
            HStack {
                Label(activity.durationMinutes, systemImage: "clock")
                Spacer()
                if activity.fromBook {
                    Label("Del libro", systemImage: "book.fill")
                }
            }
            .font(.caption)
            .foregroundColor(.pink)
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 16).fill(Color(.systemBackground)).shadow(color: Color.pink.opacity(0.1), radius: 8))
        .overlay(RoundedRectangle(cornerRadius: 16).stroke(LinearGradient(colors: [.pink.opacity(0.3), .mint.opacity(0.2)], startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 1))
    }
}

// MARK: - Routine Card
struct TA5RoutineCard: View {
    let routine: TA5Routine
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Image(systemName: routine.iconName)
                    .font(.title2)
                    .foregroundColor(.white)
                    .frame(width: 44, height: 44)
                    .background(Circle().fill(LinearGradient(colors: [.mint, .pink], startPoint: .topLeading, endPoint: .bottomTrailing)))
                
                Spacer()
                
                Text(routine.timeOfDay.rawValue)
                    .font(.caption)
                    .foregroundColor(.white)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 4)
                    .background(Capsule().fill(Color.pink))
            }
            
            Text(routine.title)
                .font(.headline)
                .foregroundColor(.primary)
            
            Text(routine.description)
                .font(.subheadline)
                .foregroundColor(.secondary)
                .lineLimit(2)
            
            Label(routine.durationMinutes, systemImage: "clock")
                .font(.caption)
                .foregroundColor(.mint)
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 16).fill(Color(.systemBackground)).shadow(color: Color.mint.opacity(0.1), radius: 8))
        .overlay(RoundedRectangle(cornerRadius: 16).stroke(LinearGradient(colors: [.mint.opacity(0.3), .pink.opacity(0.2)], startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 1))
    }
}

// MARK: - Reminder Card
struct TA5ReminderCard: View {
    let reminder: TA5Reminder
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Image(systemName: reminder.iconName)
                    .font(.title2)
                    .foregroundColor(.pink)
                
                VStack(alignment: .leading) {
                    Text(reminder.title)
                        .font(.headline)
                        .foregroundColor(.primary)
                    
                    Text(reminder.whenToUse)
                        .font(.caption)
                        .foregroundColor(.mint)
                }
                
                Spacer()
            }
            
            Text(reminder.message)
                .font(.subheadline)
                .foregroundColor(.primary)
            
            Text("\"\(reminder.bookQuote)\"")
                .font(.caption)
                .italic()
                .foregroundColor(.secondary)
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(RoundedRectangle(cornerRadius: 8).fill(Color.pink.opacity(0.1)))
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 16).fill(Color(.systemBackground)).shadow(color: Color.pink.opacity(0.1), radius: 6))
        .overlay(RoundedRectangle(cornerRadius: 16).stroke(Color.pink.opacity(0.3), lineWidth: 1))
    }
}

