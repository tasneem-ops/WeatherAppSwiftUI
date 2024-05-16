//
//  MainScreen.swift
//  WeatherApp
//
//  Created by JETSMobileLabMini9 on 16/05/2024.
//

import SwiftUI

struct MainScreen: View {
    var body: some View {
        NavigationView{
        ZStack{
                Image(.day)
            VStack{
                    Text("Cairo")
                        .font(.largeTitle)
                        .bold()
                    Text("21°")
                        .font(.largeTitle)
                        .bold()
                    Text("Partly Cloudy")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                Grid(alignment: .center){
                    Text("Helooo")
                    Text("Helooo")
                    Text("Helooo")
                    Text("Helooo")
                }
                }
            }
        }
        .navigationTitle("Forecast")
    }
}

#Preview {
    MainScreen()
}
