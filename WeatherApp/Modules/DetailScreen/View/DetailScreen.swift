//
//  DetailScreen.swift
//  WeatherApp
//
//  Created by Tasnem on 18/05/2024.
//

import SwiftUI

struct DetailScreen: View {
    var viewModel : DetailViewModel
    var body: some View {
        ZStack{
            let background = viewModel.isDay ? "Day" : "Night"
            BackgroundImage(background: background)
            
            List{
                ForEach(viewModel.hourForecasts, id: \.timeEpoch){ hour in
                    HourForecastItem(timeString: viewModel.getHourString(for: hour),hour: hour, isDay: viewModel.isDay)
                        .listRowBackground(Color.clear)
                }
            }
            .scrollContentBackground(.hidden)
            .padding(EdgeInsets(top: 64, leading: 8, bottom: 64, trailing: 8))
            
        }
    }
}

#Preview {
    DetailScreen(viewModel: DetailViewModel(isDay: true, hourForecasts: []))
}
