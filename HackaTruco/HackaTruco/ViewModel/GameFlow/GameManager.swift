//
//  GameManager.swift
//  HackaTruco
//
//  Created by Natan de Camargo Rodrigues on 26/09/23.
//

import Foundation
import SwiftUI

@MainActor
final class GameManager: ObservableObject {
    
    // MARK: Singleton
    static var shared: GameManager = GameManager()
    
    // MARK: Game Objects
    @Published var player: PlayerModel = PlayerModel()
    @Published var computer: PlayerModel = PlayerModel()
    @Published var table: TableModel?
    @Published var shackle: CardModel?
    @Published var round: Int = 0
    
    var matchDidEnd: Bool = false
    
    private let tableManager: TableManager = TableManager()
    
    private init() {
        self.player.name = "Malucão do Kinderovo"
        self.computer.name = "Máquina"
    }
    
    func resetGame() {
        self.player = PlayerModel()
        self.computer = PlayerModel()
        self.table = nil
        self.shackle = nil
        self.round = 0
    }
    
    func newGame(_ controllerAPI: ApiRequest) {
        controllerAPI.drawCard(deckId: controllerAPI.reshuffle?.deck_id ?? "", drawCount: 7) { deck in
            self.player.handCards = [deck.cards[3], deck.cards[2], deck.cards[0]]
            self.computer.handCards = [deck.cards[4], deck.cards[5], deck.cards[6]]
            self.shackle = deck.cards[1]
            self.matchDidEnd = false
            dump(self.player)
        }
    }
    
    func addCurrentCard(_ index: Int, card: CardModel){
        self.player.currentCard = card
        self.player.handCards.remove(at: index)
    }
    
    func clearTable() async {
        try? await Task.sleep(until: .now.advanced(by: .seconds(3)))
        self.player.currentCard = nil
        self.computer.currentCard = nil
    }
    
    func calculateRound() async {
        let winner = await self.tableManager.compareCardsOnTable(gm: self)
        
        if winner?.name == player.name {
            self.player.roundScore += 1
        } else {
            self.computer.roundScore += 1
        }
        
        if self.player.roundScore == 2 || self.computer.roundScore == 2 {
            endMatch()
        }
        
        await self.clearTable()
    }
    
    func endMatch() {
        self.player.reset()
        self.computer.reset()
        self.matchDidEnd = true
    }
}
