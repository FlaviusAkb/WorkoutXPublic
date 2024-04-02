//
//  ProfileView.swift
//  WorkoutX
//
//  Created by Flavius Lucian Ilie on 25.01.2024.
//

import SwiftUI

struct ProfileSetupView: View {
    @State var toggle: Bool = true
    
    @State var weight: String = "Your weight"
    @State var height: String = "Your height"
    @State var isMetric: Bool = true
    @State var selectedGender: Gender = .male
    @State private var date = Date.now
    
    enum Gender: String, CaseIterable, Identifiable {
        case female = "Female"
        case male = "Male"
        case other = "Other"
        var id: Gender { self }
    }
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Image("profile1")
                    .resizable()
                    .scaledToFill()
                    .frame(height: geometry.size.height / 2)
                Group {
                    Title(text: "Let's complete your profile")
                    Caption(text: "It will help us to know more about you!")
                }
                .padding(.bottom)
                
                Menu {
                    ForEach(Gender.allCases, id: \.self) { gender in
                        Button(action: {
                            selectedGender = gender
                        }) {
                            HStack {
                                Text(gender.rawValue)
                                Spacer()
                                if selectedGender == gender {
                                    Image(systemName: "chevron.down")
                                }
                            }
                        }
                    }
                } label: {
                    Image(systemName: "person")
                    Text(selectedGender.rawValue)
                    Spacer()
                    Image(systemName: "arrowtriangle.down.fill")
                        .imageScale(.small)
                }
                .foregroundStyle(.gray)
                .padding(20)
                .frame(maxWidth: .infinity)
                .modifier(RoundedGradientModifier(
                    cornerRadius: 15,
                    topLeftColor: .gray3.opacity(0.2),
                    bottomRightColor: .gray3.opacity(0.2)))
                
                DatePicker("\(Image(systemName: "calendar"))  Date of birth", selection: $date, displayedComponents: .date)
                    .datePickerStyle(.compact)
                    .foregroundStyle(.gray)
                    .padding(15)
                    .frame(maxWidth: .infinity)
                    .modifier(RoundedGradientModifier(
                        cornerRadius: 15,
                        topLeftColor: .gray3.opacity(0.2),
                        bottomRightColor: .gray3.opacity(0.2)))
                HStack {
                    SignUpField(label: "Weight", text: weight, icon: "scalemass")
                    RoundedButton(text: isMetric ? "KG" : "LBS", backgroundTL: isMetric ? .purpleLinear : .blueLinear, backgroundBR: isMetric ? .blueLinear : .purpleLinear, foreground: .white, action: { isMetric.toggle() })
                        
                }
                
                HStack {
                    SignUpField(label: "Height", text: weight, icon: "arrow.up.arrow.down")
                    RoundedButton(text: isMetric ? "CM" : "FT", backgroundTL: isMetric ? .purpleLinear : .blueLinear, backgroundBR: isMetric ? .blueLinear : .purpleLinear, foreground: .white, action: { isMetric.toggle() })
                }
                
                NavigationLink(destination: GoalView()) {
                    BasicButtonView( text: "Next", isThemed: toggle)
                        .padding(.vertical)
                }
                .padding()
            }
            .foregroundStyle(.gray)
            .padding()
            .frame(width: geometry.size.width, height: geometry.size.height)
        }
    }
}

#Preview {
    ProfileSetupView()
}

struct Title: View {
    var text: String
    var body: some View {
        Text(text)
            .font(.title2.bold())
            .foregroundStyle(.black)
    }
}

struct Caption: View {
    var text: String
    var body: some View {
        Text(text)
            .font(.caption.bold())
            .foregroundStyle(.gray)
            .fixedSize(horizontal: false, vertical: false)
    }
}
