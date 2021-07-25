//
//  Home.swift
//  SpaceXRockets
//
//  Created by Batuhan Baran on 25.07.2021.
//

import SwiftUI

struct Home: View {
    @ObservedObject var viewModel = RocketListViewModel()
        
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack(spacing: 5) {
                    ForEach(viewModel.rockets) { rocket in
                        RocketListCell(rocket: rocket)
                    }
                }
            }
            .navigationBarTitle("SpaceX Rockets", displayMode: .large)
            .background(Image("backgroundImage").ignoresSafeArea())
            
        }.onAppear(perform: viewModel.loadRockets)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
