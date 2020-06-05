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
    mutating func chooseCard(card: Card) {
        print("card chosen: \(card)")
        if let chosenIndex = self.index(of: card) {
            self.cards[chosenIndex].isFaceUp.toggle()
        }
    }
    
    func index(of card: Card) -> Int? {
        for index in 0..<self.cards.count {
            if self.cards[index].id == card.id {
                return index
            }
        }
        return nil
    }
    
    struct Card: Identifiable {
        var isFaceUp: Bool = true
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }
}




