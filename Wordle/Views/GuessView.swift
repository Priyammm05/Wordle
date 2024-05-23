//
//  GuessView.swift
//  Wordle
//
//  Created by Priyam Soni on 23/05/24.
//

import SwiftUI

struct GuessView: View {
    @Binding var guess: Guess
    
    var body: some View {
        HStack(spacing: 3){
            ForEach(0...4, id: \.self){ index in
                Text(guess.guessLetters[index])
                    .foregroundStyle(.primary)
                    .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
                    .background(Color.systemBackground)
                    .font(.system(size: 35, weight: .heavy))
                    .border(Color(.secondaryLabel))
            }
        }
    }
}

#Preview {
    GuessView(guess: .constant(Guess(index: 0)))
}
