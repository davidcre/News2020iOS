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
    @IBOutlet private weak var developpedLabel: UILabel!
    @IBOutlet private weak var countryLabel: UILabel!
    private var countrySelected: Country?
    private let preferencesService: PreferencesService = PreferencesServiceImpl()

    override func viewDidLoad() {
        super.viewDidLoad()
        initProfileController()
        if let country = preferencesService.getCountry() {
            countryButton.setTitle(country.name, for: .normal)
            self.countrySelected = country
        }
        countryPicker.isHidden = true
    }

    func initProfileController() {
        developpedLabel.text = R.string.localizable.developedByJosselinDuboc()
        countryLabel.text = R.string.localizable.country()
        self.navigationItem.title = R.string.localizable.myAccount()
    }

    @IBAction func onCountryClicked() {
        if let index = countrySelected!.index {
            countryPicker.selectRow(index, inComponent: 0, animated: false)
        }
        countryPicker.isHidden = false
    }
}

extension ProfileController {
    private func saveCountry(_ selectedCountry: Country?) {
        guard let country = selectedCountry else {
            return
        }
        preferencesService.saveCountry(country)
    }
}

extension ProfileController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: true)
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let sectionName: String
        switch section {
        case 0:
            sectionName = R.string.localizable.preferences()
        case 1:
            sectionName = R.string.localizable.more()
        default:
            sectionName = ""
        }
        return sectionName
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
        countrySelected = Country.allCases[row]
        saveCountry(countrySelected)
    }
}
