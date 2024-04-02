//
//  SleepIntakeView.swift
//  WorkoutX
//
//  Created by Flavius Lucian Ilie on 08.03.2024.
//

import SwiftUI

struct SleepIntakeView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("Sleep")
                .font(.headline)
            Text("8h 20m")
                .font(.title3.bold())
                .foregroundStyle(.blueLinear)
            Image("sleepGraph")
                .resizable()
                .scaledToFit()
        }
        .padding()
        .modifier(RoundedGradientModifier(
            cornerRadius: 25,
            topLeftColor: .white,
            bottomRightColor: .white))
    }
}

#Preview {
    SleepIntakeView()
}
