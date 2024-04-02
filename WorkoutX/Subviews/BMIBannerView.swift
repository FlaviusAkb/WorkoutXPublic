//
//  BMIBannerView.swift
//  WorkoutX
//
//  Created by Flavius Lucian Ilie on 27.12.2023.
//

import SwiftUI

struct BMIBannerView: View {
    var text: String = "chevron.right"
    var textColor: Color = .white
    var topLeftColor: Color = Color(hex: 0x9DCEFF)
    var bottomRightColor: Color = Color(.blueLinear)
    var height: CGFloat = 150
    var value: Double = 20.1
    
    var body: some View {
        
        HStack {
            VStack(alignment: .leading) {
                Text("BMI (Body Mass Index)")
                    .font(.subheadline.bold())
                    .fixedSize(horizontal: true, vertical: false)
                    .padding(.vertical, 5)
                
                Text("You have a normal weight")
                    .font(.subheadline)
                    .fixedSize(horizontal: true, vertical: false)
                
                BasicButtonView(
                    text: "View More",
                    textColor: .white,
                    topLeftColor: Color(hex: 0xEEA4CE),
                    bottomRightColor: Color(hex: 0xC58BF2),
                    height: 10,
                    width: 100,
                    cornerRadius: 20)
                .padding(.vertical)
            }
            .foregroundColor(.white)
            
            Spacer()
            
            BMIChartView(largeSliceColor: .white, smallSliceColor:  Color(hex: 0xC58BF2), value: value)
        }
        .padding()
        .modifier(RoundedGradientModifier(
            cornerRadius: 20,
            topLeftColor: topLeftColor,
            bottomRightColor: bottomRightColor))
        .overlay(
            Image("backgroundDots")
                .resizable()
                .scaledToFill()
        )
        .frame(height: height)
    }
}

#Preview {
    BMIBannerView()
}
