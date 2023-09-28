import SwiftUI

struct GameView: View {
    
    @ObservedObject var controllerAPI: ApiRequest
    @StateObject private var gameManager = GameManager.shared

    var body: some View{
        VStack(content: {

            ScoreView(scorePlayer: 10, scoreCPU: 12, round: 2)
            CardComponent(imageCard: gameManager.computer, isPlayer: false, turn: gameManager.player.turn)
                
            Spacer()
            
            HStack(spacing: -50){
                Spacer()
                ImageCardComponent(url: gameManager.player.currentCard?.image ?? String()).padding(.trailing, 70)
                ImageCardComponent(url: gameManager.schale?.image ?? String())
                Image(uiImage: UIImage(named: "card") ?? .strokedCheckmark).resizable().frame(maxWidth: 72,maxHeight: 100)
                ImageCardComponent(url: gameManager.computer.currentCard?.image ?? String()).padding(.leading, 70)
                Spacer()
            }
            
            Spacer()
            CardComponent(imageCard: gameManager.player, isPlayer: true, turn: gameManager.computer.turn)
                .disabled(!gameManager.player.turn)

            Spacer()
        })
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .foregroundColor(.white)
        .background(Color(UIColor(named: "bgHomeColor") ?? .blue))
        .onAppear {
            gameManager.newGame(controllerAPI)
        }

    }
}

