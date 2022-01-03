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

    override func viewDidLoad() {
        super.viewDidLoad()
        getParticipants()
        getData()  
    }
    
    func getParticipants(){
        
        let userDefaults = UserDefaults.standard
        let getPart = userDefaults.integer(forKey: "participants")
        self.participants = getPart
        print(participants)
    }
    
    func getData(){
        ws.getActivity(participants: participants, category: self.category) { activities in
            print(activities)
        } onError: { errorData in
            print(errorData)
        }
    }


}
