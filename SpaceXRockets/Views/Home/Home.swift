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
    @State var isAnimating = true
    
    var body: some View {
        ZStack {
            if isAnimating {
                LoadingIndicator()
            }else {
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
                    .navigationBarTitle("SpaceX Rockets", displayMode: .large)
                    .background(
                        NavigationLink("", destination: RocketDetail(viewModel: viewModel, id: $id), isActive: $isActive)
                    )
                    .background(Image("backgroundImage").ignoresSafeArea())
                }
            }
            
        }.onAppear(perform: {
            viewModel.loadRockets { isFinish in
                if isFinish {
                    self.isAnimating = false
                }
            }
        })
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
