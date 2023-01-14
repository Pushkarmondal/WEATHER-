//
//  loadingview.swift
//  weather app
//
//  Created by pushkar mondal on 14/01/23.
//

import SwiftUI

struct loadingview: View {
    var body: some View {
       ProgressView()
            .progressViewStyle(CircularProgressViewStyle(tint: .white))
            .frame(maxWidth: .infinity,maxHeight: .infinity)
    }
}

struct loadingview_Previews: PreviewProvider {
    static var previews: some View {
        loadingview()
    }
}
