//
//  DrawModel.swift
//  HackaTruco
//
//  Created by Natan de Camargo Rodrigues on 25/09/23.
//

import Foundation

//recebe o deck completo de cartas da api 
struct DrawModel: DeckOfCards {
    var sucess: Bool
    var deckId: String
    var cards: [CardModel]
    var remaining: Int
}
