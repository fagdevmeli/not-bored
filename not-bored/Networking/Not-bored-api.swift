//
//  Not-bored-api.swift
//  not-bored
//
//  Created by Flavio Andres Gomez on 03/01/2022.
//

import Foundation
import Alamofire

struct ActivitiesWS {
    
    typealias ActivitiesHandler = (_ activites: Activities) -> Void
    typealias ErrorHandler = (_ errorData: String) -> Void
    
    func getActivity(participants: Int, category: String, onSuccess: @escaping ActivitiesHandler, onError: @escaping ErrorHandler) {
        
        //        func getActivity(participants: Int, category: String) {
        
        let urlBase = "https://www.boredapi.com/api/activity"
        var urlString: String = ""
        
        urlString = "\(urlBase)?participants=\(participants)"
        
        if category != "random" {
            urlString = "\(urlString)&type=\(category)"
        }
        
        let req = AF.request(urlString)
                
        req.response { DataResponse in
            
            guard let data = DataResponse.data else{return}
            let jsondecoder = JSONDecoder()
            //            porque se usa self despues del parametro??
            let activities = try? jsondecoder.decode(Activities.self, from: data)
            
            guard let activitiesData = activities else{
                onError("algo paso")
                return
            }
            onSuccess(activitiesData)
            
        }
    }
}
