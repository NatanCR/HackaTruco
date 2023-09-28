//
//  StatusGame.swift
//  HackaTruco
//
//  Created by Luana Moraes on 27/09/23.
//

import Foundation

 class StatusManager: ObservableObject {
     
     @Published var postData = [StatusModel]()
     
     func fetchData() async {
         guard let downloadedPosts: [StatusModel] = await Service().downloadData(fromURL: "http://127.0.0.1:1880/hackatrucoPOST") else {return}
         postData = downloadedPosts
     }
    
    var sequence: [Bool] = []
    
    //salvando no userdefaults
    @Published var matches: Int {
        didSet {
            UserDefaults.standard.set(matches, forKey: "partidasIniciadas")
        }
    }
    
    @Published var wins: Int {
        didSet {
            UserDefaults.standard.set(wins, forKey: "partidasGanhas")
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
        self.matches = UserDefaults.standard.integer(forKey: "partidasIniciadas")
        self.wins = UserDefaults.standard.integer(forKey: "partidasGanhas")
        self.defeats = UserDefaults.standard.integer(forKey: "derrotas")
        self.winSequence = UserDefaults.standard.integer(forKey: "sequenciasGanhas")
    }
    
    func saveGameStatus() {
        var currentSequence = 0
        var longestSequence = 0
        for value in sequence {
            if value {
                // Se o valor é true, incrementa a sequência atual
                currentSequence += 1
                // Atualiza a maior sequência
                longestSequence = max(longestSequence, currentSequence)
            } else {
                // Se o valor é false, reseta a sequência atual
                currentSequence = 0
            }
        }
        winSequence = longestSequence
        
    }
    
    func startMatch() {
        matches += 1
        saveGameStatus()
    }
    
    func winMatch() {
        startMatch()
        wins += 1
        sequence.append(true)
    }
    
    func loseMatch() {
        startMatch()
        defeats += 1
        sequence.append(false)
    }
    
    // para testes
    func zerarVariaveis() {
        let status = StatusManager()
        status.matches = 0
        status.defeats = 0
        status.winSequence = 0
        status.wins = 0
        saveGameStatus()
        
    }
    
}
