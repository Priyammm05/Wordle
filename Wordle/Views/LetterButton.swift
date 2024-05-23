//
//  LetterButton.swift
//  Wordle
//
//  Created by Priyam Soni on 23/05/24.
//

import SwiftUI

struct LetterButton: View {
    @EnvironmentObject var viewModel: WordleDataModel
    var letter: String
    
    var body: some View {
        Button{
            viewModel.addToCurrentWord(letter)
        }label: {
            Text(letter)
                .font(.system(size: 20))
                .frame(width: 35, height: 50)
                .background(viewModel.keyColors[letter])
                .foregroundStyle(.primary)
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    LetterButton(letter: "L")
        .environmentObject(WordleDataModel())
}
