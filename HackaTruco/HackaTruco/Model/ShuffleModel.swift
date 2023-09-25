//
//  ShuffleModel.swift
//  HackaTruco
//
//  Created by Natan de Camargo Rodrigues on 25/09/23.
//

import Foundation

//pra usar o baralho existente e trazer ele embaralhado
public struct ShuffleModel : DeckOfCards {
    var success: Bool
    var deckId: String
    var shuffled: Bool
    var remaining: Int
}
