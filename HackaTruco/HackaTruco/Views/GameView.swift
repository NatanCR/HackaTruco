import SwiftUI

struct GameView: View {
    
    @ObservedObject var controllerAPI: ApiRequest
    @State var player1 = PlayerModel()
    @State var player2 = PlayerModel()
    @State var table: TableModel?
    @State var shackle: CardModel?
    @State var round: Int = 0
    @State var winner: PlayerModel?
    let gameMenager = GameManager.shared

    var body: some View{
        VStack(content: {

            ScoreView(scorePlayer: 10, scoreCPU: 12, round: 2)
            CardComponent(imageCard: $player2, isPlayer: false, turn: gameMenager.player.turn)
                .onChange(of: player1.turn) { _ in
                    if !player2.handCards.isEmpty{
                        player2.currentCard = player2.handCards[0]
                        player2.handCards.remove(at: 0)
                    }
                }
                
            Spacer()
            
            HStack(spacing: -50){
                Spacer()
                ImageCardComponent(url: player1.currentCard?.image ?? String()).padding(.trailing, 70)
                ImageCardComponent(url: shackle?.image ?? String())
                Image(uiImage: UIImage(named: "card") ?? .strokedCheckmark).resizable().frame(maxWidth: 72,maxHeight: 100)
                ImageCardComponent(url: player2.currentCard?.image ?? String()).padding(.leading, 70)
                Spacer()
            }
            
            Spacer()
            CardComponent(imageCard: $player1, isPlayer: true, turn: gameMenager.computer.turn)

            Spacer()
        })
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .foregroundColor(.white)
        .background(Color(UIColor(named: "bgHomeColor") ?? .blue))
        .onAppear {
            print("ON APPEAR")
            controllerAPI.drawCard(deckId: controllerAPI.reshuffle?.deck_id ?? "", drawCount: 7) { card in
                player1.handCards = [card.cards[3], card.cards[2], card.cards[0]]
                player2.handCards = [card.cards[4], card.cards[5], card.cards[6]]
                player2.name = "MAQUINA"
                shackle = card.cards[1]
                player2.currentCard = player2.handCards[0]
                player2.handCards.remove(at: 0)
                player1.turn = false
            }
        }

    }
}

