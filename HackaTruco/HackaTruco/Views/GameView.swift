import SwiftUI

struct GameView: View {
    @ObservedObject var controllerAPI: ApiRequest
    @State var player1 = PlayerModel()
    @State var player2 = PlayerModel()
    @State var showMsg: Bool = false

    
    var body: some View{
        VStack(content: {
            ScoreView(scorePlayer: 10, scoreCPU: 12, round: 2)
            Spacer()
            if showMsg {
                RoundedRectangle(cornerRadius: 8)
                    .foregroundColor(Color("red")).bold()
                    .frame(maxWidth: 200, maxHeight: 50)
                    .overlay(
                        Text("Partida duplicada")
                            .font(.system(size: 20))
                            .foregroundColor(.white).bold()
                    )
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2, execute: {
                            self.showMsg.toggle()
                        })
                    }
                Spacer()
            }
            Button {
                dump(player1.handCards)
                dump(player2.handCards)
            } label: {
                Text("Set Cards")
            }
            Button {
                    self.showMsg.toggle()
                
            } label: {
                Text("Truco")
            }
            
        })
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .foregroundColor(.white)
        .background(Color(UIColor(named: "bgHomeColor") ?? .blue))
        .onAppear {
            print("ON APPEAR")
            controllerAPI.drawCard(deckId: controllerAPI.reshuffle?.deck_id ?? "", drawCount: 3) { card in
                player1.handCards = card.cards
            }
            controllerAPI.drawCard(deckId: controllerAPI.reshuffle?.deck_id ?? "", drawCount: 3) { card in
                player2.handCards = card.cards
            }
        }
    }
}

