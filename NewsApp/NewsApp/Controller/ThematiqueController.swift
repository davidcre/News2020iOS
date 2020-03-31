//
//  ThematiqueController.swift
//  NewsApp
//
//  Created by Josselin DUBOC on 18/03/2020.
//  Copyright © 2020 Josselin DUBOC. All rights reserved.
//

import UIKit

class ThematiqueController: UITableViewController {
    private let category = [Category(title: NSLocalizedString("General", comment: "Name of the category"), type: .general),
                            Category(title: NSLocalizedString("Business", comment: "Name of the category"), type: .business),
                            Category(title: NSLocalizedString("Sports", comment: "Name of the category"), type: .sports),
                            Category(title: NSLocalizedString("Health", comment: "Name of the category"), type: .health),
                            Category(title: NSLocalizedString("Science", comment: "Name of the category"), type: .science),
                            Category(title: NSLocalizedString("Technology", comment: "Name of the category"), type: .technology),
                            Category(title: NSLocalizedString("Entertainment", comment: "Name of the category"), type: .entertainment)]

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Constantes.SegueIdentifier.thematiqueToNews {
            guard let newsController = segue.destination as? NewsController else {
                return
            }
            guard let indexPath = sender as? IndexPath else {
                return
            }
            newsController.category = category[indexPath.row]
        }
    }
}

extension ThematiqueController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return category.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constantes.CellIdentifier.thematique, for: indexPath) as? ThematiqueCell else {
            return UITableViewCell()
        }
        cell.configure(category: category[indexPath.row])
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: Constantes.SegueIdentifier.thematiqueToNews, sender: indexPath)
    }
}
