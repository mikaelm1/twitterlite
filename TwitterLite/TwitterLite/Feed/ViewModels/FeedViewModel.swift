//
//  FeedViewModel.swift
//  TwitterLite
//
//  Created by Mikael Mukhsikaroyan on 1/10/23.
//

import Foundation
import Combine

class FeedViewModel: ObservableObject {

    enum DisplayModel {
        case content([PostResponseModel])
        case networkError
        case loading
    }

    @Published var displayModel = DisplayModel.loading
    let feedService: FeedServiceProtocol

    init(feedService: FeedServiceProtocol) {
        self.feedService = feedService
    }

    func fetch() {
        feedService.fetchFeed { [weak self] result in
            guard let self = self else { return }
            DispatchQueue.main.async {
                switch result {
                case .success(let posts):
                    self.displayModel = .content(posts)
                case .failure:
                    self.displayModel = .networkError
                }
            }
        }
    }
}
