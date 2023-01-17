//
//  FeedService.swift
//  TwitterLite
//
//  Created by Mikael Mukhsikaroyan on 1/10/23.
//

import Foundation
import LoremSwiftum

protocol FeedServiceProtocol {
    func fetchFeed(completion: ((Result<[PostResponseModel], Error>) -> Void))
}

class FeedService: FeedServiceProtocol {

    func fetchFeed(completion: ((Result<[PostResponseModel], Error>) -> Void)) {
        completion(.success(FeedService.getMockPosts()))
    }

    static func getMockPosts() -> [PostResponseModel] {
        var posts: [PostResponseModel] = []

        for i in 0..<20 {
            let post = PostResponseModel(
                id: i,
                username: Lorem.firstName,
                content: Lorem.tweet,
                likes: Int.random(in: 1..<100),
                shares: Int.random(in: 1..<20))
            posts.append(post)
        }

        return posts
    }
}
