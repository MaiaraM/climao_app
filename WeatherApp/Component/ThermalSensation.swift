//
//  ThermalSensation.swift
//  weather_app
//
//  Created by Fernando Gabriel Belotto Bosco on 31/05/21.
//

import SwiftUI

struct ThermalSensation: View {
    //MARK: - PROPERTIES
    
    var infos:WeatherInfo
    
    //MARK: - BODY
    var body: some View {
        VStack(spacing: 10) {
            Text("Detalhes")
                .font(.custom("Helvetica Neue Bold", size: 14))
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .leading)
            HStack{
                Image("sun")
                    .resizable()
                    .scaledToFit().frame(width:60, height: 60)
                    .padding(5)
                    .frame(maxWidth: .infinity)
                VStack(spacing: 10) {
                    InfoRow(title: "Sensação Térmica", value: "\(infos.current.feelslikeC)°")
                    InfoRow(title: "Umidade", value: "\(infos.current.humidity)%")
                    InfoRow(title: "Visibilidade", value: "\(infos.current.visKM)km")
                    InfoRow(title: "UV Index", value: "Baixo 0")
                    InfoRowTiny(title: "Ponto de condensação", value: "\(infos.current.gustKph)°")

                }
            }
        }.padding(10).background(Color("bg")).cornerRadius(15).padding(10)

    }
}

struct ThermalSensation_Previews: PreviewProvider {
    static var previews: some View {
        ThermalSensation(infos: weatherMock)
    }
}


struct InfoRowTiny: View {
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

