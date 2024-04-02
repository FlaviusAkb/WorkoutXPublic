//
//  LoginView.swift
//  WorkoutX
//
//  Created by Flavius Lucian Ilie on 26.01.2024.
//

import SwiftUI

struct LoginView: View {
    @State var email: String = ""
    @State var password: String = ""
    
    var message: String = "Forgot your password?"
    
    @State var toggle: Bool = true
    
    var body: some View {
        VStack {
            Text("Hey there,")
            Text("Welcome Back")
                .font(.title.bold())
            
            self.loginForm
            
            LabelledDivider(label: "or")
            
            HStack {
                RoundedButton(text: "G", backgroundTL: .white, backgroundBR: .white, foreground: .red, action: { })
                RoundedButton(text: "f", backgroundTL: .white, backgroundBR: .white, foreground: .blue, action: { })
            }
            
            Group {
                NavigationLink(destination: SignUpView()) {
                    Text("Don't have an account yet?") +
                    Text("Register")
                        .font(.headline.bold())
                        .foregroundStyle(.purpleLinear)
                }
            }
            .padding(5)
        }
        .padding(35)
    }
}

#Preview {
    LoginView()
}


extension LoginView {
    
    var loginForm: some View {
        Group {
            SignUpField(label: "Email", text: email, icon: "envelope")
            SignUpField(label: "Password", text: email, icon: "lock")
            Button { } label: {
                Text(message)
                    .font(.footnote)
                    .foregroundStyle(.gray)
                    .underline()
                    .padding()
                
            }
            

            
            Spacer()
            
            NavigationLink(destination: DashboardView()) {
                BasicButtonView( text: "Login", isThemed: toggle)
                    .listRowSeparator(.hidden)
            }
            
            
            
        }
//        .modifier(FormHiddenBackground())
    }
}
