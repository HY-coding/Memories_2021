//
//  EmojiMemoryGame.swift
//  Memories_2021
//
//  Created by HY Chuang on 2021/5/26.
//

import SwiftUI

class EmojiMemoryGame {
    static let emojis: [String] = ["🚗", "🚎", "🚲" ,"🛺",
                            "🚔", "🚁", "🚜", "🚑" ,
                            "🛵" ,"🚓", "🚠" , "🚟",
                            "🚞", "🚝", "🚄", "🚅",
                            "🚊", "🚉", "🛫", "🛬",
                            "🛩", "🛰", "🚀", "🛸"]
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 4){ pairIndex in
            emojis[pairIndex]
        }
    }
    
    private var model: MemoryGame<String> = createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
}
