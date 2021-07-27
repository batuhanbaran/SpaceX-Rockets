//
//  RocketDetail.swift
//  SpaceXRockets
//
//  Created by Batuhan Baran on 26.07.2021.
//

import SwiftUI
import Kingfisher

struct RocketDetail: View {
    
    @ObservedObject var viewModel = RocketListViewModel()
    @Binding var id: String
    @State var isPresented = false
    
    var body: some View {
            VStack(spacing: 25) {
                TabView {
                    ForEach(viewModel.rocket?.flickrImages ?? [], id: \.self) { image in
                        Image("").imageFromKingfisher(imageUrl: image)
                    }
                    
                }
                
                .tabViewStyle(PageTabViewStyle())
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .padding()
                .frame(width: UIScreen.main.bounds.width - 15, height: 200)
                
                List {
                    HStack(spacing: 10) {
                        Image(systemName: "number")
                            .resizable()
                            .frame(width: 30, height: 30, alignment: .center)
                        Text("\(viewModel.rocket?.id ?? "")")
                    }
                    .padding(.bottom)
                    
                    HStack(spacing: 10) {
                        Image(systemName: "doc.plaintext.fill")
                            .resizable()
                            .frame(width: 30, height: 30, alignment: .center)
                        Text("\(viewModel.rocket?.description ?? "")")
                            .multilineTextAlignment(.leading)
                    }
                    .padding(.bottom)
                    
                    HStack(spacing: 10) {
                        Image(systemName: "safari")
                            .resizable()
                            .frame(width: 30, height: 30, alignment: .center)
                        Text("\(viewModel.rocket?.wikipedia ?? "")")
                            .foregroundColor(.blue)
                    }
                    .padding(.bottom)
                    .onTapGesture {
                        self.isPresented = true
                    }
                    
                    HStack(spacing: 10) {
                        Image(systemName: "mappin.and.ellipse")
                            .resizable()
                            .frame(width: 30, height: 30, alignment: .center)
                        Text("\(viewModel.rocket?.country ?? "")")
                    }
                    .padding(.bottom)
                    
                    HStack(spacing: 10) {
                        Image(systemName: "scalemass")
                            .resizable()
                            .frame(width: 30, height: 30, alignment: .center)
                        Text("\(viewModel.rocket?.mass.kg ?? 0)")
                    }
                }
                
                Spacer()
            }
            .navigationTitle(viewModel.rocket?.name ?? "")
            .onAppear(perform: {
                viewModel.loadOneRocket(id)
            })
            .sheet(isPresented: $isPresented, content: {
                WebView(url: URL(string: viewModel.rocket?.wikipedia ?? ""))
            })
    }
}

struct RocketDetail_Previews: PreviewProvider {
    static var previews: some View {
        RocketDetail(id: Binding<String>.constant(""))
    }
}
