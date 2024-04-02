//
//  MainButtonView.swift
//  WorkoutX
//
//  Created by Flavius Lucian Ilie on 24.12.2023.
//

import SwiftUI

struct BasicButtonView: View {
    
    var text: String
    var textColor: Color
    var topLeftColor: Color
    var bottomRightColor: Color
    var height: CGFloat
    var width: CGFloat
    var cornerRadius: CGFloat
    
    init(text: String, textColor: Color, topLeftColor: Color, bottomRightColor: Color, height: CGFloat, width: CGFloat, cornerRadius: CGFloat = 50) {
        self.text = text
        self.textColor = textColor
        self.topLeftColor = topLeftColor
        self.bottomRightColor = bottomRightColor
        self.height = height
        self.width = width
        self.cornerRadius = cornerRadius
    }
    
    init (text: String, isThemed: Bool) {
        if isThemed {
            self.init(text: text, textColor: .white, topLeftColor: Color(hex: 0x9DCEFF), bottomRightColor: Color(.blueLinear), height: 30, width: 150)
        } else {
            self.init(text: text, textColor: Color(.blueLinear), topLeftColor: .white, bottomRightColor: .white, height: 30, width: 150)
        }
    }
    
    var body: some View {
        Text(text)
            .foregroundColor(textColor)
            .font(.headline.bold())
            .frame(maxWidth: width, maxHeight: height )
            .padding()
            .modifier(RoundedGradientModifier(
                cornerRadius: cornerRadius,
                topLeftColor: topLeftColor,
                bottomRightColor: bottomRightColor,
                shadowColor: .gray))
            
    }
}
#Preview {
    BasicButtonView( text: "Test Button", isThemed: true)
}


struct BottomBubble: View {
    
    var text: String
    var textColor: Color
    var topLeftColor: Color
    var bottomRightColor: Color
    var height: CGFloat
    var width: CGFloat
    var cornerRadius: CGFloat
    
    init(text: String, textColor: Color, topLeftColor: Color, bottomRightColor: Color, height: CGFloat, width: CGFloat, cornerRadius: CGFloat = 50) {
        self.text = text
        self.textColor = textColor
        self.topLeftColor = topLeftColor
        self.bottomRightColor = bottomRightColor
        self.height = height
        self.width = width
        self.cornerRadius = cornerRadius
    }
    
    init (text: String, isThemed: Bool, height: CGFloat, width: CGFloat) {
        if isThemed {
            self.init(text: text, textColor: .white, topLeftColor: Color(hex: 0xEEA4CE), bottomRightColor: Color(hex: 0xC58BF2), height: height, width: width)
        } else {
            self.init(text: text, textColor: Color(.blueLinear), topLeftColor: .white, bottomRightColor: .white, height: 10, width: 150)
        }
    }
    
    var body: some View {
        Text(text)
            .foregroundColor(textColor)
            .font(.headline.bold())
            .frame(maxWidth: width, maxHeight: height )
            .padding()
            .modifier(RoundedGradientModifier(
                cornerRadius: cornerRadius,
                topLeftColor: topLeftColor,
                bottomRightColor: bottomRightColor.opacity(0.6),
                shadowColor: .gray))
            .overlay(alignment: .bottomLeading) {
                Image(systemName: "arrowtriangle.down.fill")
                    .offset(x: width / 2, y: height + 4)
                    .foregroundStyle(
                        LinearGradient(
                            gradient: Gradient(colors: [topLeftColor.opacity(0.8), bottomRightColor.opacity(0.8)]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        ))
                
            }
            
    }
}
#Preview {
    BottomBubble( text: "Test Button", isThemed: true, height: 10, width: 100)
}
