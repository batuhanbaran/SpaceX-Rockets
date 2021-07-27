//
//  Image+Extension.swift
//  SpaceXRockets
//
//  Created by Batuhan Baran on 26.07.2021.
//

import Foundation
import SwiftUI
import Kingfisher

extension Image {
    func imageFromKingfisher(imageUrl: String) -> some View {
        KFImage(URL(string: imageUrl)!)
            .resizable()
    }
}
