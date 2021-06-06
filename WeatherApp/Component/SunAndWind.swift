//
//  SunAndWind.swift
//  WeatherApp
//
//  Created by Maiara Martins on 06/06/21.
//

import SwiftUI

struct SunAndWind: View {
    //MARK: - PROPERTIES
    @State private var isRotated = false

    var infos:WeatherInfo
    var sunset:String
    var sunrise:String
    var animation: Animation {
        Animation.easeOut(duration: 8)
            .repeatForever(autoreverses: false)
    }
    
    
    init(infos:WeatherInfo) {
        self.infos = infos
        self.sunrise = String(infos.forecast.forecastday[0].astro.sunrise)
        self.sunset = String(infos.forecast.forecastday[0].astro.sunset)
    }
    
    //MARK: - BODY
    var body: some View {
        VStack(spacing: 10) {
            Text("Sol e Vento")
                .font(.custom("Helvetica Neue Bold", size: 14))
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .leading)
            ZStack{
                Ellipse()
                    .trim(from: 0.0, to: 0.5)
                    .stroke(Color.white, style: StrokeStyle(lineWidth: 2.0, dash: [5]))
                    .frame(width: .infinity, height: 300)
                    .padding(.horizontal, 10)
                    .rotationEffect(Angle(degrees: 180))
                HStack{
                    Text(sunrise)
                        .font(.footnote)
                        .foregroundColor(.white)
                    Spacer()
                    Text(sunset)
                        .foregroundColor(.white)

                        .font(.footnote)

                }
                .padding(.top, 20)
                HStack{
                    ZStack(alignment: .top){
                        Image("windMill")
                            .resizable()
                            .frame(width: 50, height:50, alignment: .center)

                            .rotationEffect(Angle.degrees(isRotated ? 360 : 0))
                            //.padding(.bottom,10)
                            .animation(animation)

                        Image("baseWindMill")
                            .resizable()
                            .padding(.top,15)
                            .padding(.trailing,10)
                            .frame(width: 25, height:
                                    80, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    }
                    VStack(alignment: .leading, spacing: 10){
                        VStack(alignment:.leading) {
                            Text("Vento")
                                .font(.footnote)
                                .foregroundColor(.white)
                            Text("\(String(infos.current.windMph)) mph OSO")
                                .font(.footnote)
                                .foregroundColor(.white)
                        }
                        VStack(alignment:.leading){
                            Text("Barometro")
                                .font(.footnote)
                                .foregroundColor(.white)
                            Text("27.4 pol")
                                .font(.footnote)
                                .foregroundColor(.white)
                        }
                    }
                }
                
            }
            .frame(height: 200, alignment: .top)
        }.padding(10).background(Color("bg")).cornerRadius(15).padding(10)
        .onAppear(){
            self.isRotated = true
        }
    }
}


//MARK: - PREVIEW
struct SunAndWind_Previews: PreviewProvider {
    static var previews: some View {
        SunAndWind(infos: weatherMock).previewLayout(.sizeThatFits)
    }
}
