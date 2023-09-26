//
//  PlayerModel.swift
//  HackaTruco
//
//  Created by Natan de Camargo Rodrigues on 26/09/23.
//

import Foundation

struct PlayerModel {
    var id = UUID()
    var roundScore: Int
    var finalScore: Int
    var handCards: [CardModel]
    
    init(id: UUID = UUID(), roundScore: Int, finalScore: Int, handCards: [CardModel]) {
        self.id = id
        self.roundScore = roundScore
        self.finalScore = finalScore
        self.handCards = handCards
    }
    
    //inicializa um player com round zerado e cartas vazias 
    init(id: UUID = UUID()) {
        self.id = id
        self.roundScore = 0
        self.finalScore = 0
        self.handCards = []
    }
}
