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
                Text("\(forecastDay.date ?? "")")
                    .foregroundStyle(isDay ? Color.black : Color.white)
                Spacer()
                KFImage(URL(string: "https:\(forecastDay.day?.condition?.icon ?? "")"))
                    .resizable()
                    .frame(width: 50, height: 50)
                Spacer()
                Text(String(format: "%.1f", (forecastDay.day?.mintempC ?? 0.0)))
                    .foregroundStyle(isDay ? Color.black : Color.white)
                Text(" - ")
                    .foregroundStyle(isDay ? Color.black : Color.white)
                Text(String(format: "%.1f", (forecastDay.day?.maxtempC ?? 0.0)))
                    .foregroundStyle(isDay ? Color.black : Color.white)
                Spacer()
            }
        }
    }
}

#Preview {
    DayForecastListItem(day: "", isDay: true, forecastDay: Forecastday())
}
