//
//  RegrasView.swift
//  HackaTruco
//
//  Created by Luana Moraes on 25/09/23.
//

import SwiftUI

struct RegrasView: View {
    
    let navTitle = "Regras do truco"
    
    var body: some View {
        
//        NavigationView {
            ScrollView {
                
                VStack {
                    ForEach(Regras.shared.lista, id: \.self) { regra in
                        RegrasComponente(titulo: regra.titulo, descricao: regra.descricao)
                            .padding(7)
                    }
                    
                }
            }
            .navigationBarTitle(navTitle, displayMode: .inline)
            
            .ignoresSafeArea()
            .padding()


    }
}


struct RegrasView_Previews: PreviewProvider {
    static var previews: some View {
        RegrasView()
    }
}
