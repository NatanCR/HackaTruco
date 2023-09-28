//
//  PlayerManager.swift
//  HackaTruco
//
//  Created by Natan de Camargo Rodrigues on 26/09/23.
//

import Foundation

class PlayerManager {
    
    static let sharedBot: PlayerManager = .init()
    
    private init(){
    
    }
    
    /**
     * Recebe um model de um player e retorna um vetor com os links das imagens das cartas que tem em sua respectiva mao
     */
    public static func getPlayersCardImagesUrl(player: PlayerModel) -> [String] {
        var cardsUrl: [String] = []
        
        if player.handCards.isEmpty { return [] }
        
        for card in player.handCards {
            cardsUrl.append(card.images.png)
        }
        
        return cardsUrl
    }
    
    /** Função para primeira jogada do bot (jogando maior carta da mão)*/
    func getStrongCard(cards: [CardModel]) -> CardModel? {
        
        guard !cards.isEmpty else {
            return nil
        }

        var cardWeights: [Int] = []

        for card in cards {
            if let value = CardsValue(rawValue: card.value ) {
                cardWeights.append(value.weight)
            }
        }

        var maxWeight = cardWeights.max()
        var minWeight = cardWeights.min()

        return nil
    }

}
