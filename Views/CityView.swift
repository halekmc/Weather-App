//
//  CityView.swift
//  WeatherApp
//
//  Created by KBM-PC on 16.04.2022.
//

import SwiftUI

struct CityView: View {
    
    @ObservedObject var cityVM: CityViewModel
    var body: some View {
        VStack{
            CityNameViews(city:cityVM.city, date:cityVM.date)
                .shadow(radius: 0)
            TodayWeatherView(cityVM: cityVM)
                .padding()
            HourlyWeatherView(cityVM: cityVM)
            DailyWeatherView(cityVM: cityVM)
            
        }.padding(.bottom, 30)
    }
}

struct CityView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
