//
//  Alert.swift
//  NewsApp
//
//  Created by Josselin DUBOC on 10/04/2020.
//  Copyright © 2020 Josselin DUBOC. All rights reserved.
//

import Foundation
import UIKit
//swiftlint:disable identifier_name
struct Alert {
    private static func showAlert(on vc: UIViewController, with title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default) { (_: UIAlertAction) -> Void in
           vc.navigationController?.popViewController(animated: true)
        })
        vc.present(alert, animated: true, completion: nil)
    }

    static func showNoResultsAlert(on vc: UIViewController) {
        showAlert(on: vc, with: R.string.localizable.noResultsFound(), message: "")
    }
}
