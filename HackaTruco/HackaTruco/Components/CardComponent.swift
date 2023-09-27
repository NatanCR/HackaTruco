//
//  cardComponent.swift
//  HackaTruco
//
//  Created by Bruno Lafayette on 27/09/23.
//

import SwiftUI

struct CardComponent: View{
    
    var imageCard: [Image]
    var isPlayer: Bool
    init(imageCard: [Image], isPlayer: Bool) {
        self.imageCard = imageCard
        self.isPlayer = isPlayer
    }
    
    var body: some View {
         
        HStack{
            
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                imageCard[0]
            })
            
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                imageCard[0]
            })
            
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                imageCard[0]
            })
            
        }.padding()
        
    }
    
    
}

struct CardComponent_preview: PreviewProvider {
    static var previews: some View {
        CardComponent(imageCard: [Image(uiImage: UIImage(named: "card")!)], isPlayer: false)
    }
}

