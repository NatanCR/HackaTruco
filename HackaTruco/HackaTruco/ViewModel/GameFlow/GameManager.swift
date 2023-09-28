//
//  GameManager.swift
//  HackaTruco
//
//  Created by Natan de Camargo Rodrigues on 26/09/23.
//

import Foundation
import SwiftUI


final class GameManager: ObservableObject {
    
    // MARK: Singleton
    static var shared: GameManager = GameManager()
    
    // MARK: Game Objects
    
    @Published var player: PlayerModel = PlayerModel()
    @Published var computer: PlayerModel = PlayerModel()
    @Published var table: TableModel?
    @Published var schale: CardModel?
    @Published var round: Int = 0
    
    private init() {
        
    }
    
    func resetGame() {
        self.player = PlayerModel()
        self.player.name = "Malucão do Kinderovo"
        
        self.computer = PlayerModel()
        self.computer.name = "Máquina"
        
        self.table = nil
        
        self.schale = nil
        
        self.round = 0
    }
    
    func newGame(controllerAPI: ApiRequest) {
        controllerAPI.drawCard(deckId: controllerAPI.reshuffle?.deck_id ?? "", drawCount: 7) { deck in
            self.player.handCards = [deck.cards[3], deck.cards[2], deck.cards[0]]
            self.computer.handCards = [deck.cards[4], deck.cards[5], deck.cards[6]]
            self.schale = deck.cards[1]
            dump(self.player)
            
        }
    }
    
    func addCurrentCard(_ index: Int, card: CardModel){
//        imageCard.currentCard = card
//        imageCard.handCards.remove(at: index)
    }
}
