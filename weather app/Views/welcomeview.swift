//
//  welcomeview.swift
//  weather app
//
//  Created by pushkar mondal on 13/01/23.
//

import SwiftUI
import CoreLocationUI

struct welcomeview: View {
    @EnvironmentObject var locationManager: LocationManager
    var body: some View {
        VStack{
            VStack(spacing: 20){
                Text("WELCOME TO THIS APP")
                    .bold().font(.title)
                
                Text("PLEASE SHARE YOUR LOCATION")
                    .padding()
            }
            .multilineTextAlignment(.center)
            .padding()
            
            LocationButton(.shareCurrentLocation){
                locationManager.requestLocation()
            }
            .cornerRadius(30)
            .symbolVariant(.fill)
            .foregroundColor(.white)
            
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity)
    }
}

struct welcomeview_Previews: PreviewProvider {
    static var previews: some View {
        welcomeview()
    }
}
