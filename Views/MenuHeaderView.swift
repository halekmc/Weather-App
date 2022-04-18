//
//  MenuHeaderView.swift
//  WeatherApp
//
//  Created by KBM-PC on 15.04.2022.
//

import SwiftUI

struct MenuHeaderView: View {
    
    @ObservedObject var citiyVM: CityViewModel
    
    @State private var searchTerm = "Antalya"
    
    var body: some View {
        HStack{
            TextField("", text:$searchTerm)
                .padding(.leading, 20)
            
            Button {
                citiyVM.city=searchTerm
            } label: {
                ZStack{
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.blue)
                    
                    Image(systemName: "location.fill")
                }
            }
            .frame(width: 50, height: 50)
        }
        .foregroundColor(.white)
        .padding()
        .background(ZStack(alignment: .leading){
            Image(systemName: "") //ico koycaz
                .foregroundColor(.white)
                .padding(.leading, 10)
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.blue.opacity(0.5))
        })
    }
}

struct MenuHeaderView_Previews: PreviewProvider {
    static var previews: some View {
    ContentView()
        
    }
}
