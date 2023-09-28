//
//  CounterViewModel.swift
//  HackaTruco
//
//  Created by Well on 27/09/23.
//

import Foundation

class CounterViewModel{
    static let shared = CounterViewModel()
    
    func roundWinner(player: PlayerModel) -> Int {
        return 1
    }
    
    func matchWinner(matchPoints: Int, player: PlayerModel) -> PlayerModel{
        return player
    }
    
    func updateScoreboard(){
        
    }
}

