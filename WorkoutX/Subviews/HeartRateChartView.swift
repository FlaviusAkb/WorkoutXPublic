//
//  HeartRateChartView.swift
//  WorkoutX
//
//  Created by Flavius Lucian Ilie on 26.01.2024.
//

import Charts
import SwiftUI
//
//struct HeartRateChartView2: View {
//    let bpmData: [Int] = [60, 70, 98, 100, 130, 110, 90, 40, 73, 98, 110, 105, 80, 9]
//
//    var body: some View {
//        Chart {
//            ForEach(Array(bpmData.enumerated()), id: \.offset) { index, value in
//                LineMark(
//                    x: .value("Index", index),
//                    y: .value("Value", value)
//                )
//            }
//        }
//        .foregroundStyle(.linearGradient(colors: [.blue, .purple], startPoint: .top, endPoint: .bottom))
//        .frame(maxWidth: .infinity)
//        .frame(height: 300)
//    }
//}
//
//#Preview {
//    HeartRateChartView2()
//}
//
//struct HeartRateChartView: View {
//
//    let stepData: [HeartData] = [
//        HeartData(period: "Current Week", data: [
//            HeartMeasurement(shortDay: "Mon", heartRate: 45),
//            HeartMeasurement(shortDay: "Tue", heartRate: 55),
//            HeartMeasurement(shortDay: "Wed", heartRate: 40),
//            HeartMeasurement(shortDay: "Thu", heartRate: 77),
//            HeartMeasurement(shortDay: "Fri", heartRate: 90),
//            HeartMeasurement(shortDay: "Sat", heartRate: 60),
//            HeartMeasurement(shortDay: "Sun", heartRate: 80)
//        ]),
//        HeartData(period: "Last Week", data: [
//            HeartMeasurement(shortDay: "Mon", heartRate: 125),
//            HeartMeasurement(shortDay: "Tue", heartRate: 85),
//            HeartMeasurement(shortDay: "Wed", heartRate: 140),
//            HeartMeasurement(shortDay: "Thu", heartRate: 97),
//            HeartMeasurement(shortDay: "Fri", heartRate: 130),
//            HeartMeasurement(shortDay: "Sat", heartRate: 90),
//            HeartMeasurement(shortDay: "Sun", heartRate: 80)
//        ]),]
//
//    var body: some View {
//        GroupBox ( "Line Chart - Chart Background") {
//            Chart {
//                ForEach(stepData, id: \.period) { heartRate in
//                    ForEach(heartRate.data) {
//                        LineMark(
//                            x: .value("Week Day", $0.shortDay),
//                            y: .value("Step Count", $0.heartRate)
//                        )
//                        .foregroundStyle(by: .value("Week", heartRate.period))
//                        .accessibilityLabel("\($0.weekdayString)")
//                        .accessibilityValue("\($0.heartRate) Steps")
//                    }
//                }
//                RuleMark(y: .value("Base heart rate", 63))
//                    .foregroundStyle(Color.secondary)
//                    .lineStyle(StrokeStyle(lineWidth: 0.8, dash: [10]))
//                    .annotation(alignment: .topTrailing) {
//                        Text("Base heart rate: 63 BPM")
//                            .font(.subheadline).bold()
//                            .padding(.trailing, 32)
//                            .foregroundStyle(Color.secondary)
//                    }
//            }
//            .chartBackground { chartProxy in
//                Color.blueLinearLight.opacity(0.2)
//            }
//            .chartXAxis(.hidden)
//            .chartYAxis(.hidden)
//            .frame(height:200)
//        }
//        .groupBoxStyle(YellowGroupBoxStyle())
//    }
//}
//
//#Preview {
//    HeartRateChartView()
//}
//
//struct HeartData: Identifiable {
//    var id = UUID()
//    var period: String
//    var data: [HeartMeasurement]
//}
//
//struct HeartMeasurement: Identifiable {
//    var id = UUID()
//    var shortDay: String
//    var heartRate: Int
//    var weekdayString: String {
//        // You can customize the formatting based on your requirements
//        return "\(shortDay) - \(heartRate) Steps"
//    }
//}
//
//struct YellowGroupBoxStyle: GroupBoxStyle {
//    func makeBody(configuration: Configuration) -> some View {
//        configuration.content
//            .padding(.top, 30)
//            .padding(20)
//            .background(.blueLinearLight.opacity(0.2))
//            .cornerRadius(20)
//            .overlay(
//                configuration.label.padding(10),
//                alignment: .topLeading
//            )
//    }
//}

struct wGroupBoxStyle: GroupBoxStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.content
            .padding(.vertical)
            .background(.linearGradient(colors: [.blueLinear], startPoint: .top, endPoint: .bottom).opacity(0.2))
            .cornerRadius(20)
    }
}

struct HeartRateChartView3: View {
    let bpmData: [Int] = [60, 67, 69, 80, 85, 83, 90, 80, 83, 98, 90, 105, 80, 90,60, 70, 98, 100, 110, 107, 60, 67, 69, 80, 85, 83, 90, 80, 83, 98, 90, 105, 80, 90,60, 70, 98, 100, 110, 107]
    let bpmData2: [Int] = [107, 110, 100, 103, 118, 125, 107, 80, 85, 83, 90, 80, 83, 98, 90, 105, 80, 90,60, 70, 98, 100, 110, 107]
    
    let curGradient = LinearGradient(
        gradient: Gradient (
            colors: [
                .blueLinear.opacity(0.5),
                .blueLinear.opacity(0.2),
                .blueLinear.opacity(0.0),
            ]
        ),
        startPoint: .top,
        endPoint: .bottom
    )
    
    @State private var symbolX: CGFloat = .zero
    @State private var symbolY: CGFloat = .zero
    
    var body: some View {
        GeometryReader { geo in
            GroupBox {
                HStack {
                    VStack(alignment: .leading) {
                        Text("Heart Rate")
                            .font(.headline.bold())
                        Text("78 BPM")
                            .font(.title3.bold())
                            .foregroundStyle(.blueLinear)
                    }
                    .padding(.leading)
                    Spacer()
                    BottomBubble(text: "3 mins ago", isThemed: true, height: 10, width: 100)
                        .offset(x: -(geo.size.width / 3) / 2)
                }
                .padding(.vertical)
                
                HStack {
                    Chart {
                        ForEach(Array(bpmData.enumerated()), id: \.offset) { index, value in
                            LineMark(
                                x: .value("Index", index),
                                y: .value("Value", value)
                            )
                            .lineStyle(StrokeStyle(lineWidth: 2))
                            .symbol() {
                                Circle()
                                    .stroke(.linearGradient(colors: [Color(hex: 0xEEA4CE)], startPoint: .top, endPoint: .bottom), lineWidth: 3)
                                    .fill(.white)
                                    .frame(width: index == bpmData.count - 2 ? 5 : 0)
                                    .padding(.bottom, 10)
                                    .onAppear {
                                        if index == bpmData.count - 2 {
                                            symbolX = geo.frame(in: .global).midX
                                            symbolY = geo.frame(in: .global).midY
                                        }
                                    }
                            }
                            AreaMark(
                                x: .value("Index", index),
                                y: .value("Value", value)
                            )
                            .foregroundStyle(curGradient)
                        }
                        .foregroundStyle(.linearGradient(colors: [.blueLinear], startPoint: .top, endPoint: .bottom))
                    }
                    .foregroundStyle(.linearGradient(colors: [.blueLinear], startPoint: .top, endPoint: .bottom))
                    .frame(maxWidth:  geo.size.width - geo.size.width / 3)
                    .frame(height: 100)
                    .chartXAxis(.hidden)
                    .chartYAxis(.hidden)
                    
                    Chart {
                        ForEach(Array(bpmData2.enumerated()), id: \.offset) { index, value in
                            LineMark(
                                x: .value("Index", index),
                                y: .value("Value", value)
                            )
                            .lineStyle(StrokeStyle(lineWidth: 2)).opacity(0.2)
                        }
                    }
                    .foregroundStyle(.linearGradient(colors: [.blueLinear], startPoint: .top, endPoint: .bottom))
                    .frame(maxWidth: geo.size.width / 3)
                    .frame(height: 100)
                    .chartXAxis(.hidden)
                    .chartYAxis(.hidden)
                }
            }
            .groupBoxStyle(wGroupBoxStyle())
            .frame(maxWidth: geo.size.width)
        }
        .frame(height: 215)
    }
}

#Preview {
    HeartRateChartView3()
}
