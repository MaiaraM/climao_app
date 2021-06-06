//
//  InfoRow.swift
//  WeatherApp
//
//  Created by Maiara Martins on 05/06/21.
//

import SwiftUI

struct InfoRow: View {
    //MARK: - PROPERTIES
    var title: String
    var value: String
    
    //MARK: - BODY
    var body: some View {
        HStack {
            Text(title)
                .font(.system(size: 14))
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .leading)
            Text(value)
                .font(.system(size: 14))
                .foregroundColor(.white)
                .frame(alignment: .trailing)

        }.frame(minWidth: 0,maxWidth: .infinity)
    }
    
}
