//
//  Home.swift
//  SpaceXRockets
//
//  Created by Batuhan Baran on 25.07.2021.
//

import SwiftUI

struct Home: View {
    @StateObject var viewModel = RocketListViewModel()
    @State var isActive = false
    @State var id = ""
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack(spacing: 5) {
                    ForEach(viewModel.rockets.indices, id: \.self) { index in
                        RocketListCell(rocket: viewModel.rockets[index])
                            .onTapGesture {
                                self.isActive.toggle()
                                self.id = viewModel.rockets[index].id
                            }
                    }
                }
            }
            .background(
                NavigationLink("", destination: RocketDetail(viewModel: viewModel, id: $id), isActive: $isActive)
            )
            .navigationBarTitle("SpaceX Rockets", displayMode: .large)
            .background(Image("backgroundImage").ignoresSafeArea())

        }
        .onAppear(perform: viewModel.loadRockets)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
