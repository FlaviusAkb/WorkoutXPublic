//
//  SignUpView.swift
//  WorkoutX
//
//  Created by Flavius Lucian Ilie on 18.01.2024.
//

import SwiftUI

struct SignUpView: View {
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var email: String = ""
    @State var password: String = ""
    @State var privacyAccepted: Bool = false
    
    var privacyMessage: String = "By continuing you accept our Privacy Policy and Term of Use"
    
    @State var toggle: Bool = true
    
    var body: some View {
        VStack {
            Text("Hey there,")
            Text("Create an Account")
                .font(.title.bold())
            
            self.signUpForm
            
            LabelledDivider(label: "or")
            
            HStack {
                RoundedButton(text: "G", backgroundTL: .white, backgroundBR: .white, foreground: .red, action: { })
                RoundedButton(text: "f", backgroundTL: .white, backgroundBR: .white, foreground: .blue, action: { })
            }
            
            Group {
                NavigationLink(destination: LoginView()) {
                Text("Already have an account?") +
    
                Text("Login")
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
    SignUpView()
}

struct SignUpField: View {
    @State var label: String
    @State var text: String
    @State var icon: String
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(.gray)
            TextField(label, text: $text)
            
            if label == "Password" {
                Image(systemName: "eye.slash")
                    .foregroundColor(.gray)
            }
        }
        .padding()
        .modifier(RoundedGradientModifier(
            cornerRadius: 15,
            topLeftColor: .gray3.opacity(0.2),
            bottomRightColor: .gray3.opacity(0.2)))
        .listRowSeparator(.hidden)
    }
}
struct LabelledDivider: View {

    let label: String
    let horizontalPadding: CGFloat
    let color: Color

    init(label: String, horizontalPadding: CGFloat = 20, color: Color = .gray) {
        self.label = label
        self.horizontalPadding = horizontalPadding
        self.color = color
    }
    var body: some View {
        HStack {
            line
            Text(label).foregroundColor(color)
            line
        }
    }
    var line: some View {
        VStack {
            Divider()
                .background(color)
        }
        .padding(horizontalPadding)
    }
}

extension SignUpView {
    
    var signUpForm: some View {
        Group {
            SignUpField(label: "First name", text: firstName, icon: "person")
            SignUpField(label: "Last name", text: lastName, icon: "person")
            SignUpField(label: "Email", text: email, icon: "envelope")
            SignUpField(label: "Password", text: email, icon: "lock")
            
            Toggle(isOn: $privacyAccepted) {
                Text("By continuing you accept our Privacy Policy and Term of Use")
            }
            .font(.footnote)
            .listRowSeparator(.hidden)
            .toggleStyle(.switch)
            .foregroundStyle(.gray)
            
            Spacer()
            
            NavigationLink(destination: ProfileSetupView()) {
                BasicButtonView( text: "Register", isThemed: toggle)
                    .listRowSeparator(.hidden)
            }
        }
    }
}

struct RoundedButton: View {
    var text: String?
    var imageName: String?
    var backgroundTL: Color
    var backgroundBR: Color
    var foreground: Color
    var action: () -> Void
    
    var body: some View {
        RoundedRectangle(cornerRadius: 15)
            .stroke(.gray3, style: .init(lineWidth: 1))
            .frame(width: 50, height: 50)
            .overlay() {
                if imageName != nil {
                    Image(systemName: imageName ?? "")
                } else {
                    Text(text ?? "")
                        .foregroundStyle(foreground)
                        .font( text?.count == 1 ? .title2.bold() : .caption.bold())
                }
            }
            .modifier(RoundedGradientModifier(
                cornerRadius: 15,
                topLeftColor: backgroundTL,
                bottomRightColor: backgroundBR))
            .onTapGesture {
                withAnimation {
                    action()
                }
            }
            
    }
}
