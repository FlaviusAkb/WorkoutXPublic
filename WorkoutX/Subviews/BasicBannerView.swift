//
//  BasicBannerView.swift
//  WorkoutX
//
//  Created by Flavius Lucian Ilie on 27.12.2023.
//

import SwiftUI

struct BasicBannerView: View {
    var text: String = "Today's target"
    var textColor: Color = .black
    var topLeftColor: Color = .blueLinearLight.opacity(0.4)
    var bottomRightColor: Color = .blueLinearLight.opacity(0.4)
    var height: CGFloat = 100
    var value: Double = 20.1
    var cornerRadius: CGFloat = 20
    
    var body: some View {
        HStack {
            Text(text)
                .foregroundColor(textColor)
                .font(.title)
            Spacer()
            BasicButtonView(
                text: "Check",
                textColor: .white,
                topLeftColor: Color(hex: 0x9DCEFF),
                bottomRightColor: Color(.blueLinear), height: 10, width: 100)
            .frame(width: 120)
        }
        .padding()
        .modifier(RoundedGradientModifier(
            cornerRadius: cornerRadius,
            topLeftColor: topLeftColor,
            bottomRightColor: bottomRightColor))
        .frame(height: height)
    }
}

#Preview {
    BasicBannerView()
}
