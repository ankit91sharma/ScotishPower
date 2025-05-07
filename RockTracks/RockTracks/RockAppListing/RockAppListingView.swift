//
//  RockAppListingView.swift
//  RockTracks
//
//  Created by Ankit Sharma on 03/05/25.
//

import SwiftUI

struct RockAppListingView: View {
    
    @ObservedObject private(set) var viewModel: RockAppListingViewModel
    private let navigationTitle = "Rock Tracks"
        
    var body: some View {
        NavigationView {
            VStack {
                switch viewModel.state {
                case .loaded:
                    loadedView
                case .loading:
                    ProgressView()
                        .progressViewStyle(.circular)
                case .error:
                    errorView
                }
            }
            .navigationTitle(navigationTitle)
            .navigationBarTitleDisplayMode(.inline)
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .task {
            await viewModel.fetchTracks()
        }
    }
}

private extension RockAppListingView {
    
    var loadedView: some View {
        List(viewModel.tracks) { track in
            ZStack {
                HStack(spacing: 16) {
                        AsyncImage(url: track.thumbnailURL) { item in
                            if let image = item.image {
                                image
                                    .frame(width: 50, height: 50)
                                    .scaledToFill()
                            } else {
                                Image(systemName: "photo")
                                    .frame(width: 50, height: 50)
                            }
                        }
                        VStack(spacing: 4) {
                            Text(track.displayTrackName)
                                .font(.headline)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            Text(track.displayArtistName)
                                .font(.body)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .foregroundColor(.gray)
                            Text(track.displayPrice)
                                .font(.body)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .foregroundColor(.gray)
                        }
                    }
                    .padding()
                    .overlay(content: {
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.gray, lineWidth: 1)
                    })
                NavigationLink(destination: DetailView(detail: track)) { }
                    .opacity(0)
            }
            .listRowSeparator(.hidden)
        }
        .listStyle(.plain)
    }
    
    var errorView: some View {
        // TODO: add error view
        EmptyView()
    }
}

