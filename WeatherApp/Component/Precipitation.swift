//
//  Precipitation.swift
//  weather_app
//
//  Created by Letícia Ferreira Alves on 02/06/21.
//
import SwiftUI

struct Precipitation: View {
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            Text("Precipitação")
                .font(.custom("Helvetica Neue Bold", size: 14))
                .foregroundColor(.white)
                .frame(maxWidth: .infinity , alignment: .leading)
            HStack{
                Image("rect_precipitation").resizable()
                    .scaledToFit().frame(width:121.2, height: 110)
                    .padding(0.0)
                    .offset(x:55, y:0)
                    .frame(maxWidth: .infinity)
                    .overlay(
                        Text("Manhã")
                            .font(.custom("Helvetica Neue Bold", size: 12))
                            .offset(x:55, y:-35)
                            .foregroundColor(.white)
                    )
                    .overlay(
                        Image(precipitationLevelsDefinition(prob : preciptationProbability1)).resizable()
                    .scaledToFit().frame(width:30, height: 30)
                    .padding(0.0)
                    .offset(x:53, y:0)
                    .frame(maxWidth: .infinity))
                    .overlay(
                        Text(String(format: "%.1f%%", preciptationProbability1))
                            .offset(x:55, y:35)
                            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    )
                
                Image("rect_precipitation").resizable()
                    .scaledToFit().frame(width:121.2, height: 110)
                    .padding(0.0)
                    .offset(x:15, y:0)
                    .frame(maxWidth: .infinity)
                    .overlay(
                        Text("Tarde")
                            .font(.custom("Helvetica Neue Bold", size: 12))
                            .offset(x:15, y:-35)
                            .foregroundColor(.white)
                    )
                    .overlay(
                        Image(precipitationLevelsDefinition(prob : preciptationProbability2)).resizable()
                    .scaledToFit().frame(width:30, height: 30)
                    .padding(0.0)
                    //.position(CGPoint(x: 40, y: 400))
                    .offset(x:15, y:0)
                    .frame(maxWidth: .infinity))
                    .overlay(
                        Text(String(format: "%.1f%%", preciptationProbability2))
                            .offset(x:15, y:35)
                            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    )
                
                Image("rect_precipitation").resizable()
                    .scaledToFit().frame(width:121.2, height: 110)
                    .padding(0.0)
                    .offset(x:-25, y:0)
                    .frame(maxWidth: .infinity)
                    .overlay(
                        Text("Entardecer")
                            .font(.custom("Helvetica Neue Bold", size: 12))
                            .offset(x:-25, y:-35)
                            .foregroundColor(.white)
                    )
                    .overlay(
                        Image(precipitationLevelsDefinition(prob : preciptationProbability3)).resizable()
                    .scaledToFit().frame(width:30, height: 30)
                    .padding(0.0)
                    .offset(x:-25, y:0)
                    .frame(maxWidth: .infinity))
                    .overlay(
                        Text(String(format: "%.1f%%", preciptationProbability3))
                            .offset(x:-25, y:35)
                            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    )
                
                
                Image("rect_precipitation").resizable()
                    .scaledToFit().frame(width:121.2, height: 110)
                    .padding(0.0)
                    .offset(x:-65, y:0)
                    .frame(maxWidth: .infinity)
                    .overlay(
                        Text("Noite")
                            .font(.custom("Helvetica Neue Bold", size: 12))
                            .offset(x:-65, y:-35)
                            .foregroundColor(.white)
                    )
                    .overlay(
                        Image(precipitationLevelsDefinition(prob : preciptationProbability4)).resizable()
                    .scaledToFit().frame(width:30, height: 30)
                    .padding(0.0)
                    .offset(x:-65, y:0)
                    .frame(maxWidth: .infinity))
                    .overlay(
                        Text(String(format: "%.1f%%", preciptationProbability4))
                            .offset(x:-65, y:35)
                            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    )
            }
        }.padding(10).background(Color("bg")).cornerRadius(15).padding(.all, 10).aspectRatio(contentMode: .fit)
    }
}


struct Precipitation_Previews: PreviewProvider {
    static var previews: some View {
        Precipitation()
    }
}






public var preciptationProbability1: Float = 0
public var preciptationProbability2: Float = 30
public var preciptationProbability3: Float = 60
public var preciptationProbability4: Float = 90



public func precipitationLevelsDefinition(prob:Float) -> String {
    if prob == 0 {
        return Drops.nivel_1.finalPrecipitationLevelImage
    }
    else if (0 < prob) && (prob <= 50) {
        return Drops.nivel_2.finalPrecipitationLevelImage
        }
    else if (50 < prob) && (prob <= 75) {
        return Drops.nivel_3.finalPrecipitationLevelImage
        }
    else{
        return Drops.nivel_4.finalPrecipitationLevelImage
    }
}


public enum Drops {
    case nivel_1;
    case nivel_2;
    case nivel_3;
    case nivel_4;
 

public var finalPrecipitationLevelImage: String {
    switch self {
        case .nivel_1: return "drop_0"
        case .nivel_2: return "drop_1"
        case .nivel_3: return "drop_2"
        case .nivel_4: return "drop_3"

        }
        
    }
 
}
