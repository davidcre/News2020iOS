//
//  SearchLanguageController.swift
//  NewsApp
//
//  Created by Josselin DUBOC on 09/04/2020.
//  Copyright © 2020 Josselin DUBOC. All rights reserved.
//

import Foundation
import UIKit

class SearchLanguageController: UIViewController {
    weak var delegate: SearchService?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension SearchLanguageController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        Language.allCases[row].name
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        delegate?.onLanguageChosen(language: Language.allCases[row])
    }
}

extension SearchLanguageController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Language.allCases.count
    }
}
