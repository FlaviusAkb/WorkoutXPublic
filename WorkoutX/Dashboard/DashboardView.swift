//
//  DashboardView.swift
//  WorkoutX
//
//  Created by Flavius Lucian Ilie on 27.12.2023.
//

import SwiftUI

struct DashboardView: View {
    var message: String = "Welcome Back,"
    var username: String = "Stefani Wong"
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                HStack {
                    VStack(alignment: .leading) {
                        Caption(text: message)
                        Title(text: "Welcome, \(username)")
                    }
                    Spacer()
                    RoundedButton(imageName: "bell.badge",
                                  backgroundTL: .gray3.opacity(0.1),
                                  backgroundBR: .gray3.opacity(0.1),
                                  foreground: .black,
                                  action: { })
                }
                .padding(.bottom, 10)
                BMIBannerView()
                    .padding(.bottom, 10)
                BasicBannerView()
                    .padding(.bottom, 10)
                Text("Activity Status")
                    .font(.headline)
                HeartRateChartView3()
                    .padding(.bottom, 10)
                
                HStack {
                    VStack {
                        WaterIntakeView()
                    }
                    VStack {
                        SleepIntakeView()
                        CaloriesIntakeView()
                    }
                    .frame(maxWidth: 110)
                }
                
            }
            .padding()
        }
        .background(.gray.opacity(0.2))
    }
}

#Preview {
    DashboardView()
}
