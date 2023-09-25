//
//  DeckOfCards.swift
//  HackaTruco
//
//  Created by Natan de Camargo Rodrigues on 25/09/23.
//

import Foundation

//padrao de id e status ao puxar o GET da api 
protocol DeckOfCards: Codable, Hashable {
    var sucess: Bool { get }
    var deckId: String { get }
}
