//
//  TableManager.swift
//  HackaTruco
//
//  Created by Natan de Camargo Rodrigues on 27/09/23.
//

import Foundation

class TableManager {
    
    func compareCardsOnTable(player1: PlayerModel, player2: PlayerModel, manilha: TableModel) -> PlayerModel {
        var roundResult: Int = 0
        var sumPlayer1 = CardsValue(rawValue: player1.currentCard?.value ?? "")!.weight + CardsSuits(rawValue: player1.currentCard?.suit ?? "")!.weight
        
        var sumPlayer2 = CardsValue(rawValue: player2.currentCard?.value ?? "")!.weight + CardsSuits(rawValue: player2.currentCard?.suit ?? "")!.weight
        
        if player1.currentCard.
    }
}
