//
//  NewsDetailCell.swift
//  NewsApp
//
//  Created by Josselin DUBOC on 14/04/2020.
//  Copyright © 2020 Josselin DUBOC. All rights reserved.
//
import UIKit

class NewsDetailCell: UITableViewCell {
    @IBOutlet private weak var source: UILabel!
    @IBOutlet private weak var publishedAt: UILabel!
    @IBOutlet private weak var title: UILabel!
    @IBOutlet private weak var content: UILabel!
    @IBOutlet private weak var imageArticle: UIImageView!
    @IBOutlet private weak var articleDescription: UILabel!
    @IBOutlet private weak var urlButton: UIButton!

    var viewModel: NewsDetailCell.ViewModel? {
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
            self.articleDescription.text = viewModel?.articleDescription
            self.urlButton.setTitle(R.string.localizable.readTheFullArticle(), for: .normal)
        }
    }
}

extension NewsDetailCell {
    struct ViewModel {
        let source: String?
        let publishedAt: Date?
        let title: String?
        let content: String?
        let imageURL: URL?
        let articleDescription: String?

        init(article: Article?) {
            self.source = article?.source?.name
            self.publishedAt = article?.publishedAtDate
            self.title = article?.title
            self.content = article?.content
            self.imageURL = article?.imageURL
            self.articleDescription = article?.articleDescription
        }
    }
}
