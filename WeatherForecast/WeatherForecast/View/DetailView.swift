//
//  SwiftUIView.swift
//  WeatherForecast
//
//  Created by Alyx on 19/04/24.
//

import SwiftUI

struct DetailView: View {
    var body: some View {
        NavigationView {
            NavigationLink(destination: ContentView()) {
                Text("Add")
                    .foregroundColor(.blue)
            }
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}
