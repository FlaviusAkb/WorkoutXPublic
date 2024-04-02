//
//  BMIChartView.swift
//  WorkoutX
//
//  Created by Flavius Lucian Ilie on 24.12.2023.
//
import Charts
import SwiftUI


struct Pie: View {
    struct PieSlice {
        var value: Double
        var color: Color
        var offset: CGSize
    }
    
    var slices: [PieSlice]
    
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ForEach(slices.indices) { index in
                    let slice = slices[index]
                    let total = slices.reduce(0) { $0 + $1.value }
                    let normalizedValue = slice.value / total
                    
                    let startAngle = 360 * (slices[..<index].reduce(0) { $0 + $1.value } / total)
                    let endAngle = startAngle + 360 * normalizedValue
                    
                    Path { path in
                        path.move(to: CGPoint(x: geometry.size.width * 0.5, y: geometry.size.height * 0.5))
                        path.addArc(center: CGPoint(x: geometry.size.width * 0.5, y: geometry.size.height * 0.5),
                                    radius: min(geometry.size.width, geometry.size.height) * 0.48,
                                    startAngle: .degrees(startAngle - 90),
                                    endAngle: .degrees(endAngle - 90),
                                    clockwise: false)
                    }
                    .fill(slice.color)
                    .offset(slice.offset)
                }
            }
        }
        .aspectRatio(1.0, contentMode: .fit)
    }
}

struct BMIChartView: View {
    var largeSliceColor: Color
    var smallSliceColor: Color
    var value: Double
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Pie(slices: [
                    .init(value: 1, color: largeSliceColor, offset: .zero),
                ])
                Pie(slices: [
                    .init(value: 0.8, color: Color(hex: 0xEEA4CE), offset: CGSize(width: 5.0, height: -5.0)),
                    .init(value: 2, color: .clear, offset: .zero),
                ])
                .rotationEffect(.degrees(-10.0))
                .scaleEffect(CGSize(width: 1.1, height: 1.1))
                
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
            .overlay(
                Text(String(value))
                    .foregroundStyle(.white)
                    .font(.callout.bold())
                    .offset(CGSize(width: geometry.size.width / 5, height: -(geometry.size.height / 5)))
            )
        }
    }
}

#Preview {
    BMIChartView(largeSliceColor: .red, smallSliceColor: .green, value: 20.1)
        .padding()
}
