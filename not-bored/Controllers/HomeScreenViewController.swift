//
//  HomeScreenViewController.swift
//  not-bored
//
//  Created by Flavio Andres Gomez on 29/12/2021.
//

import UIKit
import IQKeyboardManagerSwift

class HomeScreenViewController: UIViewController {

    @IBOutlet weak var btnStart: UIButton!
    
    @IBOutlet weak var btnTerms: UIButton!

    @IBOutlet weak var participants: UITextField!
    
    @IBAction func btnTerms(_ sender: Any) {
        goToTerms()
    }
    
    @IBAction func btnStart(_ sender: Any) {
        goToCategories()
    }
    
    override func viewDidLoad() {
        IQKeyboardManager.shared.enable = true
        super.viewDidLoad()
        participants.addTarget(self, action:#selector(checkParticipants) , for: .editingChanged)
        // Do any additional setup after loading the view.
    }
    
    func goToTerms() {
        let vc = TermsAndConditionsViewController(nibName: "TermsAndConditionsViewController", bundle: nil)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func goToCategories() {
        let userDefaults = UserDefaults.standard
        userDefaults.set(participants.text, forKey: "participants")
        userDefaults.synchronize()
        
        let vc = CategoriesViewController(nibName: "CategoriesViewController", bundle: nil)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    

    @objc func checkParticipants() {
        if self.participants.text == "3" {
            btnStart.isEnabled = false
            btnStart.backgroundColor = .gray
        }
        else {
            btnStart.isEnabled = true
            btnStart.backgroundColor = UIColor(.accentColor)
        }
    }
}
