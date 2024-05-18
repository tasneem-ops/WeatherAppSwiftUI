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
            Image(background)
            
            List(viewModel.hourForecasts){hour in
                HourForecastItem(hour: hour, isDay: viewModel.isDay)
                    .listRowBackground(Color.clear)
            }
            .scrollContentBackground(.hidden)
            .padding(EdgeInsets(top: 64, leading: 8, bottom: 25, trailing: 8))
            
        }
    }
}

#Preview {
    DetailScreen(viewModel: DetailViewModel(isDay: true, hourForecasts: []))
}
