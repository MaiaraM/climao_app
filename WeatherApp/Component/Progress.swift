//
//  Progress.swift
//  weather_app
//
//  Created by Fernando Gabriel Belotto Bosco on 06/06/21.
//

import SwiftUI

struct CircularProgress: View {
    @State var progressValue: Float = 1.0
    
    var body: some View {
        ZStack {
            Color.black
            
            
            VStack {
                ProgressBar(progress: self.$progressValue)
                    .frame(width: 110.0, height: 150.0)
                    .padding(40.0)

            }
        }
    }
    
    func incrementProgress() {
        let randomValue = Float([0.012, 0.022, 0.034, 0.016, 0.11].randomElement()!)
        self.progressValue += randomValue
    }
}
struct ProgressBar: View {
    @Binding var progress: Float
    
    var body: some View {
        ZStack {
            Circle()
                .trim(from:0.3, to: 1)
                
                .stroke(style: StrokeStyle(lineWidth: 5.0, lineCap: .round, lineJoin: .round))
                .opacity(0.3)
                .rotationEffect(Angle(degrees: 35.0))    .foregroundColor(Color.green)

                        Circle()
                            .trim(from:0.3, to: 1)
                .trim(from: 0.0, to: CGFloat(min(self.progress, 1.0)))
                .stroke(style: StrokeStyle(lineWidth: 5.0, lineCap: .round, lineJoin: .round))
                .foregroundColor(Color.green)
                .rotationEffect(Angle(degrees: 35.0))
                .animation(.linear)
            VStack{
                Text(String(format: "%.0f %", min(self.progress, 1.0)*100.0))
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.white)
                Text("/100")
                    .font(.body)
                    .bold()
                    .foregroundColor(.white)
            }

        }
    }
}

struct Progress_Previews: PreviewProvider {
    static var previews: some View {
        CircularProgress()
    }
}
