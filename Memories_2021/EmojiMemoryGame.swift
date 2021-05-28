//
//  EmojiMemoryGame.swift
//  Memories_2021
//
//  Created by HY Chuang on 2021/5/26.
//


// ViewModel
import SwiftUI

class EmojiMemoryGame: ObservableObject {
    static let emojis: [String] = ["🚗", "🚎", "🚲" ,"🛺",
                            "🚔", "🚁", "🚜", "🚑" ,
                            "🛵" ,"🚓", "🚠" , "🚟",
                            "🚞", "🚝", "🚄", "🚅",
                            "🚊", "🚉", "🛫", "🛬",
                            "🛩", "🛰", "🚀", "🛸"]
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 3){ pairIndex in
            emojis[pairIndex]
        }
    }
    
    @Published private var model: MemoryGame<String> = createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    // MARK: - Intent(s)
    
    func choose(_ card: MemoryGame<String>.Card){
        model.choose(card)
    }
}
