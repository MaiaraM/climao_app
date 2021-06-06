//
//  MapCard.swift
//  weather_app
//
//  Created by Fernando Gabriel Belotto Bosco on 06/06/21.
//

import SwiftUI

struct MapCard: View {
    var body: some View {
        VStack(spacing: 10) {
            Text("Mapa")
                .font(.custom("Helvetica Neue Bold", size: 14))
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .leading)
            MapView().frame(height: 160)
        }.padding(10).background(Color("bg")).cornerRadius(15).padding(10)

    }
}

struct MapCard_Previews: PreviewProvider {
    static var previews: some View {
        MapCard()
    }
}
