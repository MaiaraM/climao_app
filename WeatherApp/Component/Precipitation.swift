import SwiftUI

struct Precipitation: View {
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            Text("Precipitação")
                .font(.custom("Helvetica Neue Bold", size: 14))
                .foregroundColor(.white)
                .frame(maxWidth: .infinity , alignment: .leading)
            HStack{
                PrecipitationItem(period: "manha", image: "drop_0", value:"0%")
                PrecipitationItem(period: "tarde", image: "drop_1", value: "30%")
                PrecipitationItem(period: "entardecer", image: "drop_2", value: "60%")
                PrecipitationItem(period: "noite", image: "drop_3", value: "100%")
            }
        }.padding(10).background(Color("bg")).cornerRadius(15).padding(8)
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

struct PrecipitationItem: View {
    var period: String
    var image: String
    var value: String
    var body: some View {
        VStack{
            Text(period)
                .font(.custom("Helvetica Neue Bold", size: 12))
                .foregroundColor(.white)
            Image(image).resizable()
                .scaledToFit().frame(width:30, height: 30)
            Text(value)
                .foregroundColor(Color("light_blue"))
        }.padding(8)
        .overlay(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 2).foregroundColor(Color.gray))
    }
}


