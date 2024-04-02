//
//  Logo.swift
//  WorkoutX
//
//  Created by Flavius Lucian Ilie on 24.12.2023.
//

import SwiftUI

struct LogoView: View {
    var text: String = "Workout"
    var letter: String = "X"
    var letterColor: Color
    
    init(letterColor: Color) {
            self.letterColor = letterColor
        }
        
        init(isThemed: Bool) {
            if isThemed {
                self.init(letterColor: Color(.blueLinear))
            } else {
                self.init(letterColor: .white)
            }
        }
    
    var body: some View {
        HStack {
            Text("Workout")
                .font(.title.bold())
            Text("X")
                .font(.largeTitle.bold())
                .foregroundStyle(Color(letterColor))
        }
        Text("Everybody can train")
            .font(.footnote)
            .foregroundStyle(.gray)
    }
}

#Preview {
    LogoView(isThemed: true)
}
