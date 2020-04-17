//
//  SearchLanguageController.swift
//  NewsApp
//
//  Created by Josselin DUBOC on 09/04/2020.
//  Copyright © 2020 Josselin DUBOC. All rights reserved.
//

import Foundation
import UIKit
import FlagKit

class SearchLanguageController: UIViewController {
    @IBOutlet private weak var languagePicker: UIPickerView!
    @IBOutlet private weak var languageLabel: UILabel!
    @IBOutlet private weak var resetButton: UIButton!

    weak var delegate: SearchService?
    var languageSelected: Language?
    private let languages = Language.allCases.sorted {
        $0.translation < $1.translation
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        initLanguageController()
    }

    func initLanguageController() {
        initLanguageLabel()
        self.navigationItem.title = R.string.localizable.language()
        if let language = languageSelected, let index = languages.firstIndex(of: language) {
            languagePicker.selectRow(index, inComponent: 0, animated: false)
        }
    }

    func initLanguageLabel() {
        self.languageLabel.text = self.languageSelected?.translation ?? R.string.localizable.selectALanguage()
    }

    @IBAction func onResetButtonClicked() {
        languageSelected = nil
        initLanguageLabel()
        languagePicker.selectRow(0, inComponent: 0, animated: true)
        delegate?.resetLanguage()
    }
}

extension SearchLanguageController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        languages[row].translation
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        languageSelected = languages[row]
        if let language = languageSelected {
            delegate?.onLanguageChosen(language: language)
        }
        initLanguageLabel()
    }
}

extension SearchLanguageController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return languages.count
    }
}
