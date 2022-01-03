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
    var participants: String = "0"

    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
        getParticipants()
        
    }
    
    func getParticipants(){
        
        let userDefaults = UserDefaults.standard
        let getPart = userDefaults.object(forKey: "participants")
        self.participants = getPart as! String
        print(participants)
    }
    
    func getData(){
        ws.getActivity(participants: 1, category: self.category) { activities in
            print(activities)
        } onError: { errorData in
            print(errorData)
        }
    }


}
