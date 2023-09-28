//
//  cardComponent.swift
//  HackaTruco
//
//  Created by Bruno Lafayette on 27/09/23.
//

import SwiftUI

struct CardComponent: View{
    
    private var imageCard: PlayerModel
    private var isPlayer: Bool
    private var turn: Bool
    @StateObject private var gameManager = GameManager.shared

    init(imageCard: PlayerModel, isPlayer: Bool, turn: Bool) {
        self.imageCard = imageCard
        self.isPlayer = isPlayer
        self.turn = turn
    }
    
    var body: some View {
        HStack{
            Spacer()
            ForEach(Array(imageCard.handCards.enumerated()), id: \.offset) {index, card in
                Button(action: {
                
                    gameManager.addCurrentCard(index, card: card)
                    gameManager.player.turn = false
                    
                    Task {
                        while !gameManager.player.turn {
                            await gameManager.computer.currentCard = PlayerManager.sharedBot.playRandomCard(handCards: gameManager.computer.handCards)
                            gameManager.computer.handCards.removeAll {$0.code == gameManager.computer.currentCard?.code}
                            await gameManager.clearTable()
//                            TableManager.compareCardsOnTable(player1: &gameManager.player, player2: &gameManager.computer, shackle: gameManager.schale)
                            gameManager.player.turn = true
                        }
                        
                    }
                    
                }, label: {
                    if isPlayer{ ImageCardComponent(url: card.image) }
                    else { Image(uiImage: UIImage(named: "card")!).resizable().frame(maxWidth: 60,maxHeight: 90) }
                }).disabled(!isPlayer)

            }
            Spacer()
            
        }.padding()
    }
    
}
