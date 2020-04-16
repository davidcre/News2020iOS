//
//  ThematiqueController.swift
//  NewsApp
//
//  Created by Josselin DUBOC on 18/03/2020.
//  Copyright © 2020 Josselin DUBOC. All rights reserved.
//

import UIKit

class ThematiqueController: UITableViewController {
    @IBOutlet private weak var profileButton: UIButton!

    private let category = [Category(title: R.string.localizable.general(), image: Constantes.SystemImage.docRichText, type: .general),
                            Category(title: R.string.localizable.business(), image: Constantes.SystemImage.dollarSign, type: .business),
                            Category(title: R.string.localizable.sports(), image: Constantes.SystemImage.sportsCourt, type: .sports),
                            Category(title: R.string.localizable.technology(), image: Constantes.SystemImage.desktopComputer, type: .technology),
                            Category(title: R.string.localizable.health(), image: Constantes.SystemImage.heart, type: .health),
                            Category(title: R.string.localizable.science(), image: Constantes.SystemImage.sum, type: .science),
                            Category(title: R.string.localizable.entertainment(), image: Constantes.SystemImage.television, type: .entertainment)]

    override func viewDidLoad() {
        super.viewDidLoad()
        initThematiqueController()
    }

    @IBAction func onProfileClicked() {
        performSegue(withIdentifier: R.segue.thematiqueController.segueToProfile, sender: nil)
    }

    func initThematiqueController() {
        self.navigationItem.title = R.string.localizable.categories()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == R.segue.thematiqueController.segueToNews.identifier {
            guard let newsController = segue.destination as? NewsController else {
                return
            }
            guard let indexPath = sender as? IndexPath else {
                return
            }
            newsController.viewTitle = category[indexPath.row].title
            let parametersRequest: ParametersRequest = ParametersRequest(category: category[indexPath.row], requestType: .topHeadlines)
            newsController.newsService = NewsServiceImpl(parametersRequest: parametersRequest)
        }
    }
}

extension ThematiqueController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return category.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.thematiqueCellIdentifier, for: indexPath) else {
            return UITableViewCell()
        }
        cell.configure(category: category[indexPath.row])
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: R.segue.thematiqueController.segueToNews, sender: indexPath)
    }
}
