//
//  PlayerManager.swift
//  HackaTruco
//
//  Created by Natan de Camargo Rodrigues on 26/09/23.
//

import Foundation

class PlayerManager {
    
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
    
    
    
}
