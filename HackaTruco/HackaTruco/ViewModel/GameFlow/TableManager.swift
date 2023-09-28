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
    public static func compareCardsOnTable(player1: inout PlayerModel, player2: inout PlayerModel, shackle: CardModel?) -> PlayerModel? {
        var sumPlayer1: Int
        var sumPlayer2: Int
        
//        if player1.currentCard == nil {return nil}
//        if player2.currentCard == nil {return nil}
        guard let manilha = shackle else {return nil}
        
        if player1.currentCard?.code == manilha.code || player2.currentCard?.code == manilha.code {
            //nao tem empate
            sumPlayer1 = CardsValue(rawValue: player1.currentCard?.value ?? "")!.weight + CardsSuits(rawValue: player1.currentCard?.suit ?? "")!.weight
            sumPlayer2 = CardsValue(rawValue: player2.currentCard?.value ?? "")!.weight + CardsSuits(rawValue: player2.currentCard?.suit ?? "")!.weight
            
            if sumPlayer1 > sumPlayer2 {
                player1.turn = true
                player2.turn = false
                return player1
            } else {
                player2.turn = true
                player1.turn = false
                return player2
            }
        } else {
//            pode ter empate
            sumPlayer1 = CardsValue(rawValue: player1.currentCard?.value ?? "")!.weight
            sumPlayer2 = CardsValue(rawValue: player2.currentCard?.value ?? "")!.weight
            print("VALOR PLAYER1 = \(sumPlayer1)   VALOR PLAYER2 = \(sumPlayer2)")
            
            if sumPlayer1 > sumPlayer2 {
                print("ENTREI AQUI PORRA")
                player1.turn = true
                player2.turn = false
                return player1
            } else if sumPlayer2 > sumPlayer1 {
                print("ENTREI AQUI AGORA")
                player2.turn = true
                player1.turn = false
                return player2
            } else {
                return nil
            }
        }
    }
}
