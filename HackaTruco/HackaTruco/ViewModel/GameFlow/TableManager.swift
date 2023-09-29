//
//  TableManager.swift
//  HackaTruco
//
//  Created by Natan de Camargo Rodrigues on 27/09/23.
//

import Foundation

class TableManager {
    
    public static func identifyManilha(card: CardModel) -> Card {
        let manilhaValue = CardsValue.init(rawValue: card.value)!.weight + 1
        return Card(code: card.code, weight: manilhaValue, suit: card.suit)
    }
    
    func isShackle(incomeCard: CardModel, tableCard: CardModel) -> Bool {
        let isShackle = incomeCard.code == (tableCard.code)
        return isShackle
    }
    
    @MainActor public func compareCardsOnTable(gm: GameManager) async -> PlayerModel? {
        
        guard
            let playerCurrentCard = gm.player.currentCard,
            let computerCurrentCard = gm.computer.currentCard,
            let tableShackle = gm.shackle
        else {
            return nil
        }
        
        let playerHasShackle = self.isShackle(incomeCard: playerCurrentCard, tableCard: tableShackle)
        let computerHasShackle = self.isShackle(incomeCard: computerCurrentCard, tableCard: tableShackle)
        
        if playerHasShackle == false && computerHasShackle == false {
            return self.checkStrongestCard(player: &gm.player, computer: &gm.computer)
        }
        
        if playerHasShackle && computerHasShackle {
            return self.checkShackle(player: &gm.player, computer: &gm.computer)
        }
        
        if playerHasShackle && computerHasShackle == false {
            return gm.player
        } else {
            return gm.computer
        }
    }
    
    func checkShackle(player: inout PlayerModel, computer: inout PlayerModel) -> PlayerModel{
        guard let cardPlayer = player.currentCard else {return computer}
        guard let cardComputer = computer.currentCard else {return player}
        let sumPlayer1 = CardsValue(rawValue: cardPlayer.value)!.weight + CardsSuits(rawValue: cardPlayer.suit)!.weight
        let sumPlayer2 = CardsValue(rawValue: cardComputer.value)!.weight + CardsSuits(rawValue: cardComputer.suit)!.weight
        
        if sumPlayer1 > sumPlayer2 {
            player.turn = true
            computer.turn = false
            return player
        } else {
            computer.turn = true
            player.turn = false
            return computer
        }
    }
    
    private func checkStrongestCard(player: inout PlayerModel, computer: inout PlayerModel) -> PlayerModel?{
        guard let cardPlayer = player.currentCard else {return computer}
        guard let cardComputer = computer.currentCard else {return player}
        //pode ter empate
        let sumPlayer1 = CardsValue(rawValue: cardPlayer.value)!.weight
        let sumPlayer2 = CardsValue(rawValue: cardComputer.value)!.weight
        print("VALOR PLAYER1 = \(sumPlayer1)   VALOR PLAYER2 = \(sumPlayer2)")
        
        if sumPlayer1 > sumPlayer2 {
            player.turn = true
            computer.turn = false
            return player
        } else if sumPlayer2 > sumPlayer1 {
            computer.turn = true
            player.turn = false
            return computer
        } else {
            return nil
        }
    }
    
    
}
