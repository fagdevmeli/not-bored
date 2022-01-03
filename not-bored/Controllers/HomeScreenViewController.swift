//
//  HomeScreenViewController.swift
//  not-bored
//
//  Created by Flavio Andres Gomez on 29/12/2021.
//

import UIKit

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
        super.viewDidLoad()

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
 
}
