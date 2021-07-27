//
//  LoadingIndicator.swift
//  SpaceXRockets
//
//  Created by Batuhan Baran on 27.07.2021.
//

import SwiftUI

struct LoadingIndicator: View {
    
    @State var isAnimating = false
    
    var body: some View {
        Circle()
            .trim(from: 0.2, to: 1)
            .stroke(lineWidth: 8)
            .rotation(Angle(degrees: isAnimating ? 360 : 0))
            .foregroundColor(.blue)
            .frame(width: 80, height: 80, alignment: .center)
            .animation(Animation.linear(duration: 0.5).repeatForever(autoreverses: false))
            .onAppear(perform: {
                self.isAnimating = true
            })
    }
}

struct LoadingIndicator_Previews: PreviewProvider {
    static var previews: some View {
        LoadingIndicator()
    }
}
