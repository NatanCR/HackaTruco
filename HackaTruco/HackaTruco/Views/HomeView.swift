//
//  HomeView.swift
//  HackaTruco
//
//  Created by Natan de Camargo Rodrigues on 25/09/23.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var controllerAPI = ApiRequest()
    @State var player1 = PlayerModel()
    @State var player2 = PlayerModel()
    
    var body: some View {
        ZStack {
            Color("bgHomeColor").ignoresSafeArea()
            Image("bgHome")
                .resizable()
                .frame(height: 1000)
            VStack{
                Text("HackaTruco")
                    .foregroundColor(.white)
                    .font(.system(size: 45, weight: .medium, design: .monospaced))
                    .padding()
                Button {
                    controllerAPI.getNewDeck { deck in
                        
                    }
                                                            
                } label: {
                    Image("btnJogar")
                }
                .padding()
                Button {
                    //func
                    controllerAPI.drawCard(deckId: controllerAPI.reshuffle?.deck_id ?? "", drawCount: 3) { card in
                        player1.handCards = card.cards
                    }
                    
                    controllerAPI.drawCard(deckId: controllerAPI.reshuffle?.deck_id ?? "", drawCount: 3) { card in
                        player2.handCards = card.cards
                    }
                    
                } label: {
                    Image("btnRegras")
                }
                .padding()
                Button {
                    //func
                    dump(player1.handCards)
                    dump(player2.handCards)
                } label: {
                    Image("btnEstatisticas")
                }
                .padding()
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
