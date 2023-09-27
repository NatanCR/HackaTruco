//
//  EstatísticasView.swift
//  HackaTruco
//
//  Created by Luana Moraes on 25/09/23.
//

import SwiftUI

struct EstatisticasView: View {
    
    @ObservedObject var status: GameStatus = GameStatus()
    
    var body: some View {
        
        VStack {
            RetanguloComponente(imgName: "flag.2.crossed.fill", description: "Partidas iniciadas", num: status.matchesStarted)
            RetanguloComponente(imgName: "trophy.fill", description: "   Vitórias        ", num: status.matchesWon)
            RetanguloComponente(imgName: "xmark", description: "        Derrotas             ", num: status.defeats)
            RetanguloComponente(imgName: "medal.fill", description: "Sequência vitórias", num: status.winSequence)
            Spacer()
        }.navigationBarTitle("Estatísticas", displayMode: .inline)
            .toolbarBackground(Color("bgHomeColor"), for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
        
            .onAppear {
                status.testGameStatus()
        }
    }
       
}

struct EstatisticasView_Previews: PreviewProvider {
    static var previews: some View {
        EstatisticasView()
    }
}
