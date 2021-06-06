//
//  AirQuality.swift
//  weather_app
//
//  Created by Fernando Gabriel Belotto Bosco on 06/06/21.
//

import SwiftUI

struct AirQuality: View {
    
    @State var progressValue: Float = 0.29

    
    @State private var isPresented = false
    
    var body: some View {
        VStack(spacing: 10) {
            HStack {
                Text("Qualidade do ar")
                    .font(.custom("Helvetica Neue Bold", size: 14))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Button(action: {
                    isPresented.toggle()
                    print("teste simples")
                }, label: {
                    Image(systemName: "info.circle")        .foregroundColor(.white)
                        
                })
                .sheet(isPresented: $isPresented, content: {
                    
                    SheetView()
                    
                    

                })
 
            }
            HStack{
                ProgressBar(progress: self.$progressValue)
                    .frame(width: 110.0, height: 110.0)
                HStack {
                    Text("A qualidade do ar está moderada. Considere reduzir a intensidade de suas atividades ao ar livre se tiver problemas relacionados à qualidade do ar")
                        .font(.system(size: 12))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .leading)

                }.frame(minWidth: 0,maxWidth: .infinity, maxHeight: 120)
            }
            Divider().background(Color.white)
            HStack {
                Text("AQI (BR) 43/200")
                    .font(.system(size: 12))
                    .foregroundColor(.white)
                    .frame(alignment: .leading)
                Text("Poluente dominante: PM 2,5")
                    .font(.system(size: 12))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .trailing)

            }
        }.padding(10).background(Color("bg")).cornerRadius(15).padding(10)

    }
}

struct AirQuality_Previews: PreviewProvider {
    static var previews: some View {
        AirQuality()
    }
}


struct FullScreenModalView: View {
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        
        Button("Dismiss Modal") {
            presentationMode.wrappedValue.dismiss()
        }

    }
}

struct SheetView: View {
    var body: some View {
        VStack {
            Text("Texto explicativo sobre qualidade do ar").foregroundColor(.white)
            
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("sheet"))

    }
}

