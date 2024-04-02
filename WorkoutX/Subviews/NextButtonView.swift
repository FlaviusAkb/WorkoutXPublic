//
//  NextButtonView.swift
//  WorkoutX
//
//  Created by Flavius Lucian Ilie on 24.12.2023.
//

import SwiftUI

struct NextButtonView: View {
    @Binding var step: Double
    var size: CGFloat
    
    var body: some View {
        VStack {
            StepView(data: step)
                .frame(width: size, height: size)
                .padding()
                .onTapGesture {
                    step += 1
                    if step > 4 {
                        step = 1
                    }
                }
        }
    }
}
#Preview {
    NextButtonView(step: .constant(1.0), size: 50)
}
struct StepView: View {
    var data: Double
    var text: String = "chevron.right"
    var textColor: Color = .white
    var topLeftColor: Color = Color(hex: 0x9DCEFF)
    var bottomRightColor: Color = Color(.blueLinear)
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Circle()
                    .trim(from: 0, to: CGFloat(data) / 4)
                    .stroke(color(for: data), lineWidth: 3)
                    .rotationEffect(.degrees(-90))
                    .modifier(
                        RoundGradientModifier(
                            padding: 3,
                            topLeftColor: topLeftColor,
                            bottomRightColor: bottomRightColor))
                
                if data < 4 {
                    Circle()
                        .trim(from: CGFloat(data / 4), to: 1.0)
                        .stroke(Color.gray.opacity(0.2), lineWidth: 3)
                        .rotationEffect(.degrees(-90))
                }
            
                Image(systemName: text)
                    .font(.caption.bold())
                    .foregroundColor(.white)
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
        }
    }
    
    private func color(for value: Double) -> Color {
        switch value {
        case 1:
            return Color(.blueLinear)
        case 2:
            return Color(.blueLinear)
        case 3:
            return Color(.blueLinear)
        case 4:
            return Color(.blueLinear)
        default:
            return .black
        }
    }
}
