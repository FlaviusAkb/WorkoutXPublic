//
//  OnboardingView.swift
//  WorkoutX
//
//  Created by Flavius Lucian Ilie on 24.12.2023.
//

import SwiftUI

struct OnboardingView: View {
    @State var toggle: Bool = true
    @State var topLeftColor: Color = Color.white
    @State var bottomRightColor: Color = Color.white
    var textColor: Color = .white
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                LogoView(isThemed: toggle)
                Spacer()
                NavigationLink(destination: OnboardStepView(step: 1)) {
                    BasicButtonView( text: "Get Started", isThemed: toggle)
                }
                .padding()
            }
            .padding()
            .frame(maxWidth: .infinity)
            .modifier(RoundedGradientModifier(
                cornerRadius: 50,
                topLeftColor: topLeftColor,
                bottomRightColor: bottomRightColor))
            .background(Color.clear)
            .ignoresSafeArea()
            .onAppear() {
                print(toggle)
                toggleBG()
            }
        }
    }
    
    func toggleBG() {
        toggle = Bool.random()
        if toggle {
            topLeftColor = Color.white
            bottomRightColor = Color.white
        } else {
            topLeftColor = Color(hex: 0x9DCEFF)
            bottomRightColor = Color(.blueLinear)
        }
    }
}

#Preview {
    OnboardingView()
}
