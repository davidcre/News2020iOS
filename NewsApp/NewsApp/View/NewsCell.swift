//
//  NewsCell.swift
//  NewsApp
//
//  Created by Josselin DUBOC on 18/03/2020.
//  Copyright © 2020 Josselin DUBOC. All rights reserved.
//

import UIKit

class NewsCell: UITableViewCell {
    @IBOutlet weak var author: UILabel!
    @IBOutlet weak var publishedAt: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var content: UILabel!
    @IBOutlet weak var imageArticle: UIImageView!
}
