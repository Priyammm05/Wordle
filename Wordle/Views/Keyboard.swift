//
//  Keyboard.swift
//  Wordle
//
//  Created by Priyam Soni on 23/05/24.
//

import SwiftUI

struct Keyboard: View {
    @EnvironmentObject var viewModel: WordleDataModel
    var topArray = "QWERTYUIOP".map{ String($0) }
    var centerArray = "ASDFGHJKL".map{ String($0) }
    var bottomArray = "ZXCVBNM".map{ String($0) }
    
    var body: some View {
        VStack{
            HStack(spacing: 2){
                ForEach(topArray, id: \.self){ letter in
                    LetterButton(letter: letter)
                }
                .disabled(viewModel.disabledKeys)
                .opacity(viewModel.disabledKeys ? 0.6 : 1)
            }
            HStack(spacing: 2){
                ForEach(centerArray, id: \.self){ letter in
                    LetterButton(letter: letter)
                }
                .disabled(viewModel.disabledKeys)
                .opacity(viewModel.disabledKeys ? 0.6 : 1)
            }
            HStack(spacing: 2){
                
                enterButton(letter: "Enter")
                
                
                ForEach(bottomArray, id: \.self){ letter in
                    LetterButton(letter: letter)
                }
                .disabled(viewModel.disabledKeys)
                .opacity(viewModel.disabledKeys ? 0.6 : 1)
                
                deleteButton()
            }
        }
    }
    
    func enterButton(letter: String) -> some View{
        Button{
            viewModel.enterWord()
        }label: {
            Text(letter)
                .font(.system(size: 20))
                .frame(width: 60, height: 50)
                .background(Color.unused)
                .foregroundStyle(.primary)
                .disabled(viewModel.currentWord.count < 5 || !viewModel.inPlay)
                .opacity(viewModel.currentWord.count < 5 || !viewModel.inPlay ? 0.6 : 1)
            
            
        }
        .buttonStyle(.plain)
    }
    
    func deleteButton() -> some View{
        Button{
            viewModel.removeLetterFromCurrentWord()
        }label: {
            Image(systemName: "delete.backward.fill")
                .font(.system(size: 20))
                .frame(width:40, height: 50)
                .background(Color.unused)
                .foregroundStyle(.primary)
                .disabled(viewModel.currentWord.count < 5 || !viewModel.inPlay)
                .opacity(viewModel.currentWord.count < 5 || !viewModel.inPlay ? 0.6 : 1)
            
            
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    Keyboard()
        .environmentObject(WordleDataModel())
        .scaleEffect(Global.keyboardScale)
}
