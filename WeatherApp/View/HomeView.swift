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
        ScrollView(.vertical, showsIndicators: false){
            ZStack(alignment: .top){
                Image("london")
                VStack(alignment: .leading, spacing: 5) {
                    Text(weatherInfo.location.name)
                    Spacer()
                    Text(String(weatherInfo.current.tempC)+"®")
                        .bold()
                        .foregroundColor(.white)
                        .multilineTextAlignment(.trailing)
                        .font(.system(size: 80))
                }
                .padding(.top, 50)
                .padding(.horizontal, 20)
                .frame(
                    minWidth: 0,
                    maxWidth: 400,
                    minHeight: 0,
                    maxHeight: 800,
                    alignment: .topLeading
                )
            }
        }
        .ignoresSafeArea()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(weatherInfo: weatherMock)
    }
}
