//
//  EstatísticasView.swift
//  HackaTruco
//
//  Created by Luana Moraes on 25/09/23.
//

import SwiftUI

struct EstatisticasView: View {
    
    @ObservedObject var status: GameStatus = GameStatus()
    
    @State private var matchesStarted: Int = 0
    @State private var matchesWon: Int = 0
    @State private var defeats: Int = 0
    @State private var winSequence: Int = 0
    
    var body: some View {
        
        VStack {
            RetanguloComponente(imgName: "flag.2.crossed.fill", description: "Partidas iniciadas", num: matchesStarted)
            RetanguloComponente(imgName: "trophy.fill", description: "Partidas vencidas", num: matchesWon)
            RetanguloComponente(imgName: "xmark", description: "        Derrotas             ", num: defeats)
            RetanguloComponente(imgName: "medal.fill", description: "Sequência vitórias", num: winSequence)
            Spacer()
        }.navigationBarTitle("Estatísticas", displayMode: .inline)
            .toolbarBackground(Color("bgHomeColor"), for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarColorScheme(.dark, for: .navigationBar)
    }
}

struct EstatisticasView_Previews: PreviewProvider {
    static var previews: some View {
        EstatisticasView()
    }
}
