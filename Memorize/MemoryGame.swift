//
//  MemoryGame.swift
//  Memorize
//
//  Created by Valeriy Kovalevskiy on 6/3/20.
//  Copyright © 2020 Valeriy Kovalevskiy. All rights reserved.
//

import Foundation

struct MemoryGame<CardContent> {
    var cards: Array<Card>
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>()
        
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: pairIndex * 2 + 1))
            cards.append(Card(content: content, id: pairIndex * 2 + 1))
        }
    }
    func chooseCard(card: Card) {
        print("card chosen: \(card)")
    }
    
    
    struct Card: Identifiable {
        var isFaceUp: Bool = true
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }
}




