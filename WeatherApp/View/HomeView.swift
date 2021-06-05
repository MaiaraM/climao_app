//
//  HomeView.swift
//  WeatherApp
//
//  Created by Maiara Martins on 04/06/21.
//

import SwiftUI

struct HomeView: View {
    var weatherInfo:WeatherInfo
    
    var body: some View {
        VStack {
            Text(weatherInfo.location.name)
            Text(weatherInfo.current.condition.text)
            Text(weatherInfo.current.cloud.description)

        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(weatherInfo: weatherMock)
    }
}
