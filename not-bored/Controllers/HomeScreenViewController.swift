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
    
    @IBOutlet weak var switchTerms: UISwitch!
    
    @IBAction func switchTerms(_ sender: UISwitch) {
        turnStartButton()
    }
    
    @IBAction func btnStart(_ sender: Any) {
        goToCategories()
    }
    
    override func viewDidLoad() {
        IQKeyboardManager.shared.enable = true
        super.viewDidLoad()
        participants.addTarget(self, action:#selector(turnStartButton) , for: .editingChanged)
        self.switchTerms.isOn = false
        self.turnStartButton()
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
    
    @objc func turnStartButton(){
        
        if switchTerms.isOn && self.checkParticipants() {
            btnStart.isEnabled = true
            btnStart.backgroundColor = UIColor(.accentColor)
        } else {
            btnStart.isEnabled = false
            btnStart.backgroundColor = .gray
        }
    }
    

    @objc func checkParticipants() -> Bool {
        guard let input = self.participants.text else {return true}
        let inputCast = Int(input) ?? 1
        if  inputCast <= 0 {
            return false
        }
        else {
            return true
        }
    }
}
