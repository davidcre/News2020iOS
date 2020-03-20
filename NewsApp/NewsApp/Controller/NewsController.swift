//
//  NewsController.swift
//  NewsApp
//
//  Created by Josselin DUBOC on 18/03/2020.
//  Copyright © 2020 Josselin DUBOC. All rights reserved.
//

import UIKit
import Alamofire

class NewsController: UITableViewController {
    private var news = News()
    public var urlRequest: URLRequest = URLRequest()
    typealias RequestCompleted = () -> Void
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchAppCategories {
            self.tableView.reloadData()
        }
    }
}

extension NewsController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news.count()
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCellIdentifier", for: indexPath) as? NewsCell {
            cell.title.text = news.get(row: indexPath.row).title
            cell.content.text = news.get(row: indexPath.row).content
            cell.author.text = news.get(row: indexPath.row).author
            cell.publishedAt.text = String(news.get(row: indexPath.row).publishedAt.dropLast(10))
            guard self.news.get(row: indexPath.row).urlToImage != nil else {
                return cell
            }
            let urlToImage = URL(string: self.news.get(row: indexPath.row).urlToImage)
            guard urlToImage != nil else {
                return cell
            }
            cell.imageArticle.load(url: urlToImage!)
            return cell
        }
        return UITableViewCell()
    }

    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension NewsController {
    func fetchAppCategories(completed: @escaping RequestCompleted) {
        let url = urlRequest.url
        AF.request(url).responseJSON { response in
            if let result  = response.value as? [String: Any] {
                if let mainDict = result["articles"] as? [[String: Any]] {
                    if !mainDict.isEmpty {
                        for article in mainDict {
                            let newsItem = NewsItem(
                                author: article["author"] as? String,
                                title: article["title"] as? String,
                                descriptionTitle: article["description"] as? String,
                                publishedAt: article["publishedAt"] as? String,
                                urlToImage: article["urlToImage"] as? String,
                                url: article["url"] as? String,
                                content: article["content"] as? String)
                            self.news.add(news: newsItem)
                        }
                    }
                }
                completed()
            }
        }
    }
}
