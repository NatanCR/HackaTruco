//
//  RetanguloComponente.swift
//  HackaTruco
//
//  Created by Luana Moraes on 25/09/23.
//

import SwiftUI

struct RetanguloComponente: View {
    
    var body: some View {
        
//        GeometryReader { geo in
            RoundedRectangle(cornerRadius: 15)
                .foregroundColor(Color("bgHomeColor"))
                .frame(maxWidth: 350, maxHeight: 120)
                .overlay {
                    
                    HStack(alignment: .center, spacing: 15) {

                            VStack {
                                Image(systemName: "sos.circle.fill")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 30, height: 30)
                                    .padding()
                                
                                Text("Partidas iniciadas")
                                    .font(.system(size: 25))
                               
                            }
                            Text("3")
                                .font(.system(size: 40))
                                .padding(.leading)
 
                        }

                    
                }
//        }
 
        
    }
}

struct RetanguloComponente_Previews: PreviewProvider {
    static var previews: some View {
        RetanguloComponente()
    }
}
