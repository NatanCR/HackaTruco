//
//  RegrasView.swift
//  HackaTruco
//
//  Created by Luana Moraes on 25/09/23.
//

import SwiftUI

struct RegrasView: View {
    
    let navTitle = "Regras"
    
    var body: some View {
        
        ScrollView {
            
            VStack {
                ForEach(Regras.shared.lista, id: \.self) { regra in
                    RegrasComponente(titulo: regra.titulo, descricao: regra.descricao)
                        .padding(7)
                }
                
            }
            .navigationBarTitle("", displayMode: .inline)
            .toolbarBackground(Color("bgHomeColor"), for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text(navTitle)
                        .foregroundColor(.white)
                }
            }
            .ignoresSafeArea()
            .padding()
        }
    }
}


struct RegrasView_Previews: PreviewProvider {
    static var previews: some View {
        RegrasView()
    }
}
