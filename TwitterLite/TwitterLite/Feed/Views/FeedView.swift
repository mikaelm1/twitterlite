//
//  FeedView.swift
//  TwitterLite
//
//  Created by Mikael Mukhsikaroyan on 1/15/23.
//

import SwiftUI
import TwitterUI

struct FeedView: View {
    @ObservedObject var viewModel: FeedViewModel

    var body: some View {
        ScrollView {
            switch viewModel.displayModel {
            case .loading:
                Text("Loading")
            case .networkError:
                ErrorView()
            case .content(let posts):
                ForEach(posts) { post in
                    VStack {
                        VStack {
                            HStack(alignment: .top) {
                                Image(systemName: "checkmark")
                                  .resizable()
                                  .frame(width: 16, height: 16, alignment: .topLeading)
                                  .foregroundColor(.white)
                                  .padding(20)
                                  .background(Color.green)
                                  .clipShape(Circle())

                                VStack {
                                    Text(post.username)
                                        .bold()
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                    Text(post.content)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .background(Color.red)
                                }
                                .background(Color.purple)
                            }

                            HStack {
                                Spacer()

                                Image(systemName: "heart")
                                Text("\(post.likes)")
    //                            padding(.trailing, 10)

                                Image(systemName: "tray")
                                Text("\(post.shares)")
                            }
                        }

                        Divider()
                    }
                    .padding()
                }
            }

        }
        .onAppear {
            viewModel.fetch()
        }
    }
}
