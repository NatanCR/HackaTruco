import SwiftUI

struct GameView: View {
    
    @ObservedObject var controllerAPI: ApiRequest
    @StateObject private var gameManager = GameManager.shared
    @State var trucoAccepted: Bool = false
    @State var trucoRecused: Bool = false

    var body: some View{
        VStack(content: {
            ScoreView(scorePlayer: 10, scoreCPU: 12, round: 2, gameManager: gameManager)
            CardComponent(imageCard: gameManager.computer, isPlayer: false, turn: gameManager.player.turn, acceptTruco: $trucoAccepted, recusedTruco: $trucoRecused)
           
            Spacer()
            
            HStack(spacing: -50){
                Spacer()
                ImageCardComponent(url: gameManager.player.currentCard?.image ?? String()).padding(.trailing, 70)
                ImageCardComponent(url: gameManager.shackle?.image ?? String())
                Image(uiImage: UIImage(named: "card") ?? .strokedCheckmark).resizable().frame(maxWidth: 72,maxHeight: 100)
                ImageCardComponent(url: gameManager.computer.currentCard?.image ?? String()).padding(.leading, 70)
                Spacer()
            }
          
            Spacer()
          
            ZStack{
                CardComponent(imageCard: gameManager.player, isPlayer: true, turn: gameManager.computer.turn, acceptTruco: $trucoAccepted, recusedTruco: $trucoRecused)
                    .disabled(!gameManager.player.turn)
                    
                if trucoAccepted{
                    RoundedRectangle(cornerRadius: 8)
                        .foregroundColor(Color("red")).bold()
                        .frame(maxWidth: 200, maxHeight: 50)
                        .overlay(
                            Text("DESCE!!")
                                .font(.system(size: 20))
                                .foregroundColor(.white).bold()
                        )
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2, execute: {
                                self.trucoAccepted.toggle()
                            })
                        }
                    Spacer()
                }
                
                if trucoRecused{
                    RoundedRectangle(cornerRadius: 8)
                        .foregroundColor(.white).bold()
                        .frame(maxWidth: 200, maxHeight: 50)
                        .overlay(
                            Text("COVARDE!!")
                                .font(.system(size: 20))
                                .foregroundColor(Color("red")).bold()
                        )
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2, execute: {
                                self.trucoRecused.toggle()
                            })
                        }
                    Spacer()
                }
            }

            Spacer()
            
            Button {
                gameManager.truco = true
                print(trucoAccepted)
            } label: {
                Text("TRUCO!!!")
                    .fontWeight(.bold)
            }
            .padding(12)
            .background(Color(.red))
            .foregroundColor(.white)
            .cornerRadius(8)
            Spacer()
        })
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .foregroundColor(.white)
        .background(Color(UIColor(named: "bgHomeColor") ?? .blue))
        .onAppear {
            gameManager.newGame(controllerAPI)
        }
//        .alert(isPresented: $trucoAccepted) {
//                Alert(title: Text("TRUCO!"), message: Text("Truco aceito!!!"), dismissButton: .default(Text("DESCE!")))
//        }
//        .alert(isPresented: $trucoRecused) {
//                Alert(title: Text("TRUCO!"), message: Text("Truco recusado!!!"), dismissButton: .default(Text("FRACO!")))
//        }
    }
}

