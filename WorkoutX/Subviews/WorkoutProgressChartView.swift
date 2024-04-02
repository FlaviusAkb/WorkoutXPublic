//
//  WorkoutProgressChartView.swift
//  WorkoutX
//
//  Created by Flavius Lucian Ilie on 26.01.2024.
//

import Charts
import SwiftUI

struct WorkoutProgressChartView: View {
    let workoutData: [WorkoutData] = [
        WorkoutData(period: "Current Week", data: [
            Workout(shortDay: "Mon", steps: 5000),
            Workout(shortDay: "Tue", steps: 6000),
            Workout(shortDay: "Wed", steps: 7000),
            Workout(shortDay: "Thu", steps: 7000),
            Workout(shortDay: "Fri", steps: 7000),
            Workout(shortDay: "Sat", steps: 7000),
            Workout(shortDay: "Sun", steps: 7000),
                // Add more days as needed
            ]),
        WorkoutData(period: "Last Week", data: [
            Workout(shortDay: "Mon", steps: 5000),
            Workout(shortDay: "Tue", steps: 6000),
            Workout(shortDay: "Wed", steps: 7000),
            Workout(shortDay: "Thu", steps: 7000),
            Workout(shortDay: "Fri", steps: 7000),
            Workout(shortDay: "Sat", steps: 7000),
            Workout(shortDay: "Sun", steps: 7000),
                // Add more days as needed
            ]),
        ]
    
    var body: some View {
        GroupBox ( "Line Chart - Chart Background") {
            Chart {
                ForEach(workoutData, id: \.period) { steps in
                    ForEach(steps.data) {
                        LineMark(
                            x: .value("Week Day", $0.shortDay),
                            y: .value("Step Count", $0.steps)
                        )
                        .foregroundStyle(by: .value("Week", steps.period))
                        .accessibilityLabel("\($0.weekdayString)")
                        .accessibilityValue("\($0.steps) Steps")
                    }
                }
            }
            .chartBackground { chartProxy in
                Color.red.opacity(0.1)
            }
            .frame(height:200)
        }
        .groupBoxStyle(WhiteGroupBoxStyle())
    }
}

#Preview {
    WorkoutProgressChartView()
}

struct WorkoutData: Identifiable {
    var id = UUID()
    var period: String
    var data: [Workout]
}

struct Workout: Identifiable {
    var id = UUID()
    var shortDay: String
    var steps: Int
    var weekdayString: String {
        // You can customize the formatting based on your requirements
        return "\(shortDay) - \(steps) Steps"
    }
}

struct WhiteGroupBoxStyle: GroupBoxStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.content
            .padding(.top, 30)
            .padding(20)
            .background(Color(hue: 0.1, saturation: 0.01, brightness: 0.98))
            .cornerRadius(20)
            .overlay(
                configuration.label.padding(10),
                alignment: .topLeading
            )
    }
}
