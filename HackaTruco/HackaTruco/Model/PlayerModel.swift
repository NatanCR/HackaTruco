//
//  PlayerModel.swift
//  HackaTruco
//
//  Created by Natan de Camargo Rodrigues on 26/09/23.
//

import Foundation

struct PlayerModel: Hashable {
    var id = UUID()
    var name: String
    var roundScore: Int
    var finalScore: Int
    var handCards: [CardModel]
    var currentCard: CardModel?
    var turn: Bool = true
    
    init(id: UUID = UUID(), name: String, roundScore: Int, finalScore: Int, handCards: [CardModel], currentCard: CardModel?) {
        self.id = id
        self.name = name
        self.roundScore = roundScore
        self.finalScore = finalScore
        self.handCards = handCards
        self.currentCard = nil
        
    }
    
    //inicializa um player com round zerado e cartas vazias 
    init(id: UUID = UUID()) {
        self.id = id
        self.name = "Player1"
        self.roundScore = 0
        self.finalScore = 0
        self.handCards = []
        self.currentCard = nil
    }
    
    mutating func reset() {
        if self.roundScore >= 2 {
            self.finalScore += 1
        }
        
        self.roundScore = 0
        self.handCards.removeAll()
        self.currentCard = nil
    }
}
