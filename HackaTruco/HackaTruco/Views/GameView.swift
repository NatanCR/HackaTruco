import SwiftUI

struct GameView: View {
    
    @ObservedObject var controllerAPI: ApiRequest
    @State var player1 = PlayerModel()
    @State var player2 = PlayerModel()
    @State var table: TableModel? = nil
    @State var shackle: CardModel? = nil
    
    
    var body: some View{
        VStack(content: {

            ScoreView(scorePlayer: 10, scoreCPU: 12, round: 2)
            CardComponent(imageCard: $player2, isPlayer: false)
            Spacer()
            HStack(spacing: -50){
                ImageCardComponent(url: shackle?.image ?? String())
                Image(uiImage: UIImage(named: "card") ?? .strokedCheckmark).resizable().frame(maxWidth: 72,maxHeight: 100)

            }
            Spacer()
            CardComponent(imageCard: $player1, isPlayer: true)
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
            
            controllerAPI.drawCard(deckId: controllerAPI.reshuffle?.deck_id ?? "", drawCount: 1) { card in
                shackle = card.cards[0]
            }
            
        }
    }
}

