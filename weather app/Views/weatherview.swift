//
//  weatherview.swift
//  weather app
//
//  Created by pushkar mondal on 14/01/23.
//

import SwiftUI

struct weatherview: View {
    var weather: ResponseBody
    
    var body: some View {
        ZStack(alignment: .leading){
            VStack{
                VStack(alignment: .leading,spacing: 5){
                    Text(weather.name).bold().font(.title)
                    
                    Text("TODAY'S INFO :  \(Date().formatted(.dateTime.month().day().hour().minute()))")
                        .fontWeight(.bold)
                    
                }
                .frame(maxWidth: .infinity,alignment: .leading)
                
                Spacer()
                
                VStack{
                    HStack{
                        VStack(spacing: 20){
                            Image(systemName: "sun.max")
                                .font(.system(size: 40))
                            
                            Text(weather.weather[0].main)
                            
                        }
                        .frame(width: 150,alignment: .leading)
                        
                        Spacer()
                        
                        Text(weather.main.feelsLike.roundDouble()+"°")
                            .font(.system(size: 100))
                            .fontWeight(.bold)
                            .padding()
                    }
                    Spacer()
                        .frame(height: 80)
                    
                    AsyncImage(url: URL(string: "https://cdn.pixabay.com/photo/2020/01/24/21/33/city-4791269_960_720.png")) { image in
                                            image
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: 350)
                                        } placeholder: {
                                            ProgressView()
                                        }
                    Spacer()
                }
                .frame(maxWidth: .infinity)
                
            }
            .padding()
            .frame(maxWidth: .infinity,alignment: .leading)
            
        }
        .edgesIgnoringSafeArea(.bottom)
        .background(Color(hue: 0.656, saturation: 0.778, brightness: 0.354))
        .preferredColorScheme(.dark)
    }
}

struct weatherview_Previews: PreviewProvider {
    static var previews: some View {
        weatherview(weather: previewWeather)
    }
}
