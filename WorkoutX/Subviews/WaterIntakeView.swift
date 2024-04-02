//
//  WaterIntakeView.swift
//  WorkoutX
//
//  Created by Flavius Lucian Ilie on 08.03.2024.
//
import Charts
import SwiftUI

struct BarMark: View {
    let consumedWater: Double
    let totalWater: Double
    
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {
                Rectangle()
                    .fill(Color.gray.opacity(0.1))
                    .frame(height: CGFloat((totalWater - consumedWater) / totalWater) * geometry.size.height)
                Rectangle()
                    .fill(.linearGradient(colors: [.purpleLinear, .blueLinearLight], startPoint: .top, endPoint: .bottom))
                    .frame(height: CGFloat(consumedWater / totalWater) * geometry.size.height)
            }
            .clipShape(RoundedRectangle(cornerRadius: 25))
            
        }
    }
}

struct WaterIntakeView: View {
    var body: some View {
        VStack {
            HStack {
                VStack {
                    BarMark(consumedWater: 2800, totalWater: 4000)
                        .frame(width: 25, height: 400)
                }
                .padding(.trailing)
                
                VStack {
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Water Intake")
                            .font(.headline)
                        Text("4 Liters")
                            .font(.title3.bold())
                            .foregroundStyle(.blueLinear)
                            .padding(.vertical)
                        
                        Text("Real time updates")
                            .font(.headline.bold())
                            .foregroundStyle(.gray)
                        WaterIntakeProgressView(time: "6am - 8am", intake: 600, active: false, isLast: false)
                        WaterIntakeProgressView(time: "6am - 8am", intake: 500, active: true, isLast: false)
                        WaterIntakeProgressView(time: "6am - 8am", intake: 1000, active: false, isLast: true)
                    }
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
    WaterIntakeView()
}


struct WaterIntakeProgressView: View {
    
    var time: String
    var intake: Int
    var active: Bool
    var isLast: Bool
    
    var circleWidth: CGFloat = 10
    
    var body: some View {
        VStack {
            HStack {
                Circle()
                    .fill(.purpleLinear).opacity(active ? 1 : 0.2)
                    .frame(width: circleWidth)
                Text(time)
                    .font(.headline.weight(.thin))
                    .foregroundStyle(.gray)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            HStack {
                if !isLast {
                    VStack(alignment: .leading) {
                        Divider()
                            .frame(width: 1, height: 5)
                            .background(.purpleLinear).opacity(0.8)
                        ForEach(0..<3) { _ in
                            Divider()
                                .frame(width: 1, height: 8)
                                .background(.purpleLinear).opacity(0.8)
                        }
                        Divider()
                            .frame(width: 1, height: 5)
                            .background(.purpleLinear).opacity(0.8)
                    }
                    .padding(.leading, circleWidth / 2)
                }
                
                Text("\(intake)ml")
                    .font(.headline).bold()
                    .foregroundStyle(.purpleLinear)
                    .padding(.leading, !isLast ? circleWidth / 2 : circleWidth * 2)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}
