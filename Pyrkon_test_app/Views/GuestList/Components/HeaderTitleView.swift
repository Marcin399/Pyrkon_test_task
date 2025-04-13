import SwiftUI

struct HeaderTitleView: View {
    let progress: CGFloat
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text("Lista gości")
                    .font(.title.bold())
                    .foregroundStyle(.white)
            }
        }
        .frame(height: 60 - (60 * progress), alignment: .bottom)
        .padding(.horizontal, 15)
        .padding(.top, 15)
        .padding(.bottom, 15 - (15 * progress))
        .opacity(1 - progress)
        .offset(y: -10 * progress)
    }
} 
