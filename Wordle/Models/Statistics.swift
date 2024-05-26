//
//  Statistics.swift
//  Wordle
//
//  Created by Priyam Soni on 26/05/24.
//

import Foundation

struct Statistics: Codable{
    var frequencies = [Int](repeating: 0, count: 6)
    var games = 0
    var streaks = 0
    var maxStreak = 0
    
    var wins: Int {
        frequencies.reduce(0, +)
    }
    
    func saveStat(){
        if let encoded = try? JSONEncoder().encode(self){
            UserDefaults.standard.set(encoded, forKey: "Stat")
        }
    }
    
    static func loadStat() -> Statistics{
        if let savedStat = UserDefaults.standard.object(forKey: "Stat") as? Data {
            if let currentStat = try? JSONDecoder().decode(Statistics.self, from: savedStat){
                return currentStat
            }else{
                return Statistics()
            }
        }
        else{
            return Statistics()
        }
    }
    
    mutating func update(win: Bool, index: Int? = nil) {
        games += 1
        streaks = win ? streaks + 1 : 0
        
        if win {
            frequencies[index!] += 1
            maxStreak = max(maxStreak, streaks)
        }
        
        saveStat()
    }
}
