//
//  WeatherButton.swift
//  SwiftUI-Weather-Tutorial
//
//  Created by Bergin Jack on 12/11/23.
//

import SwiftUI

struct WeatherButtonFormat: View{
    var buttonTitle: String
    var backgroundColor: Color
    var foregroundColor: Color
    var body: some View{
        Text(buttonTitle)
            .frame(width:300, height:50)
            .background(backgroundColor)
            .foregroundColor(foregroundColor)
            .font(.system(size: 20, weight: .bold, design: .default))
            .cornerRadius(10)
    }
}
