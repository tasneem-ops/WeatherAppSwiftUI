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
                Image(background)
            VStack{
                Spacer()
                Text("\(viewModel.city ?? "Unknown")")
                        .font(.largeTitle)
                        .bold()
                        .foregroundStyle(viewModel.isDay ? Color.black : Color.white)
                Text("\(viewModel.temp ?? "")°")
                        .font(.largeTitle)
                        .bold()
                        .foregroundStyle(viewModel.isDay ? Color.black : Color.white)
                Text("\(viewModel.current?.condition?.text ?? "")")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .foregroundStyle(viewModel.isDay ? Color.black : Color.white)
                Spacer()
                Text("3-Day Forecast")
                    .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 200))
                    .foregroundStyle(viewModel.isDay ? Color.black : Color.white)
                Divider()
                DayForecastListItem(day: "Today", isDay: viewModel.isDay, forecastDay: viewModel.forecastDays?.first ?? Forecastday())
                Divider()
                DayForecastListItem(day: "Sun", isDay: viewModel.isDay, forecastDay: viewModel.forecastDays?[1] ?? Forecastday())
                Divider()
                    .bold()
                DayForecastListItem(day: "Mon", isDay: viewModel.isDay, forecastDay: viewModel.forecastDays?[2] ?? Forecastday())
                Spacer()
                Grid(alignment: .center){
                    GridRow{
                        GridItem(title: "Visiblity", value: (viewModel.current?.visKm ?? 0.0), unit: "Km/H", isDay: viewModel.isDay)
                        GridItem(title: "Humidity", value: viewModel.current?.humidity ?? 0.0, unit: "%", isDay: viewModel.isDay)
                    }
                    GridRow{
                        GridItem(title: "Feels Like", value: viewModel.current?.feelslikeC ?? 0.0, unit: "°", isDay: viewModel.isDay)
                        GridItem(title: "Pressure", value: viewModel.current?.precipMm ?? 0.0, unit: "hPa", isDay: viewModel.isDay)
                    }
                }
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 25, trailing: 0))
                Spacer()
                }
            .padding(EdgeInsets(top: 28, leading: 0, bottom: 0, trailing: 0))
            }
        }
        .navigationTitle("Forecast")
    }
}


#Preview {
    MainScreen(viewModel: MainScreenViewModel(networkService: NetworkService<ForecastResult>()))
}