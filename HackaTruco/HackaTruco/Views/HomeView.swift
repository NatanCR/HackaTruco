//  HomeView.swift
//  HackaTruco
//
//  Created by Natan de Camargo Rodrigues on 25/09/23.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var controllerAPI = ApiRequest()
//    @ObservedObject var vm: StatusManager = StatusManager()
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color("bgHomeColor").ignoresSafeArea()
                Image("bgHome")
                    .resizable()
                    .frame(height: 1000)
                VStack{
                    Text("HackaTruco")
                        .foregroundColor(.white)
                        .font(.system(size: 45, weight: .medium, design: .monospaced))
                        .padding()
                    NavigationLink(destination: GameView(controllerAPI: controllerAPI), label: {Image("btnJogar")})
                        .padding()
                    NavigationLink(destination: RegrasView()) {
                        Image("btnRegras")
                    } .padding()
                    NavigationLink(destination: StatusView(), label: {
                        Image("btnEstatisticas")
                    })
                    .padding()
                }
                
            }
            
        }
        
        .onAppear {
            print("ON APPEAR")
            controllerAPI.getNewDeck { deck in
                if !deck.success {
                    print("request not succeded")
                    
                }
            }
        }
        .accentColor(.white)
    }
}
