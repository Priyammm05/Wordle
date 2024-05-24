//
//  WordleDataModel.swift
//  Wordle
//
//  Created by Priyam Soni on 23/05/24.
//

import SwiftUI

class WordleDataModel: ObservableObject{
    @Published var guesses: [Guess] = []
    @Published var incorrentAttempts = [Int](repeating: 0, count: 6)
    
    var keyColors = [String: Color]()
    
    var selectedWord = ""
    var currentWord = ""
    var tryIndex = 0
    var inPlay = false
    
    var gameStarted: Bool {
        !currentWord.isEmpty || tryIndex > 0
    }
    
    var disabledKeys: Bool {
        !inPlay || currentWord.count == 5
    }
    
    init() {
        newGame()
    }
    
    func newGame() {
        populateDefaults()
        selectedWord = Global.commonWords.randomElement()!
        currentWord = ""
        inPlay = true
    }
    
    func populateDefaults() {
        guesses = []
        
        for index in 0...5 {
            guesses.append(Guess(index: index))
        }
        
//        reset keyboard
        let letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
        
        for char in letters{
            keyColors[String(char)] = .unused
        }
    }
    
    func addToCurrentWord(_ letter: String){
        currentWord += letter
        updateRow()
    }
    
    func enterWord() {
        if verifyWord() {
            print("Valid word")
        }else{
            withAnimation {
                self.incorrentAttempts[tryIndex] += 1
            }
            incorrentAttempts[tryIndex] = 0
        }
    }
    
    func verifyWord() -> Bool {
        UIReferenceLibraryViewController.dictionaryHasDefinition(forTerm: currentWord)
    }
    
    func removeLetterFromCurrentWord(){
        currentWord.removeLast()
        updateRow()
    }
    
    func updateRow(){
        let guessWord = currentWord.padding(toLength: 5, withPad: " ", startingAt: 0)
        guesses[tryIndex].word = guessWord
    }
}
