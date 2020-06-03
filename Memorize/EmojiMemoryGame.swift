//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Valeriy Kovalevskiy on 6/3/20.
//  Copyright © 2020 Valeriy Kovalevskiy. All rights reserved.
//

//for viewModel we use classes because it's easy to share

import SwiftUI

func createCardContent(pairIndex: Int) -> String {
    return "fds"
}

class EmojiMemoryGame {
    private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    static func createMemoryGame() -> MemoryGame<String> {
        let emojis: Array<String> = ["👻", "🎻", "🏆"]
        return MemoryGame<String>(numberOfPairsOfCards: emojis.count) { pairIndex in
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
}
