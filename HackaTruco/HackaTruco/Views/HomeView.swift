//  HomeView.swift
//  HackaTruco
//
//  Created by Natan de Camargo Rodrigues on 25/09/23.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var controllerAPI = ApiRequest()
    @ObservedObject var vm: GameStatus = GameStatus()
    
    var body: some View {
        NavigationStack{
            
            GeometryReader{ geo in
                VStack{
                    VStack(spacing: 0){
                        HStack{
                            Text("HACKA")
                                .font(.system(size: 75, weight: .black, design: .rounded))
                                .foregroundColor(.white)
                                .frame(height: geo.size.height * 0.1, alignment: .trailing)
                                .padding(.leading)
                        }
                        .frame(width: geo.size.width, height: geo.size.height * 0.11, alignment: .bottomLeading)
                        
                        HStack{
                            Text("truco")
                                .font(.system(size: 70, weight: .regular, design: .rounded))
                                .foregroundColor(.white)
                                .frame(width: geo.size.width * 0.85, alignment: .topTrailing)
                                .padding(.trailing)
                        }
                        .frame(width: geo.size.width, height: geo.size.height * 0.1)
                        .background(Color("secundaryColor"))
                    }
                    .frame(height: geo.size.height * 0.4, alignment: .bottom)
                    
                    
                    VStack(spacing: 30){
                        NavigationLink(destination: GameView(controllerAPI: controllerAPI)) {
                            Text("Jogar")
                                .textCase(.uppercase)
                                .font(.system(.headline).weight(.bold))
                                .frame(width: geo.size.width * 0.4, height: 50)
                                .background(Color("secundaryColor"))
                                .cornerRadius(10)
                        }
                        
                        NavigationLink(destination: RegrasView()) {
                            Text("Regras")
                                .textCase(.uppercase)
                                .font(.system(.headline).weight(.bold))
                                .frame(width: geo.size.width * 0.4, height: 50)
                                .background(Color("secundaryColor"))
                                .cornerRadius(10)
                        }
                        
                        NavigationLink(destination: EstatisticasView()) {
                            Text("Estatísticas")
                                .textCase(.uppercase)
                                .font(.system(.headline).weight(.bold))
                                .frame(width: geo.size.width * 0.4, height: 50)
                                .background(Color("secundaryColor"))
                                .cornerRadius(10)
                        }
                        
                    }.frame(width: geo.size.width, height: geo.size.height * 0.4, alignment: .bottom)
                    
                }
                .frame(width: geo.size.width, height: geo.size.height, alignment: .center)
                .background(
                    ZStack{
                        Color("bgHomeColor").ignoresSafeArea()
                        Image("bgHome").resizable().aspectRatio(contentMode: .fill)
                    }
                )
                
                
            }
        }
        
        .onAppear {
            print("ON APPEAR")
            controllerAPI.getNewDeck { deck in
                if !deck.success {
                    print("request not succeded")
                    vm.testGameStatus()
                }
            }
        }
        .accentColor(.white)
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
