//
//  HomeView.swift
//  HackaTruco
//
//  Created by Natan de Camargo Rodrigues on 25/09/23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
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
                Button {
                    //func
                } label: {
                    Image("btnJogar")
                }
                .padding()
                Button {
                    //func
                } label: {
                    Image("btnRegras")
                }
                .padding()
                Button {
                    //func
                } label: {
                    Image("btnEstatisticas")
                }
                .padding()
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
