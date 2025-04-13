import SwiftUI

struct SearchHeaderView: View {
    let viewModel: GuestListViewModel
    let isFocused: Bool
    let progress: CGFloat
    var searchFieldFocused: FocusState<Bool>.Binding
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HeaderTitleView(progress: isFocused ? 1 : progress)
            SearchBarView(viewModel: viewModel, isFocused: searchFieldFocused)
            ZoneFilterView(viewModel: viewModel, isFocused: isFocused)
        }
        .background {
            ProgressiveBlurView()
                .blur(radius: isFocused ? 0 : 10)
                .padding(.horizontal, -15)
                .padding(.bottom, -10)
                .padding(.top, -100)
        }
        .visualEffect { content, proxy in
            content
                .offset(y: offsetY(proxy))
        }
    }
    
    nonisolated
    private func offsetY(_ proxy: GeometryProxy) -> CGFloat {
        let minY = proxy.frame(in: .scrollView(axis: .vertical)).minY
        return minY > 0 ? (isFocused ? -minY : 0) : -minY
    }
} 
