//
//  CardModel.swift
//  HackaTruco
//
//  Created by Natan de Camargo Rodrigues on 25/09/23.
//

import Foundation

//estruturas das cartas

public enum CardsValue : String, CaseIterable, Codable {
    case ace = "ACE" //as
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"
    case ten = "10"
    case jack = "JACK" //jota
    case queen = "QUEEN" //dama
    case king = "KING" //reis
}

public enum CardsSuits: String, CaseIterable, Codable {
    case clubs = "CLUBS" // paus
    case hearts = "HEARTS" // copas
    case spades = "SPADES" // espadas
    case diamonds = "DIAMONDS" // ouros
}

public struct CardImages : Codable, Hashable {
    var svg: String
    var png: String
}

public struct CardModel : Codable, Hashable {
    var code: String
    var image: String
    var images: CardImages
    var value: String
    var suit: String
}
