//
//  NewsCell.swift
//  NewsApp
//
//  Created by Josselin DUBOC on 18/03/2020.
//  Copyright © 2020 Josselin DUBOC. All rights reserved.
//

import UIKit

class NewsCell: UITableViewCell {
    @IBOutlet private weak var source: UILabel!
    @IBOutlet private weak var publishedAt: UILabel!
    @IBOutlet private weak var title: UILabel!
    @IBOutlet private weak var content: UILabel!
    @IBOutlet private weak var imageArticle: UIImageView!

    var viewModel: NewsCell.ViewModel? {
        didSet {
            let viewModel = self.viewModel
            self.source.text = viewModel?.source
            if let date = viewModel?.publishedAt {
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "YYYY-MM-dd HH:mm"
                self.publishedAt.text = dateFormatter.string(from: date)
            }
            self.title.text = viewModel?.title
            self.content.text = viewModel?.content
            if let imageURL = viewModel?.imageURL {
                self.imageArticle.load(url: imageURL)
            }
        }
    }
}

extension NewsCell {
    struct ViewModel {
        let source: String?
        let publishedAt: Date?
        let title: String?
        let content: String?
        let imageURL: URL?

        init(article: Article?) {
            self.source = article?.source?.name
            self.publishedAt = article?.publishedAtDate
            self.title = article?.title
            self.content = article?.content
            self.imageURL = article?.urlToImage
        }
    }
}
