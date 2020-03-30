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
    @IBOutlet private weak var countryButton: UIButton!
    @IBOutlet private weak var countryPicker: UIPickerView!

    override func viewDidLoad() {
        super.viewDidLoad()
        if let country = UserDefaults().string(forKey: Constantes.UserDefaultsKey.country) {
            countryButton.setTitle(country, for: .normal)
        }
        countryPicker.isHidden = true
    }

    @IBAction func onCountryClicked() {
        if let countryString = UserDefaults().string(forKey: Constantes.UserDefaultsKey.country) {
            if let country = Country(rawValue: countryString) {
                if let index = country.index {
                    countryPicker.selectRow(index, inComponent: 0, animated: false)
                }
            }
        }
        countryPicker.isHidden = false
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
        return Country.allCases[row].name
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        countryButton.setTitle(Country.allCases[row].name, for: .normal)
        UserDefaults().set(Country.allCases[row].name, forKey: Constantes.UserDefaultsKey.country)
    }
}
