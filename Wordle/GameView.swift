//
//  ContentView.swift
//  Wordle
//
//  Created by Priyam Soni on 22/05/24.
//

import SwiftUI

struct GameView: View {
    @EnvironmentObject var viewModel: WordleDataModel
    
    var body: some View {
        NavigationView{
            VStack{
                Spacer()
                
                VStack(spacing: 3){
                    ForEach(0...5, id: \.self){ index in
                        GuessView(guess: $viewModel.guesses[index])
                    }
                }
                .frame(width: Global.boardWidth, height: 6 * Global.boardWidth / 5)
                
                Spacer()
                
                Keyboard()
                    .scaleEffect(Global.keyboardScale)
                    .padding(.top)
                
                Spacer()
            }
            .padding()
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .topBarLeading) {
                    Button{
                        
                    }label: {
                        Image(systemName: "questionmark.circle")
                    }
                }
                    
                ToolbarItem(placement: .principal) {
                    Text("WORDLE")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundStyle(.primary)
                }
                    
                ToolbarItem(placement: .topBarTrailing) {
                    HStack{
                        Button{
                                
                        }label: {
                            Image(systemName: "chart.bar")
                        }
                            
                        Button{
                            
                        }label: {
                            Image(systemName: "gearshape.fill")
                        }
                    }
                }
            }
        }
        .navigationViewStyle(.stack)
    }
}

#Preview {
    GameView()
        .environmentObject(WordleDataModel())
}
