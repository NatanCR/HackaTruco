//
//  GameManager.swift
//  HackaTruco
//
//  Created by Natan de Camargo Rodrigues on 26/09/23.
//

import Foundation

class GameManager {
    
    public static func identifyManilha(card: CardModel) -> [Card] {
        let manilhaValue = CardsValue.init(rawValue: card.value)!.weight + 1
        return [Card(value: manilhaValue, suit: card.suit)]
    }
    
    
}
