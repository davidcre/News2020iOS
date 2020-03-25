//
//  NewsController.swift
//  NewsApp
//
//  Created by Josselin DUBOC on 18/03/2020.
//  Copyright © 2020 Josselin DUBOC. All rights reserved.
//

import UIKit

class NewsController: UITableViewController {
    private let apiClient = APIClient()
    private var newsArticles: [Article] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        apiClient.send(GetTopHeadlines()) { [weak self] response in
            response.map { newsArticles in
                self?.newsArticles = newsArticles
            }
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
}

extension NewsController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.newsArticles.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCellIdentifier", for: indexPath) as? NewsCell {
            let articleAtIndexPath = self.newsArticles[indexPath.row]
            cell.configure(author: articleAtIndexPath.author,
                           publishedAt: articleAtIndexPath.publishedAt,
                           title: articleAtIndexPath.title,
                           content: articleAtIndexPath.content,
                           imageArticle: articleAtIndexPath.urlToImage)
            return cell
        }
        return UITableViewCell()
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: true)
    }
}
