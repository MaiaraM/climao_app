//
//  ThermalSensation.swift
//  weather_app
//
//  Created by Fernando Gabriel Belotto Bosco on 31/05/21.
//

import SwiftUI

struct WeatherList: View {
    
    @State var expanded: Bool = false
    var body: some View {
        
        CardView().onTapGesture {
            self.expanded.toggle()
            print("teste")
        }
    }
}

struct WeatherList_Previews: PreviewProvider {
    static var previews: some View {
        WeatherList()
    }
}

struct CardView: View {
    var body: some View {
        VStack{
            HStack() {
                Text("Alto")
                    .font(.custom("Helvetica Neue Bold", size: 14))
                    .foregroundColor(.white)
                Text("Baixo")
                    .font(.custom("Helvetica Neue Bold", size: 14))
                    .foregroundColor(.white)
            }.frame(maxWidth: .infinity, alignment: .trailing)
            WeatherDayRow(weekday: "Hoje", icon: "sun", high: "73", low: "48")
            WeatherDayRow(weekday: "Hoje", icon: "sun", high: "73", low: "48")
            WeatherDayRow(weekday: "Hoje", icon: "sun", high: "73", low: "48")
            WeatherDayRow(weekday: "Hoje", icon: "sun", high: "73", low: "48")
            WeatherDayRow(weekday: "Hoje", icon: "sun", high: "73", low: "48")
        }.padding(10).background(Color("bg")).cornerRadius(15).padding(10)
    }
}

struct WeatherDayRow: View {
    var weekday: String
    var icon: String
    var high: String
    var low: String
    
    var body: some View {
        HStack {
            Text(weekday)
                .font(.system(size: 12))
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .leading)
            Image("sun").resizable()
                .scaledToFit().frame(width:30, height: 30)
                .frame(maxWidth: .infinity)
            Text(high)
                .font(.system(size: 16))
                .foregroundColor(.white)
                .frame(alignment: .trailing)
            Text(low)
                .font(.system(size: 16))
                .foregroundColor(.white)
                .frame(alignment: .trailing)
            
        }.frame(minWidth: 0,maxWidth: .infinity)
    }
    
}
