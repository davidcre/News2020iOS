//
//  NewsCell.swift
//  NewsApp
//
//  Created by Josselin DUBOC on 18/03/2020.
//  Copyright © 2020 Josselin DUBOC. All rights reserved.
//

import UIKit

class NewsCell: UITableViewCell {
    @IBOutlet private weak var author: UILabel!
    @IBOutlet private weak var publishedAt: UILabel!
    @IBOutlet private weak var title: UILabel!
    @IBOutlet private weak var content: UILabel!
    @IBOutlet private weak var imageArticle: UIImageView!

    func configure(
         author: String? = "",
         publishedAt: String? = "",
         title: String? = "",
         content: String? = "",
         imageArticle: String? = "") {
        self.author.text = author
        self.publishedAt.text = publishedAt
        self.title.text = title
        self.content.text = content
        if imageArticle != nil {
            self.imageArticle.load(url: URL(string: imageArticle!)!)
        }
    }
}
