//
//  ContentView.swift
//  Memorize
//
//  Created by Xu Zheng on 21/6/2022.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var game: EmojiMemoryGame
    
    var body: some View {
        VStack {
            Text("Memorize!")
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(game.cards){ card in
                        CardView(card: card)
                            .aspectRatio(2/3, contentMode: .fit)
                            .onTapGesture {
                                game.choose(card)
                            }
                    }
                }
            }
            
            .foregroundColor(.red)
            Spacer()
            HStack {
                //          remove
                Spacer()
                //          add
                
            }
            .padding()
            .font(.largeTitle)
            
        }
        
        .padding(.horizontal)
        
    }
    
    //  var remove: some View {
    //    Button{
    //      if emojiCount>1{
    //        emojiCount -= 1
    //      }
    //
    //    } label: {
    //      Image(systemName: "minus.circle")
    //    }
    //  }
    //  var add: some View {
    //    Button(action:{
    //      if emojiCount < emojis.count {
    //        emojiCount += 1
    //      }
    //    }, label: {
    //      Image(systemName: "plus.circle")
    //    })
    //  }
}

struct CardView: View {
    let card: MemoryGame<String>.Card
    
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 10)
            if card.isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(card.content).font(.largeTitle)
            } else if card.isMatched {
                shape.opacity(0)
            }
            else {
                shape.fill()
            }
        }
    }
    
}

























struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        ContentView(game: game)
            .preferredColorScheme(.light)
            .previewInterfaceOrientation(.portrait)
        ContentView(game: game)
            .preferredColorScheme(.dark)
            .previewInterfaceOrientation(.portrait)
        
    }
}
