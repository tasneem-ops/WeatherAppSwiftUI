//
//  HourForecastItem.swift
//  WeatherApp
//
//  Created by Tasnem on 18/05/2024.
//

import SwiftUI
import Kingfisher

struct HourForecastItem: View {
    var timeString : String
    var hour : Hour
    var isDay : Bool
    var body: some View {
        HStack{
            Spacer()
            Text(timeString)
                .foregroundStyle(isDay ? Color.black : Color.white)
            Spacer()
            KFImage(URL(string: "https:\(hour.condition?.icon ?? "")"))
                .resizable()
                .frame(width: 50, height: 50)
            Spacer()
            Text(String(format: "%.1f", (hour.tempC ?? 0.0)) + "°")
                .foregroundStyle(isDay ? Color.black : Color.white)
            Spacer()
        }
    }
}

#Preview {
    HourForecastItem(timeString: "Now", hour: Hour(), isDay: true)
}
