//
//  WordleDataModel.swift
//  Wordle
//
//  Created by Priyam Soni on 23/05/24.
//

import SwiftUI

class WordleDataModel: ObservableObject{
    @Published var guesses: [Guess] = []
    
    var keyColors = [String: Color]()
    
    init() {
        newGame()
    }
    
    func newGame() {
        populateDefaults()
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
        
    }
    
    func enterWord(){
        
    }
    
    func removeLetterFromCurrentWord(){
        
    }
}
