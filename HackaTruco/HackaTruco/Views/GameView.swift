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
        GeometryReader { geo in
            
            VStack(content: {
                ScoreView(scorePlayer: 10, scoreCPU: 12, round: 2)
                    .frame(width: geo.size.width, height: geo.size.height * 0.2, alignment: .bottom)
                    .background(Color("secundaryColor"))
                
                CardComponent(imageCard: $player2, isPlayer: false, turn: gameMenager.player.turn)
                    .frame(width: geo.size.width, height: geo.size.height * 0.2)
                    .onChange(of: player1.turn) { _ in
                        if !player2.handCards.isEmpty{
                            player2.currentCard = player2.handCards[0]
                            player2.handCards.remove(at: 0)
                        }
                    }
                
                HStack{
                    
                    ZStack{
                        ImageCardComponent(url: shackle?.image ?? String()).padding(.trailing, 35)
                            .rotationEffect(Angle(degrees: -10))
                        Image(uiImage: UIImage(named: "card") ?? .strokedCheckmark).resizable().frame(maxWidth: 72,maxHeight: 100)
                        
                        HStack{
                            ImageCardComponent(url: player1.currentCard?.image ?? String())
                                .rotationEffect(Angle(degrees: 10))
                                .frame(width: geo.size.width * 0.5, alignment: .center)
                                .padding(.top, 55)
                            
                            
                            ImageCardComponent(url: player2.currentCard?.image ?? String())
                                .rotationEffect(Angle(degrees: 20))
                                .frame(width: geo.size.width * 0.4, alignment: .leading)
                            
                        }
                    }
                    
                }
                .frame(width: geo.size.width, height: geo.size.height * 0.25, alignment: .center)
                
                CardComponent(imageCard: $player1, isPlayer: true, turn: gameMenager.computer.turn)
                    .frame(width: geo.size.width, height: geo.size.height * 0.35, alignment: .center)
                
            })
            .frame(width: geo.size.width, height: geo.size.height, alignment: .center)
            //        .frame(maxWidth: .infinity, maxHeight: .infinity)
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
}

