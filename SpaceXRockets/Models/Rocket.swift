//
//  Rocket.swift
//  SpaceXRockets
//
//  Created by Batuhan Baran on 25.07.2021.
//

import Foundation

struct Rocket: Codable, Identifiable, Hashable {
    let flickrImages: [String]
    let name: String
    let mass: Mass
    let type: String
    let active: Bool
    let stages: Int
    let boosters: Int
    let costPerLaunch: Int
    let successRatePct: Int
    let firstFlight: String
    let country: String
    let company: String
    let wikipedia: String
    let description: String
    let id: String

    enum CodingKeys: String, CodingKey {
        case flickrImages = "flickr_images"
        case costPerLaunch = "cost_per_launch"
        case successRatePct = "success_rate_pct"
        case firstFlight = "first_flight"
        case name,type,active,stages,boosters,country,company,wikipedia,description,id,mass
    }
}

struct Mass: Codable, Hashable {
    let kg: Int
}
