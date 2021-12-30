//
//  HomeScreenViewController.swift
//  not-bored
//
//  Created by Flavio Andres Gomez on 29/12/2021.
//

import UIKit

class HomeScreenViewController: UIViewController {

    
    @IBOutlet weak var btnTerms: UIButton!

    @IBAction func btnTerms(_ sender: Any) {
        goToTerms()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func goToTerms() {
        let vc = TermsAndConditionsViewController(nibName: "TermsAndConditionsViewController", bundle: nil)
        self.navigationController?.pushViewController(vc, animated: true)
    }
 
}
