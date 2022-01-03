//
//  SuggestionViewController.swift
//  not-bored
//
//  Created by Sebastian Martin Pagura on 03/01/2022.
//

import UIKit

class SuggestionViewController: UIViewController {
    
    let ws = ActivitiesWS()
    var category: String = ""
    var participants = 0

    @IBOutlet weak var lblActivity: UILabel!
    @IBOutlet weak var lblParticipants: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblCategory: UILabel!
    @IBOutlet weak var iconCategory: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getParticipants()
        self.title = self.category.capitalized
        getData()
    }
    
    @IBAction func btnTryAnother(_ sender: Any) {
        self.viewDidLoad()
    }
    
    func getParticipants(){
        
        let userDefaults = UserDefaults.standard
        let getPart = userDefaults.integer(forKey: "participants")
        self.participants = getPart
        print(participants)
    }
    
    func getData(){
        ws.getActivity(participants: participants, category: self.category) { activities in
            self.setUpValues(activities)
            print(activities)
        } onError: { errorData in
            print(errorData)
        }
    }
    
    func setUpValues(_ activity : Activities) {
        lblActivity.text = activity.activity
        lblParticipants.text = String(activity.participants)
        lblPrice.text = priceCategory(activity.price)
        lblCategory.text = activity.type.capitalized
        if self.category != "random" {
            lblCategory.isHidden = true
            iconCategory.isHidden = true
        }
    }
    
    func priceCategory(_ price : Double) -> String {
        if price == 0 {
            return "Free"
        }
        if price > 0 && price < 0.3 {
            return "Low"
        }
        if price > 0.3 && price < 0.6 {
            return "Medium"
        }
        return "High"
    }

}
