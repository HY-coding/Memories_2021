//
//  MemoryGame.swift
//  Memories_2021
//
//  Created by HY Chuang on 2021/5/26.
//

// Model

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    private(set) var cards: Array<Card>
    
    private var indexOfTheOneAndOnlyFacUpCard: Int? {
        
        get {
            cards.indices.filter({ cards[$0].isFaceUp }).oneAndOnly
        }
        
        set {
            cards.indices.forEach{ cards[$0].isFaceUp = ($0 == newValue) }
        }
        
    }
    
    mutating func choose(_ card: Card) {
            
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id}),
           !cards[chosenIndex].isFaceUp,
           !cards[chosenIndex].isMatched
        {
            
            if let potentialMatchIndex = indexOfTheOneAndOnlyFacUpCard {
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                }
                
                cards[chosenIndex].isFaceUp = true
                
            } else {
                // turn all cards face down
                indexOfTheOneAndOnlyFacUpCard = chosenIndex
            }
            
        }
        
        print("\(cards)")
    }
    
    
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent){
        cards = [] //Array<Card>()
        // add numberOfPairsOfCards x 2 carda to cards array
        for pairIndex in 0 ..< numberOfPairsOfCards {
            let content = createCardContent(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2 + 1))
        }
        
    }
    
    struct Card: Identifiable {
        var isFaceUp = true
        var isMatched = false
        let content: CardContent
        let id: Int
    }
    
}


extension Array {
    var oneAndOnly: Element? {
        if self.count == 1 {
            return self.first
        } else {
            return nil
        }
    }
}
