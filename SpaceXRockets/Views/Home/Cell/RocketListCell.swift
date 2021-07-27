//
//  RocketListCell.swift
//  SpaceXRockets
//
//  Created by Batuhan Baran on 25.07.2021.
//

import SwiftUI

struct RocketListCell: View {
    @State var rocket: Rocket
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.black)
                .frame(height: 280, alignment: .center)
                .cornerRadius(25)
                .shadow(color: .black, radius: 2, x: 0, y: 0)
                .opacity(0.75)
            VStack {
                Image("").imageFromKingfisher(imageUrl: rocket.flickrImages[0])
                    .frame(width: UIScreen.main.bounds.width - 60, height: 150, alignment: .center)
                    .cornerRadius(15)
                    .padding(.top)
                
                HStack {
                    VStack(alignment: .leading, spacing: 10) {
                        Text(rocket.name)
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                        Text(rocket.country)
                            .foregroundColor(.white)
                            .font(.subheadline)
                        Text(rocket.firstFlight)
                            .foregroundColor(Color(.systemGray))
                            .font(.subheadline)
                    }
                    Spacer()
                    
                }.padding()
            }
            
        }.padding()
    }
}
