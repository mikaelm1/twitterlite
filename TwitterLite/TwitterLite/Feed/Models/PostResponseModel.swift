//
//  PostResponseModel.swift
//  TwitterLite
//
//  Created by Mikael Mukhsikaroyan on 1/10/23.
//

import Foundation

struct PostResponseModel: Identifiable {
    var id: Int
    var username: String
    let content: String
    let likes: Int
    let shares: Int
}

//struct PostModel: Identifiable {
//    var id: Int
//    var username: String
//
//    init(responseModel: PostResponseModel) {
//        self.id = responseModel.id
//        self.username = responseModel.username
//    }
//}
