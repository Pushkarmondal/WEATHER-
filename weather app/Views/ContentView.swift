//
//  ContentView.swift
//  weather app
//
//  Created by pushkar mondal on 13/01/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var locationManager = LocationManager()
    var Weathermanager = weathermanager()
    @State var weather:ResponseBody?
    var body: some View {
        VStack{
            
            if let location = locationManager.location {
//                Text("YOUR LOCATION ARE: \(location.longitude),\(location.latitude)")
                if let weather = weather{
//                    Text("DATA FETCHED")
                    weatherview(weather: weather)
                }else{
                    loadingview()
                        .task {
                            do {
                                weather = try await
                                Weathermanager.getcurrentweather(latitude: location.latitude, longitude: location.longitude)
                            }catch{
                                print("ERROR GETTING DATA:\(error)")
                            }
                        }
                }
            }else{
                if locationManager.isloading {
                    loadingview()
                }else{
                    welcomeview()
                        .environmentObject(locationManager)
                }
            }
           
        }
        .background(Color(hue: 0.656, saturation: 0.778, brightness: 0.354))
        .preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
