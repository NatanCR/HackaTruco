//
//  GameView.swift
//  HackaTruco
//
//  Created by Bruno Lafayette on 26/09/23.
//

import SwiftUI

struct GameView: View {
    var body: some View{
        VStack(content: {
            ScoreView(scorePlayer: 10, scoreCPU: 12, round: 2)
            Spacer()
        })
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .foregroundColor(.white)
        .background(Color(UIColor(named: "bgHomeColor") ?? .blue))
    }
    
}
