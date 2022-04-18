//
//  ContentView.swift
//  WeatherApp
//
//  Created by KBM-PC on 10.04.2022.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var cityVM = CityViewModel()
    
    var body: some View {
        ZStack(alignment: .bottom){
            VStack(spacing:0){
                MenuHeaderView(citiyVM: cityVM).padding()
            ScrollView(showsIndicators: false){
                CityView(cityVM:cityVM)
            }.padding(.top, 10)
        }.padding(.top, 40)
    }.background(LinearGradient(gradient: Gradient(colors: [.cyan]), startPoint: .topLeading, endPoint: .bottomTrailing))
        .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
