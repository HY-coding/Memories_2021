//
//  EmojiMemoryGame.swift
//  Memories_2021
//
//  Created by HY Chuang on 2021/5/26.
//


// ViewModel
import SwiftUI

class EmojiMemoryGame: ObservableObject {
    
    typealias Card = MemoryGame<String>.Card
    
    private static let emojis: [String] = ["🚗", "🚎", "🚲" ,"🛺",
                            "🚔", "🚁", "🚜", "🚑" ,
                            "🛵" ,"🚓", "🚠" , "🚟",
                            "🚞", "🚝", "🚄", "🚅",
                            "🚊", "🚉", "🛫", "🛬",
                            "🛩", "🛰", "🚀", "🛸"]
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards:  20){ pairIndex in
            emojis[pairIndex]
        }
    }
    
    @Published private var model = createMemoryGame()
    
    var cards: Array<Card> {
        return model.cards
    }
    
    // MARK: - Intent(s)
    
    func choose(_ card: Card){
        model.choose(card)
    }
}
