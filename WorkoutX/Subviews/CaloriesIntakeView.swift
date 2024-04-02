//
//  CaloriesIntakeView.swift
//  WorkoutX
//
//  Created by Flavius Lucian Ilie on 08.03.2024.
//

import SwiftUI

struct CaloriesIntakeView: View {
    @State var totalCalories: Double = 760
    @State var caloriesConsumed: Double = 260
    var caloriesLeft: Double {
        totalCalories - caloriesConsumed
    }
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("Calories")
                .font(.headline)
            Text("\(totalCalories.formatted())kCal")
                .font(.title3.bold())
                .foregroundStyle(.blueLinear)
            CaloriesCounterView(totalCalories: totalCalories, caloriesConsumed: caloriesConsumed, caloriesLeft: caloriesLeft)
                .frame(width: 80, height: 80)
                .onTapGesture {
                    caloriesConsumed += 100
                    if caloriesConsumed > totalCalories {
                        caloriesConsumed = 230
                    }
                }
        }
        .padding()
        .modifier(RoundedGradientModifier(
            cornerRadius: 25,
            topLeftColor: .white,
            bottomRightColor: .white))
    }
}

#Preview {
    CaloriesIntakeView()
}

struct CaloriesCounterView: View {
    var totalCalories: Double
    var caloriesConsumed: Double
    var caloriesLeft: Double
    var textColor: Color = .white
    var topLeftColor: Color = Color(hex: 0x9DCEFF)
    var bottomRightColor: Color = Color(.blueLinear)
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Circle()
                    .trim(from: 0, to: CGFloat(caloriesConsumed) / totalCalories)
                    .stroke(gradient(for: caloriesLeft), style: StrokeStyle(lineWidth: 10, lineCap: .round))
                    .rotationEffect(.degrees(90))
                    .modifier(
                        RoundGradientModifier(
                            padding: 5,
                            topLeftColor: topLeftColor,
                            bottomRightColor: bottomRightColor))
                
                if caloriesConsumed < totalCalories {
                    Circle()
                        .trim(from: CGFloat(caloriesConsumed / totalCalories), to: 1.0)
                        .stroke(Color.gray.opacity(0.2), style: StrokeStyle(lineWidth: 10, lineCap: .round))
                        .rotationEffect(.degrees(90))
                }
            
                Text( caloriesLeft != 0 ? "\(caloriesLeft.formatted())kCal \nleft" : "No calories \n left")
                    .font(.caption.bold())
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
        }
    }
    
    private func gradient(for value: Double) -> LinearGradient {
        switch value {
        case value / 4:
            return LinearGradient(gradient: Gradient(colors: [.purpleLinear, .blueLinearLight.opacity(0.4)]), startPoint: .leading, endPoint: .trailing)
        case value / 3:
            return LinearGradient(gradient: Gradient(colors: [.purpleLinear, .blueLinearLight.opacity(0.6)]), startPoint: .leading, endPoint: .trailing)
        case value / 2:
            return LinearGradient(gradient: Gradient(colors: [.purpleLinear, .blueLinearLight.opacity(0.8)]), startPoint: .leading, endPoint: .trailing)
        case value:
            return LinearGradient(gradient: Gradient(colors: [.purpleLinear, .purpleLinear]), startPoint: .leading, endPoint: .trailing)
        default:
            return LinearGradient(gradient: Gradient(colors: [.purpleLinear]), startPoint: .leading, endPoint: .trailing)
        }
    }

}
