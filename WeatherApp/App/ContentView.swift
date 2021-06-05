//
//  ContentView.swift
//  WeatherApp
//
//  Created by Maiara Martins on 04/06/21.
//

import SwiftUI

struct ContentView: View {
    @State var weatherInfo:WeatherInfo?
    
    var body: some View {
        VStack {
            if weatherInfo == nil {
                ProgressView()
            }else{
                HomeView(weatherInfo: weatherInfo!)
            }
        }//: Scrolling
        .onAppear(){
            WeatherService().getWeatherInfos("London") { infos in
                self.weatherInfo = infos
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
