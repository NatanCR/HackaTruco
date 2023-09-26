import SwiftUI

struct GameView: View {
    @ObservedObject var controllerAPI: ApiRequest
    @State var player1 = PlayerModel()
    @State var player2 = PlayerModel()
    
    var body: some View{
        VStack(content: {
            ScoreView(scorePlayer: 10, scoreCPU: 12, round: 2)
            Spacer()
            
            Button {
                dump(player1.handCards)
                dump(player2.handCards)
            } label: {
                Text("Set Cards")
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

