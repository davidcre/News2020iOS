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
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let tabBarItems = self.tabBar.items else {
            return
        }
        for tabBarItem in tabBarItems {
            switch tabBarItem.title {
            case Constantes.TabBarItemTitle.categories:
                tabBarItem.title = R.string.localizable.categories()
            case Constantes.TabBarItemTitle.topHeadlines:
                tabBarItem.title = R.string.localizable.topHeadlines()
            case Constantes.TabBarItemTitle.search:
                tabBarItem.title = R.string.localizable.search()
            default:
                return
            }
        }
    }
}
