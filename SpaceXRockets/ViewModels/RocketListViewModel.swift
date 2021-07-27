//
//  RocketListViewModel.swift
//  SpaceXRockets
//
//  Created by Batuhan Baran on 25.07.2021.
//

import Foundation

final class RocketListViewModel: ObservableObject {
    
    var rocketInfoIcons: [String] = [
        "number",
        "doc.plaintext.fill",
        "safari",
        "mappin.and.ellipse",
        "scalemass",
    ]
    
    @Published var name = ""
    @Published var country = ""
    @Published var firstFlight = ""
    @Published var rockets = [Rocket]()
    @Published var rocket: Rocket?
    @Published var rockedAndImages = [[String]:[String]]()
    @Published var roc = [String]()
    
    func loadRockets(completion: @escaping (Bool) ->()) {
        API.fetch(endPoint: "/rockets") { (rockets: Result<[Rocket],Error>) in
            switch rockets {
                case .success(let rockets):
                    self.rockets = rockets
                    completion(true)
                case .failure(let error):
                    print(error)
            }
        }
    }
    
    func loadOneRocket(_ id: String) {
        API.fetch(endPoint: "/rockets/\(id)") { (rocket: Result<Rocket,Error>) in
            switch rocket {
                case .success(let rocket):
                    self.rocket = rocket
                case .failure(let error):
                    print(error)
            }
        }
    }
}
