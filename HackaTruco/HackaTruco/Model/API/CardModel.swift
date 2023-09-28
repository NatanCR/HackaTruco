//
//  CardModel.swift
//  HackaTruco
//
//  Created by Natan de Camargo Rodrigues on 25/09/23.
//

import Foundation

//estruturas das cartas
//3 > 2 > A > k > J > Q > 7 > 6 > 5 > 4 -> usadas no truco

public enum CardsValue : String, CaseIterable, Codable {
    case ace = "ACE" //as
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case jack = "JACK" //jota
    case queen = "QUEEN" //dama
    case king = "KING" //reis
    
    var weight: Int {
        switch self {
        case .three: return 10
        case .two: return 9
        case .ace: return 8
        case .king: return 7
        case .jack: return 6
        case .queen: return 5
        case .seven: return 4
        case .six: return 3
        case .five: return 2
        case .four: return 1
        }
    }
}

public enum CardsSuits: String, CaseIterable, Codable {
    case clubs = "CLUBS" // paus
    case hearts = "HEARTS" // copas
    case spades = "SPADES" // espadas
    case diamonds = "DIAMONDS" // ouros
    
    var weight: Int {
        switch self {
        case .clubs: return 4
        case .hearts: return 3
        case .spades: return 2
        case .diamonds: return 1
        }
    }
}

public struct CardImages : Codable, Hashable {
    var svg: String
    var png: String
}

public struct CardModel : Codable, Hashable{

    var code: String
    var image: String
    var images: CardImages
    var value: String
    var suit: String
}

public struct Card {
    var code: String 
    var weight: Int //numero ou letra
    var suit: String //naipe
}
