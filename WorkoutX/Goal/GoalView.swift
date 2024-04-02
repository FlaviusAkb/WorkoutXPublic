//
//  GoalView.swift
//  WorkoutX
//
//  Created by Flavius Lucian Ilie on 25.01.2024.
//

import SwiftUI

struct GoalView: View {
    var toggle: Bool = true
    
    var body: some View {
        
        Title(text: "What is your goal?")
            .padding(.vertical, 5)
        Caption(text: "It will help us to choose a best program for you")
            .frame(width: 200)
            .multilineTextAlignment(.center)
        SnapCarouselView()
        
        
        NavigationLink(destination: SignUpSuccessView()) {
            BasicButtonView( text: "Confirm", isThemed: toggle)
                .padding()
        }
        .padding()
    }
}

#Preview {
    GoalView()
}

struct SnapCarouselView: View {
    @State private var currentIndex: Int = 2
    
    let cards: [Card] = [
        Card(id: 0, color: Color.blueLinear, title: "Improve shape", caption: "I have a low amount of body fat and I need / want to build more muscle"),
        Card(id: 1, color: Color.blueLinear, title: "Lean & Tone", caption: "I'm \"skinny fat\", look thin but have no shape, I want to add lean muscle the right way "),
        Card(id: 2, color: Color.blueLinear, title: "Lose fat", caption: "I have over 20 lbs to lose, I want to drop all this fat and gain muscle mass"),
    ]
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ForEach(cards) { card in
                    CarouselCardView(card: card, currentIndex: $currentIndex, geometry: geometry, title: card.title, caption: card.caption)
                        .offset(x: calculateOffset(card.id, currentIndex: currentIndex, geometry: geometry))
                        .opacity(card.id == currentIndex ? 1 : 0.2 )
                }
            }
            .gesture(
                DragGesture()
                    .onEnded { value in
                        let cardWidth = geometry.size.width * 0.3
                        let offset = value.translation.width / cardWidth
                        
                        withAnimation(Animation.spring()) {
                            if value.translation.width < -offset
                            {
                                currentIndex = min(currentIndex + 1, cards.count - 1)
                            } else if value.translation.width > offset {
                                currentIndex = max(currentIndex - 1, 0)
                            }
                        }
                        
                    }
            )
        }
        .padding(.top, 30)
    }
    
    func calculateOffset(_ cardID: Int, currentIndex: Int, geometry: GeometryProxy) -> CGFloat {
        let cardWidth = geometry.size.width * 0.7
        let spacing = cardWidth * 0.3
        let offset = (geometry.size.width - cardWidth) / 2
        
        return CGFloat(cardID - currentIndex) * (cardWidth - spacing) + offset
    }
}

struct Card: Identifiable {
    var id: Int
    var color: Color
    var title: String
    var caption: String
}

struct CarouselCardView: View {
    let card: Card
    @Binding var currentIndex: Int
    let geometry: GeometryProxy
    
    var title: String
    var caption: String
    
    var body: some View {
        let cardWidth = geometry.size.width * 0.7
        let cardHeight = cardWidth * 1.7
        let offset = (geometry.size.width - cardWidth) / 2
        
        return VStack {
            ZStack {
                Image("goal\(card.id)")
                    .opacity(card.id == currentIndex ? 1.0 : 0.0)
                    .scaleEffect(card.id == currentIndex ? 1.0 : 0.4)
            }
            Group {
                Text(title)
                    .font(.headline.bold())
                    .overlay(
                        Rectangle()
                            .frame(width: 60,height: 1)
                            .offset(y: 6), alignment: .bottom)
                
                Text(caption)
                    .font(.footnote)
                    .frame(width: cardWidth / 1.3)
                    .multilineTextAlignment(.center)
                    .padding(10)
            }
            .opacity(card.id == currentIndex ? 1.0 : 0.0)
            .scaleEffect(card.id == currentIndex ? 1.0 : 0.4)
            .foregroundStyle(.white)
        }
        .modifier(
            GoalCardGradientModifier(
            cornerRadius: 15,
            leftColor: .blueLinearLight,
            rightColor: .blueLinear,
            foregroundColor: card.color,
            width: cardWidth,
            height: cardHeight,
            scale: card.id == currentIndex ? 1.0 : 0.6,
            opacity: card.id <= currentIndex + 1 ? 1.0 : 0.0,
            shadowColor: .purpleLinear
            )
        )
        .frame(width: cardWidth, height: cardHeight)
        .offset(x: CGFloat(card.id - currentIndex) * offset)
    }
}
