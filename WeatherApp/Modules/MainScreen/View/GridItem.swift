//
//  GridItem.swift
//  WeatherApp
//
//  Created by Tasnem on 18/05/2024.
//

import SwiftUI

struct GridItem: View {
    var title : String
    var value : Double
    var unit : String
    var isDay : Bool
    var body: some View {
        VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, content: {
            Text(title)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .foregroundStyle(isDay ? Color.black : Color.white)
            Text("\(String(format: "%.1f", value)) \(unit)")
                .foregroundStyle(isDay ? Color.black : Color.white)
        })
        .padding(EdgeInsets(top: 25, leading: 25, bottom: 25, trailing: 25))
    }
}
