//
//  Memories_2021App.swift
//  Memories_2021
//
//  Created by HY Chuang on 2021/5/21.
//

import SwiftUI

@main
struct Memories_2021App: App {
    private let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(game: game)
        }
    }
}
