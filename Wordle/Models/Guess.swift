//
//  Guess.swift
//  Wordle
//
//  Created by Priyam Soni on 23/05/24.
//

import Foundation
import SwiftUI

struct Guess{
    let index: Int
    var word: String = "     "
    var bgColors: [Color] = [Color](repeating: .systemBackground, count: 5)
    var cardFlipped: [Bool] = [Bool](repeating: false, count: 5)
    var guessLetters: [String] {
        word.map{ String($0) }
    }
}
