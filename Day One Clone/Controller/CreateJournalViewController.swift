//
//  CreateJournalViewController.swift
//  Day One Clone
//
//  Created by Polina Fiksson on 5/22/18.
//  Copyright © 2018 PolinaFiksson. All rights reserved.
//

import UIKit

class CreateJournalViewController: UIViewController {

    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var navBar: UINavigationBar!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var setDatabutton: UIButton!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var aboveNavBarView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navBar.barTintColor = UIColor(red: 0.298, green: 0.757, blue: 0.988, alpha: 1.00)//4cc1fc
        aboveNavBarView.backgroundColor = UIColor(red: 0.298, green: 0.757, blue: 0.988, alpha: 1.00)
        navBar.tintColor = .white
        navBar.isTranslucent = false
        navBar.titleTextAttributes = [.foregroundColor:UIColor.white]
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: Notification.Name.UIKeyboardWillHide, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: Notification.Name.UIKeyboardWillShow, object: nil)

    }

    @objc func keyboardWillHide(notification:Notification) {
        changeKeyBoardHeight(notification: notification)
    }
    
    @objc func keyboardWillShow(notification:Notification) {
        changeKeyBoardHeight(notification: notification)
    }
    
    func changeKeyBoardHeight(notification:Notification) {
        if let keyboardFrame = notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue {
            let keyHeight = keyboardFrame.cgRectValue.height
            bottomConstraint.constant = keyHeight + 10
        }
    }
    
    @IBAction func cancelTapped(_ sender: UIBarButtonItem) {
    }
    
    @IBAction func saveTapped(_ sender: UIBarButtonItem) {
    }
    
    @IBAction func saveDateTapped(_ sender: UIButton) {
    }
    
    @IBAction func calendarTapped(_ sender: UIButton) {
    }
    @IBAction func cameraTapped(_ sender: UIButton) {
    }
    
}
