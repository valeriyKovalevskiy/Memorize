//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Valeriy Kovalevskiy on 6/3/20.
//  Copyright © 2020 Valeriy Kovalevskiy. All rights reserved.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    @Published private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    private static func createMemoryGame() -> MemoryGame<String> {
        let emojis: Array<String> = ["🏆", "🎻", "👻", "🚕", "🇰🇷"]
        let randomNumberOfPairs =  Int.random(in: 3...5)
        return MemoryGame<String>(numberOfPairsOfCards: randomNumberOfPairs) { pairIndex in
            return emojis[pairIndex]
        }
    }
    
    //MARK: - Access to the model
    var cards: Array<MemoryGame<String>.Card> {
        model.cards  
    }
    //MARK: - Intent(s)
    
    func choose(card: MemoryGame<String>.Card) {
        model.chooseCard(card: card)
    }
    
    func resetGame() {
        model = EmojiMemoryGame.createMemoryGame()
    }
}
