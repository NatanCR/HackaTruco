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
    
    /** Função para pegar o peso mais forte ou mais fraco das cartas em mãos*/
    func getCodeCard(cards: [CardModel], getStrong: Bool) -> Card? {
        
        guard !cards.isEmpty else {
            return nil
        }
        
        var cardWeights: [Card] = []
        
        for card in cards {
            if let value = CardsValue(rawValue: card.value ) {
                cardWeights.append(Card(code: card.code, weight: value.weight, suit: card.suit))
            }
        }
        
        // Encontrar o Card com o maior weight
        let maxWeightCard = cardWeights.max(by: { $0.weight < $1.weight })
        
        // Encontrar o Card com o menor weight
        let minWeightCard = cardWeights.min(by: { $0.weight < $1.weight })
        
        if getStrong {
            return maxWeightCard
        } else {
            return minWeightCard
        }
    }
    
    /**Função para pegar a carta inteira com base no peso escolhido pela func getCodeCard**/
    func getCardModel(cards: [CardModel], getStrong: Bool) -> CardModel? {
        guard !cards.isEmpty else {
            return nil
        }
        
        guard let codeCard = getCodeCard(cards: cards, getStrong: getStrong) else {
            return nil
        }
        
        // Encontre o CardModel com o mesmo código (code) que o codeCard
        if let matchingCardModel = cards.first(where: { $0.code == codeCard.code }) {
            return matchingCardModel
        } else {
            return nil
        }
    }
    
    
    func isWeightAverageGreaterOrEqual18(cards: [CardModel]) -> Bool {
        guard !cards.isEmpty else {
            return false
        }
        
        // Inicializa uma variável para armazenar a soma dos pesos
        var totalWeight = 0

        for card in cards {
            if let value = CardsValue(rawValue: card.value) {
                // Adiciona o peso de cada CardModel à soma total
                totalWeight += value.weight
            }
        }

        // Verifica se o total é maior ou igual a 17
        return totalWeight >= 17
    }
}
