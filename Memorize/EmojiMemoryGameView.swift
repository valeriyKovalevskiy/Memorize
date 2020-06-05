//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Valeriy Kovalevskiy on 6/2/20.
//  Copyright © 2020 Valeriy Kovalevskiy. All rights reserved.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        Grid(items: viewModel.cards) { card in
            CardView(card: card)
//                .aspectRatio(2/3, contentMode: .fit)
                .onTapGesture {
                    self.viewModel.choose(card: card)
            }
            .padding()
        }
        .foregroundColor(Color.orange)
    }
}

struct CardView: View {
    //MARK: - Drawing constants
    let cornerRadius: CGFloat = 10
    let lineWidth: CGFloat = 3
    let fontScaleFactor: CGFloat = 0.75
    
    var card: MemoryGame<String>.Card
    var body: some View {
        GeometryReader { geometry in
            self.body(for: geometry.size)
        }
    }
    
    func body(for size: CGSize) -> some View {
        ZStack {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: cornerRadius).fill().foregroundColor(Color.white)
                RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: lineWidth)
                Text(card.content)
            } else {
                if !card.isMatched {
                    RoundedRectangle(cornerRadius: cornerRadius).fill()
                } 
            }
        }
        .font(Font.system(size: fontSize(for: size)))
    }
    
    func fontSize(for size: CGSize) -> CGFloat {
        min(size.width,  size.height) * fontScaleFactor
    }
}
















struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewModel: EmojiMemoryGame())
    }
}
