//
//  WeatherScroll.swift
//  weather_app
//
//  Created by Fernando Gabriel Belotto Bosco on 06/06/21.
//

import SwiftUI

struct WeatherScroll: View {
    
    var body: some View {
        VStack(spacing: 5){
            ScrollView(.horizontal) {
                HStack(alignment: .bottom) {
                    ForEach(0 ..< 100) {_ in
                        WeatherScrollBar(icon: "sun", temp: "25", time: "9:00")
                    }
                }
            }
            
 
            ScrollView(.horizontal) {
                HStack(alignment: .bottom) {
                    ForEach(0 ..< 100) {_ in
                        Text("Quinta 8/7")
                            .padding(5)
                            .font(.system(size: 12))
                            .foregroundColor(.white)
                            .frame(width: UIScreen.main.bounds.size.width, height: 20)
                            .background(Color("bg"))
                            .cornerRadius(8)
                    }
                }
            }.cornerRadius(8).padding(8)
                
                
        }

        
    }
}

struct WeatherScroll_Previews: PreviewProvider {
    static var previews: some View {
        WeatherScroll()
    }
}

struct WeatherScrollBar: View {
    var randomTemp: Int = Int.random(in: 17...30)
    var icon: String
    var temp: String
    var time: String
    
    var barSize: CGFloat {
        let value = Int(randomTemp)
        let real = value + 100
        return CGFloat(real)
    }
    
    var body: some View {
        VStack{
            Spacer()
            Image(icon).resizable()
                .scaledToFit().frame(width:25, height: 25)
            
            Text(String(randomTemp))
                .font(.system(size: 13))
                .foregroundColor(.white)
            
            Text(time)
                .font(.system(size: 10))
                .foregroundColor(.white)
            
        }.padding(8.0).frame(width: 40, height: barSize).background(Color("bg")).cornerRadius(8)
    }
}

