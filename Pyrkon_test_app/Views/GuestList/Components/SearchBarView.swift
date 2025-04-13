import SwiftUI

struct SearchBarView: View {
    @ObservedObject var viewModel: GuestListViewModel
    var isFocused: FocusState<Bool>.Binding
    
    var body: some View {
        HStack(spacing: 8) {
            TextField("Szukaj", text: $viewModel.searchText)
                .focused(isFocused)
                .foregroundStyle(.white)
                .tint(.white)
                .accentColor(.white)
                .textFieldStyle(PlainTextFieldStyle())
                .colorScheme(.dark)
            Button {
            } label: {
                Image(systemName: "magnifyingglass")
                    .foregroundStyle(.white.opacity(0.5))
            }
        }
        .padding(.vertical, 15)
        .padding(.horizontal, 15)
        .background {
            RoundedRectangle(cornerRadius: isFocused.wrappedValue ? 0 : 15)
                .fill(isFocused.wrappedValue ? Color.Theme.unselectedZone.opacity(0.99)
                   .shadow(.drop(color: .black.opacity(0.08), radius: 5, x: 5, y: 5))
                   .shadow(.drop(color: .black.opacity(0.05), radius: 5, x: -5, y: -5)) :
                           Color.Theme.unselectedZone.opacity(0.7)
                    .shadow(.drop(color: .black.opacity(0.08), radius: 5, x: 5, y: 5))
                    .shadow(.drop(color: .black.opacity(0.05), radius: 5, x: -5, y: -5))
                )
                .stroke(Color.Theme.strokeGradient, lineWidth: isFocused.wrappedValue ? 0 : 1)
                .padding(.top, isFocused.wrappedValue ? -100 : 0)
        }
        .padding(.horizontal, isFocused.wrappedValue ? 0 : 15)
        .padding(.bottom, 10)
        .padding(.top, 5)
    }
} 