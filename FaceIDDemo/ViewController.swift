//
//  ViewController.swift
//  FaceIDDemo
//
//  Created by lonnie on 2018/4/15.
//  Copyright © 2018年 lonnie. All rights reserved.
//

import UIKit
import LocalAuthentication
class ViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBAction func unlock(_ sender: UIButton) {
        let context = LAContext()
        var error:NSError?
        let reasonString = "I need to use your face ID to unlock the app"
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reasonString) {[weak self] (succeed, error) in
                DispatchQueue.main.async {
                    if succeed {
                        self?.titleLabel.text = "Unlocked"
                    } else {
                        let alert = UIAlertController(title: "Message", message: "Validation fail", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "Got it", style: .cancel, handler: nil))
                        self?.show(alert, sender: nil)
                    }
                }
            }
        }
        
    }
}

