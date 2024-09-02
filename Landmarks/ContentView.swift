//
//  ContentView.swift
//  Landmarks
//
//  Created by ablashika on 02/09/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var isNight = false
    
    var body: some View {
        ZStack{
            BackgroundView(topColor: isNight ? Color.blue : Color.black,
                                      bottomColor: isNight ? Color.green : Color.gray)
            VStack{
                
                CityTextView(cityName: "Accra Ghana")
                WeatherView(imageName: isNight ? "cloud.sun.fill" : "moon.stars.fill", temperature: 76)
                
                Spacer()
                
                HStack(spacing:20){
                    DayView(day: "Tue", imageName:"cloud.sun.fill", temperature: 21)
                    DayView(day: "Wed", imageName:"cloud.sun.bolt.fill", temperature: 14)
                    DayView(day: "Wed", imageName:"cloud.moon.rain.fill", temperature: 14)
                    DayView(day: "Thurs", imageName:"wind", temperature: 21)
                    DayView(day: "Fri", imageName:"cloud.sun.fill", temperature: 14)
                }
                
                Spacer()
                
                HStack{
                    
                    Button{
                        print("tapped")
                        isNight.toggle()
                    } label: {
                       Text("Change Day Time")
                            .frame( width:280, height: 50 )
                            .background(Color.white)
                            . font(.system(size: 20, weight: .bold, design: .default))
                            .cornerRadius(10)
                    }
                    
                }
                Spacer()
            }
            
        }
    }
}

#Preview {
    ContentView()
}

struct DayView: View {
    var day : String
    var imageName : String
    var temperature : Int
    var body: some View {
        VStack{
            Text(day)
                .font(.system(size: 24, weight: .medium, design: .default))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50)
                
            Text("\(temperature)°")
                .font(.system(size: 24, weight: .medium, design: .default))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    
    var topColor: Color
       var bottomColor: Color
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [topColor, bottomColor]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all )
    }
}

struct CityTextView : View {
    var cityName : String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
    }
}


struct WeatherView : View {
    var imageName : String
    var temperature : Int
    var body: some View {
        VStack{
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            
            
            Text("\(temperature)°")
                .font(.system(size: 76, weight: .medium, design: .default))
                .foregroundColor(.white)
        }
    }
}
