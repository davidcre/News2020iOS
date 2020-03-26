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
    @IBOutlet private weak var button: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func onClick(_ sender: UIButton, forEvent event: UIEvent) {
        performSegue(withIdentifier: "segueToProfile", sender: nil)
    }
}
