//
//  EntryDetailViewController.swift
//  Journal_v3
//
//  Created by Taylor Bills on 1/24/18.
//  Copyright © 2018 Taylor Bills. All rights reserved.
//

import UIKit

class EntryDetailViewController: UIViewController, UITextFieldDelegate {
    
    // MARK:    Properties
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var bodyTextView: UITextView!
    @IBOutlet weak var clearButton: UIButton!
    
    var entry: Entry?
    
    // MARK:    Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        updateViews()
    }
    
    // MARK:    UITextFieldDelegate Functions
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    // MARK:    Actions
    
    // Save Button
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let title = titleTextField.text, !title.isEmpty else { return }
        guard let body = bodyTextView.text, !body.isEmpty else { return }
        if let entry = entry {
            EntryController.shared.updateExistingEntry(entry: entry, newTitle: title, newBody: body)
        } else {
            EntryController.shared.addEntryWith(title: title, body: body)
        }
        navigationController?.popToRootViewController(animated: true)
    }
    
    // Clear all button
    @IBAction func clearAllButtonTapped(_ sender: Any) {
        titleTextField.text = ""
        bodyTextView.text = ""
    }
    
    // Update Views
    func updateViews() {
        guard let update = entry else { return }
        titleTextField.text = update.title
        bodyTextView.text = update.body
    }
    
    // Set up UI
    func setUpUI () {
        titleTextField.layer.cornerRadius = 15.0
        bodyTextView.layer.cornerRadius = 15.0
        clearButton.layer.cornerRadius = 15.0
    }
}
