//
//  OnboardStepView.swift
//  WorkoutX
//
//  Created by Flavius Lucian Ilie on 24.12.2023.
//

import SwiftUI

struct OnboardStepView: View {
    @State var step: Double = 1.0
    @State private var isNavigating = false
    
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Image("onboardStep\(Int(step))")
                    .resizable()
                    .scaledToFill()
                    .frame(height: geometry.size.height / 2)
                    .padding(.bottom)
                
                VStack {
                    VStack(alignment: .leading) {
                        Text("Track your goal")
                            .font(.title.bold())
                            .padding(.vertical)
                        Text("Maecenas sed faucibus nisi, id vehicula lacus. Sed et massa iaculis, malesuada ante quis, posuere enim. Vivamus eu mi at urna volutpat dapibus. Aliquam sit amet nisl condimentum, ultrices arcu ut, commodo sem.")
                            .font(.headline)
                            .foregroundStyle(Color.gray)
                    }
                    Spacer()
                    HStack(){
                        Spacer()
                        if step < 4 {
                            Button {
                                step += 1
                            } label: {
                                NextButtonView(step: $step, size: 50.0)
                            } } else {
                                NavigationLink {
                                    SignUpView()
                                } label: {
                                    StepView(data: step)
                                        .frame(width: 50, height: 50)
                                        .padding()
                                }
                            }
                    }
                }
                .frame(height: geometry.size.height / 2)
                .padding()
            }
            .ignoresSafeArea()
        }
        
    }
    

}

#Preview {
    OnboardStepView()
}
