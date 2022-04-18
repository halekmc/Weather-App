//
//  CityNameViews.swift
//  WeatherApp
//
//  Created by KBM-PC on 15.04.2022.
//

import SwiftUI

struct CityNameViews: View {
    
    var city:String
    var date:String
    
    var body: some View {
        HStack{
            VStack(alignment: .center, spacing: 10){
                Text(city)
                    .font(.title)
                    .bold()
                Text(date)
            }.foregroundColor(.white)
        }
    }
}

struct CityNameViews_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
