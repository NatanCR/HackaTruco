//
//  NetworkView.swift
//  HackaTruco
//
//  Created by Well on 26/09/23.
//

import SwiftUI

struct NetworkView: View {
    var body: some View {
        VStack{
            Image(systemName: "wifi.slash")
            Text("No connection")
        }
    }
}

#Preview {
    NetworkView()
}
