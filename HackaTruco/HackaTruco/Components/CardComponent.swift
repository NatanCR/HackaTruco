//
//  cardComponent.swift
//  HackaTruco
//
//  Created by Bruno Lafayette on 27/09/23.
//

import SwiftUI

struct CardComponent: View{
    
    @Binding private var imageCard: PlayerModel
    private var isPlayer: Bool
    @Binding private var turn: Bool
    
    init(imageCard: Binding<PlayerModel>, isPlayer: Bool, turn: Binding<Bool>) {
        self._imageCard = imageCard
        self.isPlayer = isPlayer
        self._turn = turn
    }
    
    var body: some View {
        HStack{
            Spacer()
            ForEach(Array(imageCard.handCards.enumerated()), id: \.offset) {index, card in
                Button(action: { addCurrentCard(index, card: card); self.turn = !turn }, label: {
                    if isPlayer{ ImageCardComponent(url: card.image) }
                    else { Image(uiImage: UIImage(named: "card")!).resizable().frame(maxWidth: 60,maxHeight: 90) }
                }).disabled(!isPlayer)

            }
            Spacer()
            
        }.padding()
    }
    
    private func addCurrentCard(_ index: Int, card: CardModel){
        imageCard.currentCard = card
        imageCard.handCards.remove(at: index)
    }
    
    
}

//struct CardComponent_preview: PreviewProvider {
//    static var previews: some View {
//        CardComponent(imageCard: PlayerModel(), isPlayer: false)
//    }
//}
//
