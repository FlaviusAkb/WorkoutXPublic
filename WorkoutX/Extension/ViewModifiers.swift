//
//  ViewModifiers.swift
//  WorkoutX
//
//  Created by Flavius Lucian Ilie on 18.01.2024.
//

import Foundation
import SwiftUI

struct RoundedGradientModifier: ViewModifier {
    var cornerRadius: CGFloat
    var topLeftColor: Color
    var bottomRightColor: Color
    
    var foregroundColor: Color?
    var width: CGFloat?
    var height: CGFloat?
    var scale: CGFloat?
    var opacity: CGFloat?
    var shadowColor: Color?
    
    func body(content: Content) -> some View {
        content
            .background(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(
                        LinearGradient(
                            gradient: Gradient(colors: [topLeftColor, bottomRightColor]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing))
                    .foregroundColor(foregroundColor)
                    .frame(width: width, height: height)
                    .opacity(opacity ?? 1)
                    .scaleEffect(scale ?? 1)
                    .shadow(color: shadowColor?.opacity(0.4) ?? .white, radius: 10, y: 5)
                
            )
    }
}

struct GoalCardGradientModifier: ViewModifier {
    var cornerRadius: CGFloat
    var leftColor: Color
    var rightColor: Color
    
    var foregroundColor: Color?
    var width: CGFloat?
    var height: CGFloat?
    var scale: CGFloat?
    var opacity: CGFloat?
    var shadowColor: Color?
    
    
    
    func body(content: Content) -> some View {
        content
            .background(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(
                        LinearGradient(
                            gradient: Gradient(colors: [leftColor, rightColor]),
                            startPoint: .leading,
                            endPoint: .trailing))
                    .foregroundColor(foregroundColor)
                    .frame(width: width, height: height)
                    .opacity(opacity ?? 1)
                    .scaleEffect(scale ?? 1)
                    .shadow(color: shadowColor?.opacity(0.4) ?? .white, radius: 10, y: 10)
            )
    }
}



struct RoundGradientModifier: ViewModifier {
    var padding: CGFloat
    var topLeftColor: Color
    var bottomRightColor: Color
    
    
    func body(content: Content) -> some View {
        content
            .background(
                Circle()
                    .fill(LinearGradient(
                        gradient: Gradient(colors: [topLeftColor, bottomRightColor]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing))
                    .padding(padding)
            )
    }
}

struct FormHiddenBackground: ViewModifier {
    func body(content: Content) -> some View {
        if #available(iOS 16.0, *) {
            content.scrollContentBackground(.hidden)
        } else {
            content.onAppear {
                UITableView.appearance().backgroundColor = .clear
            }
            .onDisappear {
                UITableView.appearance().backgroundColor = .systemGroupedBackground
            }
        }
    }
}
