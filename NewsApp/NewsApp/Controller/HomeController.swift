//
//  HomeController.swift
//  NewsApp
//
//  Created by Josselin DUBOC on 26/03/2020.
//  Copyright © 2020 Josselin DUBOC. All rights reserved.
//

import Foundation
import UIKit

class HomeController: UITabBarController {
    @IBOutlet private weak var profileButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        guard let items = self.tabBar.items else {
            return
        }
        items[0].title = R.string.localizable.topHeadlines()
        items[1].title = R.string.localizable.categories()
        items[2].title = R.string.localizable.search()
    }

    @IBAction func onProfileClicked() {
        performSegue(withIdentifier: R.segue.homeController.segueToProfile, sender: nil)
    }
}
