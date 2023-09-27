//
//  StatusGame.swift
//  HackaTruco
//
//  Created by Luana Moraes on 27/09/23.
//

import Foundation

class GameStatus: ObservableObject {
    //salvando no userdefaults
    
    @Published var matchesStarted: Int {
        didSet {
            UserDefaults.standard.set(matchesStarted, forKey: "partidasIniciadas")
        }
    }
    
    @Published var matchesWon: Int {
        didSet {
            UserDefaults.standard.set(matchesWon, forKey: "partidasGanhas")
        }
    }
    
    @Published var defeats: Int {
        didSet {
            UserDefaults.standard.set(defeats, forKey: "derrotas")
        }
    }
    
    @Published var winSequence: Int {
        didSet {
            UserDefaults.standard.set(winSequence, forKey: "sequenciasGanhas")
        }
    }
    init() {
        self.matchesStarted = UserDefaults.standard.integer(forKey: "partidasIniciadas")
        self.matchesWon = UserDefaults.standard.integer(forKey: "partidasGanhas")
        self.defeats = UserDefaults.standard.integer(forKey: "derrotas")
        self.winSequence = UserDefaults.standard.integer(forKey: "sequenciasGanhas")
    }
    
    //teste
    func testGameStatus() {
        
        let status = GameStatus()
        status.matchesStarted += 1
        status.defeats = 0
        status.winSequence = 0
        status.matchesWon = 0
        
        
        
        print("Partidas iniciads: \(status.matchesStarted)")
        print("Derrotas: \(status.defeats)")
        print("Sequência de vitórias: \(status.winSequence)")
        print("Vitórias totais: \(status.matchesWon)")
    }
    
    
}
