//
//  TemperatureRow.swift
//  WeatherApp
//
//  Created by Maiara Martins on 05/06/21.
//

import SwiftUI

struct TemperatureRow: View {
    //MARK: - PROPERTIES
    var infos:WeatherInfo
    var sunset:String
    var sunrise:String

    
    init(infos:WeatherInfo) {
        self.infos = infos
        self.sunrise = String(infos.forecast.forecastday[0].astro.sunrise.split(separator: " ")[0])
        self.sunset = String(infos.forecast.forecastday[0].astro.sunset.split(separator: " ")[0])

    }
    
    //MARK: - BODY
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                ImageView(withURL: infos.current.condition.icon)
                    .foregroundColor(.white)

                Text(infos.current.condition.text)
                    .foregroundColor(.white)
            }
            HStack {
                IconTextComponent(title: "\(infos.forecast.forecastday[0].day.maxtempC)°", image: "arrow.up")
                IconTextComponent(title: "\(infos.forecast.forecastday[0].day.mintempC)°", image: "arrow.down")

            }
            
            HStack(alignment: .bottom){
                Text("\(infos.current.tempC)°")
                    .bold()
                    .foregroundColor(.white)
                    .font(.system(size: 85))
                Spacer()
                IconTextComponent(title: self.sunrise, image: "sunrise")
                IconTextComponent(title: self.sunset, image: "sunset")
            }
        }//: VStack
        .padding(.horizontal,15)
        .padding(.vertical,10)

    }
}

//MARK: - PREVIEW
struct TemperatureRow_Previews: PreviewProvider {
    static var previews: some View {
        TemperatureRow(infos: weatherMock).preferredColorScheme(.dark).previewLayout(.sizeThatFits)
    }
}
