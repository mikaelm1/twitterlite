//
//  FeedViewModelTests.swift
//  TwitterLiteTests
//
//  Created by Mikael Mukhsikaroyan on 1/15/23.
//

import Combine
import XCTest
@testable import TwitterLite

class FeedServiceMock: FeedServiceProtocol {
    func fetchFeed(completion: ((Result<[PostResponseModel], Error>) -> Void)) {
        completion(.success(FeedService.getMockPosts()))
    }
}

class FeedViewModelTests: XCTestCase {

    private var cancellables = Set<AnyCancellable>()

    func testInit() {
        let sut = FeedViewModel(feedService: FeedServiceMock())
        XCTAssertNotNil(sut.feedService)
    }

    func testFetch() {
        let sut = FeedViewModel(feedService: FeedServiceMock())

        guard case FeedViewModel.DisplayModel.loading = sut.displayModel else {
            XCTFail()
            return
        }

        let exp = expectation(description: "testFetch")

        var capturedPosts = [PostResponseModel]()
        sut.$displayModel
            .dropFirst()
            .sink { displayModel in
                switch displayModel {
                case .content(let posts):
                    capturedPosts = posts
                    exp.fulfill()
                default: break
                }
            }
            .store(in: &cancellables)

        sut.fetch()
        wait(for: [exp], timeout: 2)
        XCTAssertEqual(capturedPosts.count, 20)
    }
}
