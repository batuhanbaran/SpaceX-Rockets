//
//  RocketListViewModel.swift
//  SpaceXRockets
//
//  Created by Batuhan Baran on 25.07.2021.
//

import Foundation

final class RocketListViewModel: ObservableObject {
    
    @Published var name = ""
    @Published var country = ""
    @Published var firstFlight = ""
    @Published var rockets = [Rocket]()
    
    func loadRockets() {
        API.fetch(endPoint: "/rockets") { (rockets: Result<[Rocket],Error>) in
            switch rockets {
                case .success(let rockets):
                    self.rockets = rockets
                case .failure(let error):
                    print(error)
            }
        }
    }
}
