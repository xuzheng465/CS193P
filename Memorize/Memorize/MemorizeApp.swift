//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Xu Zheng on 21/6/2022.
//

import SwiftUI

@main
struct MemorizeApp: App {
    let game = EmojiMemoryGame()
  
    var body: some Scene {
        WindowGroup {
          ContentView(game: game)
        }
    }
}
