//
//  ProfileController.swift
//  NewsApp
//
//  Created by Josselin DUBOC on 26/03/2020.
//  Copyright © 2020 Josselin DUBOC. All rights reserved.
//

import Foundation
import UIKit

class ProfileController: UITableViewController {
    @IBOutlet private weak var button: UIButton!
    @IBOutlet private weak var picker: UIPickerView!

    override func viewDidLoad() {
        super.viewDidLoad()
        if let country = UserDefaults().string(forKey: "Country") {
            button.setTitle(country, for: .normal)
        }
        picker.isHidden = true
    }

    @IBAction func onClick(_ sender: UIButton, forEvent event: UIEvent) {
        if let countryString = UserDefaults().string(forKey: "Country") {
            if let country = Country(rawValue: countryString) {
                if let index = country.index {
                    picker.selectRow(index, inComponent: 0, animated: false)
                }
            }
        }
        picker.isHidden = false
    }
}

extension ProfileController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension ProfileController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Country.allCases.count
    }
}

extension ProfileController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return Country.allCases[row].rawValue
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        button.setTitle(Country.allCases[row].rawValue, for: .normal)
        UserDefaults().set(Country.allCases[row].rawValue, forKey: "Country")
    }
}
