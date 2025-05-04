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
        NavigationStack {
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
        }
        .task {
            await viewModel.fetchTracks()
        }
    }
}

private extension RockAppListingView {
    
    var loadedView: some View {
        VStack {
            Text("Hello")
        }
    }
    
    var errorView: some View {
        // TODO: add error view
        EmptyView()
    }
}
