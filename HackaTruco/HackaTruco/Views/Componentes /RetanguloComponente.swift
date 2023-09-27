//
//  RetanguloComponente.swift
//  HackaTruco
//
//  Created by Luana Moraes on 25/09/23.
//

import SwiftUI

struct RetanguloComponente: View {
    
    var imgName: String
    var description: String
    var num: Int
 
    var body: some View {
        
            RoundedRectangle(cornerRadius: 15)
                .foregroundColor(Color("bgHomeColor"))
//                .stroke(Color("red"), lineWidth: 2)
                .frame(maxWidth: 350, maxHeight: 200)
                .overlay {
                    
                    HStack(alignment: .center, spacing: 15) {

                            VStack {
                                Image(systemName: imgName)
                                    .resizable()
                                    .scaledToFill()
                                    .foregroundColor(.white)
                                    .frame(width: 30, height: 30)
                                    .padding()
                                
                                Text(description)
                                    .font(.system(size: 20))
                                    .foregroundColor(.white)
                               
                            }
                            Text("\(num)")
                                .font(.system(size: 40))
                                .foregroundColor(.white).bold()
                                .padding(.leading)
 
                        }

                    
                }.padding()
    }
}

struct RetanguloComponente_Previews: PreviewProvider {
    static var previews: some View {
        RetanguloComponente(imgName: "pencil", description: "Partidas vencidas", num: 3)
    }
}
