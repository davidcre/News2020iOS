//
//  Extension_UIImageView_+load.swift
//  NewsApp
//
//  Created by Josselin DUBOC on 19/03/2020.
//  Copyright © 2020 Josselin DUBOC. All rights reserved.
//

import UIKit

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
