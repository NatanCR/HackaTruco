import SwiftUI

struct GameView: View {
    
    @ObservedObject var controllerAPI: ApiRequest
    @State var player1 = PlayerModel()
    @State var player2 = PlayerModel()
    @State var shackle: CardModel? = nil
    
    var body: some View{
        VStack(content: {
            ScoreView(scorePlayer: 5, scoreCPU: 10, round: 3)
            CardComponent(imageCard: [Image(uiImage: UIImage(named: "card")!)], isPlayer: false)
            HStack(spacing: -80){
                AsyncImage(
                    url: URL(string: shackle?.image ?? String()),
                    content: { image in
                        image.resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: 152, maxHeight: 155)
                    },
                    placeholder: {
                        ProgressView()
                    })
                Image(uiImage: UIImage(named: "card")!)
            }
//            CardComponent(imageCard: [], isPlayer: <#Bool#>)
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

