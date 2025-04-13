import SwiftUI

extension Color {
    struct Theme {
        static let unselectedZone = Color(hex: 0x192429)
        static let gradientHighLight = Color(hex: 0x132426)
        static let gradientDarker = Color(hex: 0x04080F)
        
        static let blueGradient = LinearGradient(
            gradient: Gradient(colors: [
                Color(hex: 0x0055FF),
                Color(hex: 0x0031AC)
            ]),
            startPoint: .bottomLeading,
            endPoint: .topTrailing
        )
        
        static let strokeGradient = LinearGradient(
            gradient: Gradient(colors: [
                .white.opacity(0.2),
                .white.opacity(0.0),
                .white.opacity(0.1)
            ]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        
        static let guestRowStrokeGradient = LinearGradient(
            gradient: Gradient(colors: [
                .white.opacity(0.15),
                .white.opacity(0.0),
                .white.opacity(0.08)
            ]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        
        static let guestRowBackgroundGradient = LinearGradient(
            gradient: Gradient(colors: [
                .white.opacity(0.04),
                .white.opacity(0.04)
            ]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        
        static let backgroundListGradient = LinearGradient(
            gradient: Gradient(colors: [
                gradientHighLight,
                gradientDarker,
                gradientDarker,
                gradientDarker,
                gradientDarker,
            ]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        
        static let backgroundDetailGradient = LinearGradient(
            gradient: Gradient(colors: [
                .black,
                .black,
                gradientDarker,
                gradientHighLight,
            ]),
            startPoint: .top,
            endPoint: .bottomTrailing
        )
    }
} 

extension Color {
    init(hex: UInt, alpha: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: alpha
        )
    }
}
