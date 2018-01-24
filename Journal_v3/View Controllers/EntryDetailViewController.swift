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
    
    var entry: Entry?
    
    // MARK:    Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        updateViews()
    }
    
    // MARK:    UITextFieldDelegate Functions
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        resignFirstResponder()
        return true
    }
    
    // MARK:    Actions
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let title = titleTextField.text else { return }
        guard let body = bodyTextView.text else { return }
        if let entry = entry {
            EntryController.shared.updateExistingEntry(entry: entry, newTitle: title, newBody: body)
        } else {
            EntryController.shared.addEntryWith(title: title, body: body)
        }
        navigationController?.popViewController(animated: true)
    }
    
    // Update Views
    func updateViews() {
        guard let title = titleTextField.text else { return }
        guard let body = titleTextField.text else { return }
        if let entry = entry {
            entry.title = title
            entry.body = body
        }
    }
    
    // Set up UI
    func setUpUI () {
        titleTextField.layer.cornerRadius = 15.0
        bodyTextView.layer.cornerRadius = 15.0
    }
}
