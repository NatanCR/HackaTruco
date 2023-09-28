//
//  RegrasComponente.swift
//  HackaTruco
//
//  Created by Luana Moraes on 25/09/23.
//

import SwiftUI

struct RegrasComponente: View {
    var titulo: String
    var descricao: String
    
    var body: some View {
        
        VStack {
            DisclosureGroup {
                Text(descricao)
                    .font(.system(size: 18))
                    .foregroundColor(.white)
                    .padding()
                
            } label: {
                Text(titulo).bold()
                    .font(.system(size: 20))
                    .foregroundColor(.white)
                    .padding(.horizontal, 15)
            }
            .foregroundColor(.black)
                .frame(minWidth: 300)
                .padding(5)
                .background {
                    RoundedRectangle(cornerRadius: 15)
//                        .stroke(Color("red"), lineWidth: 2)
                        .foregroundColor(Color ("bgHomeColor"))
                        .frame(minWidth: 350, minHeight: 50)

                }
                .accentColor(.white)
                
        }
    }
}

