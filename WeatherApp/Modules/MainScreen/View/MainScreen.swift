//
//  MainScreen.swift
//  WeatherApp
//
//  Created by JETSMobileLabMini9 on 16/05/2024.
//

import SwiftUI

struct MainScreen: View {
    @StateObject var viewModel : MainScreenViewModel
    var body: some View {
        NavigationView{
        ZStack{
            var background = viewModel.isDay ? "Day" : "Night"
            BackgroundImage(background: background)
            VStack{
                Spacer()
                ConditionsView(dayCondition: viewModel.dayConditions, city: viewModel.city, isDay: viewModel.isDay, temp: viewModel.temp)
                Spacer()
                CustomText(text: "3-Day Forecast", isDay: viewModel.isDay)
                    .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 200))
                ForEach(0...2, id: \.self){
                    index in
                    Divider()
                    DayForecastListItem(day: "\(viewModel.getDayName(AtIndex: index))", isDay: viewModel.isDay, forecastDay: viewModel.forecastDays?[index] ?? Forecastday())
                }
                Spacer()
                Grid(alignment: .center){
                    GridRow{
                        GridItem(title: "Visiblity", value: (viewModel.current?.visKm ?? 0.0), unit: "Km/H", isDay: viewModel.isDay)
                        GridItem(title: "Humidity", value: viewModel.current?.humidity ?? 0.0, unit: "%", isDay: viewModel.isDay)
                    }
                    GridRow{
                        GridItem(title: "Feels Like", value: viewModel.current?.feelslikeC ?? 0.0, unit: "°", isDay: viewModel.isDay)
                        GridItem(title: "Pressure", value: viewModel.current?.precipMm ?? 0.0, unit: "", isDay: viewModel.isDay)
                    }
                }
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 25, trailing: 0))
                Spacer()
                }
            .padding(EdgeInsets(top: 28, leading: 0, bottom: 0, trailing: 0))
            }
        .padding(EdgeInsets(top: 32, leading: 0, bottom: 0, trailing: 0))
        }
        .navigationTitle("Forecast")
    }
}


#Preview {
    MainScreen(viewModel: MainScreenViewModel(networkService: NetworkService<ForecastResult>()))
}
