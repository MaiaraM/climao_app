//
//  IconTextComponent.swift
//  WeatherApp
//
//  Created by Maiara Martins on 05/06/21.
//

import SwiftUI

struct IconTextComponent: View {
    //MARK: - PROPERTIES
    var title: String
    var image: String
    
    //MARK: - BODY
    var body: some View {
        HStack {
            Image(systemName: image)
                .foregroundColor(.white)

            Text(title)
                .foregroundColor(.white)
        }
    }
}


