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
    
    //MARK: - Funções do BOT
    
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
    
    /**Função para calcular se o bot tem cartas boas para pedir truco**/
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
        
        if cards.count == 3 {
            // Verifica se o total é maior ou igual a 17
            return totalWeight >= 17
        } else if cards.count == 2 {
            return totalWeight >= 13
        } else {
            return totalWeight >= 8
        }
    }
    
    func doubleTruco(cards: [CardModel], manilha: Card) -> Bool {
        guard !cards.isEmpty else {
            return false
        }
        print("CARDS")
        dump(cards)
        print("MANILHA")
        dump(manilha)
        // Verificar se há uma carta com o valor "3"
        let hasValue3 = cards.contains { $0.value == "3" }
        
        // Verificar se algum CardModel tem weight igual ou maior ao da manilha
        let hasManilha = cards.contains { cardModel in
            if let cardValue = CardsValue(rawValue: cardModel.value) {
                return cardValue.weight == manilha.weight
            }
            return false
        }
        print("DOBRA?")
        print(hasValue3 || hasManilha)
        return hasValue3 || hasManilha
    }
}
