//
//  ViewController.swift
//  TwitterLite
//
//  Created by Mikael Mukhsikaroyan on 1/10/23.
//

import SwiftUI
import UIKit

class ViewController: UIViewController {

    let feedService: FeedServiceProtocol
    var feedViewModel: FeedViewModel?

    init(feedService: FeedServiceProtocol) {
        self.feedService = feedService
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        view.backgroundColor = .white

        feedViewModel = FeedViewModel(feedService: feedService)
        let vc = UIHostingController(rootView: FeedView(viewModel: feedViewModel!))
        addChild(vc)
        vc.view.frame = view.frame
        view.addSubview(vc.view)
        vc.didMove(toParent: self)
    }
}

