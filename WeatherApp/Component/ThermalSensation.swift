//
//  ThermalSensation.swift
//  weather_app
//
//  Created by Fernando Gabriel Belotto Bosco on 31/05/21.
//

import SwiftUI

struct ThermalSensation: View {
    var body: some View {
        VStack(spacing: 10) {
            Text("Detalhes")
                .font(.custom("Helvetica Neue Bold", size: 14))
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .leading)
            HStack{
                Image("sun").resizable()
                    .scaledToFit().frame(width:60, height: 60)                    .padding(5)
                    .frame(maxWidth: .infinity)
                VStack(spacing: 10) {
                    InfoRow(title: "Sensação Térmica", value: "18C")
                    InfoRow(title: "Umidade", value: "85%")
                    InfoRow(title: "Visibilidade", value: "16km")
                    InfoRow(title: "UV Index", value: "Baixo 0")
                    InfoRowTiny(title: "ponto de condensação", value: "15C")

                }
            }
        }.padding(10).background(Color("bg")).cornerRadius(15).padding(10)

    }
}

struct ThermalSensation_Previews: PreviewProvider {
    static var previews: some View {
        ThermalSensation()
    }
}

struct InfoRow: View {
    var title: String
    var value: String
    var body: some View {
        HStack {
            Text(title)
                .font(.system(size: 12))
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .leading)
            Text(value)
                .font(.system(size: 12))
                .foregroundColor(.white)
                .frame(alignment: .trailing)

        }.frame(minWidth: 0,maxWidth: .infinity)
    }
    
}

struct InfoRowTiny: View {
    var title: String
    var value: String
    var body: some View {
        HStack {
            Text(title)
                .font(.system(size: 9))
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .leading)
            Text(value)
                .font(.system(size: 10))
                .foregroundColor(.white)
                .frame(alignment: .trailing)

        }.frame(minWidth: 0,maxWidth: .infinity)
    }
    
}

