//
//  ImageCardComponent.swift
//  HackaTruco
//
//  Created by Bruno Lafayette on 27/09/23.
//

import SwiftUI

struct ImageCardComponent: View{
    
    private let url: String
    
    init(url: String) {
        self.url = url
    }
    var body: some View {
        VStack{
            AsyncImage(
                url: URL(string: url),
                content: { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxHeight: 100)
                },
                placeholder: {
                    ProgressView()
                })
        }
    }
    
}
