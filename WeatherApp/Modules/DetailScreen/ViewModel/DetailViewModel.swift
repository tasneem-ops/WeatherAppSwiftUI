//
//  DetailViewModel.swift
//  WeatherApp
//
//  Created by Tasnem on 18/05/2024.
//

import Foundation

class DetailViewModel : ObservableObject{
    @Published var isDay : Bool
    @Published var hourForecasts : [Hour]
    
    init(isDay: Bool, hourForecasts: [Hour]) {
        self.isDay = isDay
        self.hourForecasts = hourForecasts
        print(hourForecasts.count)
    }
}
