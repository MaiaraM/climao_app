//
//  HomeView.swift
//  WeatherApp
//
//  Created by Maiara Martins on 04/06/21.
//

import SwiftUI


struct HomeView: View {
    //MARK: - PROPERTIES

    var weatherInfo:WeatherInfo
    
    @State var animationScroll:Bool = false
    @State var scrollOffset: CGFloat = .zero
    
    //MARK: - BODY
    init(weatherInfo:WeatherInfo) {
        self.weatherInfo = weatherInfo
        
        let coloredNavAppearance = UINavigationBarAppearance()
        
        coloredNavAppearance.configureWithTransparentBackground()
        coloredNavAppearance.backgroundColor = .init(white:0, alpha: 0.0)
        coloredNavAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        coloredNavAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        UINavigationBar.appearance().standardAppearance = coloredNavAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = coloredNavAppearance
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Image("london2")
                    .resizable()
                    .blur(radius: blur)
                    .brightness(opacity)
                    .ignoresSafeArea()
                
                ScrollViewOffset{
                    scrollOffset = $0
                } content: {
                    LazyVStack {
                        Spacer(minLength: 500)
                        TemperatureRow(infos: self.weatherInfo)
                        ThermalSensation(infos: self.weatherInfo)
                        Precipitation()
                    }
                }                
                .shadow(radius: 10)
                .navigationBarTitle(weatherInfo.location.name, displayMode: .inline)
                .navigationBarItems(leading: Image(systemName:"line.horizontal.3")
                                        .resizable()
                                        .foregroundColor(.white)
                                        .frame(width:25, height:20),
                                    trailing: Image(systemName: "plus")
                                        .resizable()
                                        .foregroundColor(.white)
                                        .frame(width:25, height:25))
            }//: ZStack
        }//: Navigation
        .ignoresSafeArea()
    }
    
    var opacity: Double {
        switch scrollOffset {
        case -200...0:
            return Double(-scrollOffset) / 1000
        case ...(-200):
            return 0.2
        default:
            return 0
        }
    }
    
    var blur: CGFloat {
        switch scrollOffset {
        case -400...0:
            return CGFloat(Double(-scrollOffset) / 100)
        case ...(-400):
            return 4
        default:
            return 0
        }
    }
    
}


//MARK: - PREVIEW
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(weatherInfo: weatherMock)
    }
}
