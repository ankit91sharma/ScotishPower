//
//  DetailView.swift
//  RockTracks
//
//  Created by Ankit Sharma on 06/05/25.
//

import SwiftUI

struct DetailView: View {
    @Environment(\.presentationMode) var presentationMode
    
    let detail: RockTrackScreenDataModel
    
    var body: some View {
        ZStack(alignment: .top) {
            ScrollView {
                VStack(spacing: 50) {
                    VStack(alignment: .leading, spacing: 0) {
                        imageView
                        descriptionView
                    }
                    Button(action: {
                        if  let trackViewUrl = detail.trackViewUrl,
                            let url = URL(string: trackViewUrl) {
                            UIApplication.shared.open(url)
                        }
                    }, label: {
                        Text("More Details")
                            .padding(.init(top: 12, leading: 20, bottom: 12, trailing: 20))
                            .overlay {
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(.black, lineWidth: 1.0)
                            }
                    })
                    Spacer()
                }
                .frame(maxWidth: .infinity, alignment: .topLeading)
            }
            
            .edgesIgnoringSafeArea(.all)
        }
    }
}

private extension DetailView {
    
    var imageView: some View {
        AsyncImage(url: detail.bannerLinkURL) { item in
            if let image = item.image {
                image
                    .resizable()
                    .frame(maxWidth: .infinity,
                           alignment: .topLeading)
                    .aspectRatio(contentMode: .fit)
                    .edgesIgnoringSafeArea(.top)
            } else {
                Image(systemName: "photo")
                    .frame(maxWidth: .infinity,
                           alignment: .topLeading)
            }
        }
    }
    
    var descriptionView: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(detail.displayTrackName)
                .font(.subheadline)
                .fontWeight(.light)
                .foregroundColor(.gray)
            Text(detail.displayArtistName)
                .font(.subheadline)
                .foregroundColor(.gray)
            Text(detail.displayPrice)
                .font(.subheadline)
                .fontWeight(.light)
                .foregroundColor(.gray)
            Text(detail.formattedDuration)
                .font(.subheadline)
                .fontWeight(.light)
                .foregroundColor(.gray)
            Text(detail.displayDate)
                .font(.subheadline)
                .foregroundColor(.gray)
        }
        .padding(.horizontal, 16)
        .padding(.top, 8)
    }
}
