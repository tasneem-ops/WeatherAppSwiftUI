//
//  DayForecastListItem.swift
//  WeatherApp
//
//  Created by Tasnem on 18/05/2024.
//

import SwiftUI
import Kingfisher

struct DayForecastListItem : View{
    var day : String
    var isDay : Bool
    var forecastDay : Forecastday
    var body: some View{
        NavigationLink(destination: DetailScreen(viewModel: DetailViewModel(isDay: isDay, hourForecasts: forecastDay.hour ?? []))){
            HStack{
                Spacer()
                CustomText(text: day, isDay: isDay)
                    .frame(width: 90)
                Spacer()
                KFImage(URL(string: "https:\(forecastDay.day?.condition?.icon ?? "")"))
                    .resizable()
                    .frame(width: 50, height: 50)
                Spacer()
                CustomText(text: String(format: "%.1f", (forecastDay.day?.mintempC ?? 0.0)) + "°",
                           isDay: isDay)
                CustomText(text: " - ", isDay: isDay)
                CustomText(text: String(format: "%.1f", (forecastDay.day?.maxtempC ?? 0.0)) + "°",
                           isDay: isDay)
                Spacer()
            }
        }
    }
}

#Preview {
    DayForecastListItem(day: "", isDay: true, forecastDay: Forecastday())
}
