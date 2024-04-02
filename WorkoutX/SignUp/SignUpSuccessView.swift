//
//  LoginSuccessView.swift
//  WorkoutX
//
//  Created by Flavius Lucian Ilie on 26.01.2024.
//

import SwiftUI

struct SignUpSuccessView: View {
    @State var username: String = "Stefani"
    
    var message: String = "You are all set now, let's reach your goals together with us"
    
    @State var toggle: Bool = true
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Image("signUp")
                    .resizable()
                    .scaledToFit()
                    .frame(height: geometry.size.height / 2)
                    .padding()
                Group {
                    Title(text: "Welcome, \(username)")
                    Caption(text: message)
                        .multilineTextAlignment(.center)
                }
                .frame(width: 230)
                
                Spacer()
                
                NavigationLink(destination: DashboardView()) {
                    BasicButtonView( text: "Go To Home", isThemed: toggle)
                        .listRowSeparator(.hidden)
                }
                
                
            }
            .padding()
        }
    }
}

#Preview {
    SignUpSuccessView()
}
