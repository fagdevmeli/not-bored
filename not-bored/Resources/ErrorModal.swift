//
//  ErrorModal.swift
//  not-bored
//
//  Created by Flavio Andres Gomez on 03/01/2022.
//

import Foundation

import UIKit

extension UIViewController {

    func showAlertWithTitleRetry(_ title: String, message: String, handler: @escaping () -> Void) {
        let action = UIAlertAction(title: "Back", style: .default){
            UIAlertAction in handler()
        }
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        self.present(alertController, animated: true){}
        alertController.addAction(action)
    }
}
