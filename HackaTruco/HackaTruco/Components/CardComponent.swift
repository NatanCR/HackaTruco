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
    @Binding var acceptTruco: Bool
    @Binding var recusedTruco: Bool
    @ObservedObject var controllerAPI: ApiRequest

    init(imageCard: PlayerModel, isPlayer: Bool, turn: Bool, acceptTruco: Binding<Bool>, recusedTruco: Binding<Bool>, controllerAPI: ApiRequest) {
        self.imageCard = imageCard
        self.isPlayer = isPlayer
        self.turn = turn
        self._acceptTruco = acceptTruco
        self._recusedTruco = recusedTruco
        self.controllerAPI = controllerAPI
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
                            
                            if gameManager.truco {
                                self.acceptTruco = PlayerManager.sharedBot.isWeightAverageGreaterOrEqual18(cards: gameManager.computer.handCards)
                                self.recusedTruco = !PlayerManager.sharedBot.isWeightAverageGreaterOrEqual18(cards: gameManager.computer.handCards)
//                                self.acceptTruco = true
//                                self.recusedTruco = true
                            }
                            DispatchQueue.main.async {
                                gameManager.computer.handCards.removeAll {$0.code == gameManager.computer.currentCard?.code}
                            }
                            
                            if gameManager.player.currentCard == nil {
                                gameManager.player.turn = true
                                continue
                            }
                            
                            await self.gameManager.calculateRound()
                            
                            if self.gameManager.matchDidEnd {
                                self.gameManager.player.turn = true
                                self.gameManager.newGame(self.controllerAPI)
                            }
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
