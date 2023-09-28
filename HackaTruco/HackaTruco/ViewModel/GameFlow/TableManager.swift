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
    
    /**Função que recebe os jogadores e a manilha, calcula quem venceu a rodada e devolve o vencedor, se empatar retorna nil**/
    public static func compareCardsOnTable(player1: PlayerModel, player2: PlayerModel, manilha: TableModel) -> PlayerModel? {
        var sumPlayer1: Int
        var sumPlayer2: Int
        
        if player1.currentCard?.code == manilha.manilha.code || player2.currentCard?.code == manilha.manilha.code {
            //nao tem empate
            sumPlayer1 = CardsValue(rawValue: player1.currentCard?.value ?? "")!.weight + CardsSuits(rawValue: player1.currentCard?.suit ?? "")!.weight
            sumPlayer2 = CardsValue(rawValue: player2.currentCard?.value ?? "")!.weight + CardsSuits(rawValue: player2.currentCard?.suit ?? "")!.weight
            
            if sumPlayer1 > sumPlayer2 {
                return player1
            } else {
                return player2
            }
        } else {
            //pode ter empate
            sumPlayer1 = CardsValue(rawValue: player1.currentCard?.value ?? "")!.weight
            sumPlayer2 = CardsValue(rawValue: player2.currentCard?.value ?? "")!.weight
            
            if sumPlayer1 > sumPlayer2 {
                return player1
            } else if sumPlayer2 > sumPlayer1 {
                return player2
            } else {
                return nil
            }
        }
    }
}
