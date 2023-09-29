//
//  ScoreView.swift
//  HackaTruco
//
//  Created by Bruno Lafayette on 26/09/23.
//

import SwiftUI

struct ScoreView: View{
    private var scorePlayer: Int
    private var scoreCPU: Int
    private var round: Int
    @ObservedObject var gm: GameManager
    init(scorePlayer: Int, scoreCPU: Int, round: Int, gameManager: GameManager) {
        self.scorePlayer = scorePlayer
        self.scoreCPU = scoreCPU
        self.round = round
        self.gm = gameManager
    }
    
    var body: some View{
        HStack(content: {
            Text("Jogador: \(gm.player.roundScore)")
                .frame(width: 90)
                .font(.system(size: 16))
                .fontWeight(.semibold)
                .padding(.leading, 40)
            VStack{
                Text(String(gm.player.finalScore))
                    .font(.system(size: 48))
                    .fontWeight(.semibold)
                    .padding(.top, 5)
                Text("Rodada")
                    .font(.system(size: 16))
                    .fontWeight(.regular)
                Spacer()
            }.padding(.leading, 30)
            Spacer()
            Text("CPU: \(gm.computer.roundScore)")
                .frame(width: 90)
                .font(.system(size: 16))
                .fontWeight(.semibold)
                .padding(.trailing, 20)
            Spacer()

        })
        .frame(maxWidth: .infinity, maxHeight: 95)
        .foregroundColor(.white)
        .background(Color(UIColor(named: "secundaryColor") ?? .blue))
        
    }
}

//struct ContentView_Previews_ScoreView: PreviewProvider {
//    static var previews: some View {
//        ScoreView(scorePlayer: 1, scoreCPU: 12, round: 12)
//    }
//}
