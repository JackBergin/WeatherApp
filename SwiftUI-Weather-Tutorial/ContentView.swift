//
//  ContentView.swift
//  SwiftUI-Weather-Tutorial
//
//  Created by Bergin Jack on 12/11/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack{
            BackgroundView(isNight: $isNight)
            
            VStack{
                // Gives us the label of the city name
                CityLabelView(cityName: "Cupertino, CA")
                
                // Gives us the main view point of the enlarged icon and temperature
                MainWeatherView(weatherStatus: isNight ? "moon.stars.fill" : "cloud.sun.fill", temperature: 76)
                
                .padding(.bottom, 60)
                HStack(spacing:25){
                    WeatherDayView(dayOfWeek: "TUE", imageName: "cloud.sun.fill", temperature: 79)
                    WeatherDayView(dayOfWeek: "WED", imageName: "sun.max.fill", temperature: 85)
                    WeatherDayView(dayOfWeek: "THUR", imageName: "cloud.sun.rain.fill", temperature: 83)
                    WeatherDayView(dayOfWeek: "FRI", imageName: "sunset.fill", temperature: 73)
                    WeatherDayView(dayOfWeek: "SAT", imageName: "cloud.sun.bolt.fill", temperature: 72)
                }
                Spacer()
                Button(action: {
                    isNight.toggle()
                }, label: {
                    WeatherButtonFormat(buttonTitle: "Change Day Time",
                                        backgroundColor: .white,
                                        foregroundColor: isNight ? .gray : .blue)
    
                })
                Spacer()
            }
            
        }
    }
}

/* Main Caller*/
#Preview {
    ContentView()
}

struct BackgroundView: View {
    @Binding var isNight: Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .gray : Color("lightBlue")]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}

struct CityLabelView: View{
    var cityName: String
    var body: some View{
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainWeatherView: View{
    var weatherStatus: String
    var temperature: Int
    
    var body: some View{
        VStack (spacing: 10) {
            Image(systemName: weatherStatus)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                .frame(width: 180, height: 180)
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct WeatherDayView: View {
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    var body: some View {
        VStack{
            Text(dayOfWeek)
                .font(.system(size:16, weight: .medium))
                .foregroundColor(.white)
            Image(systemName:imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temperature)°")
                .font(.system(size: 24, weight: .medium))
                .foregroundColor(.white)
        }
    }
}
