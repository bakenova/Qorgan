//
//  SettingsViewController.swift
//  Qorgan
//
//  Created by Арайлым Бакенова on 13.11.2022.
//

import UIKit
import InstantSearchVoiceOverlay

class SettingsViewController: UIViewController {

//  MARK: - Defining variables
    let voiceOverlay = VoiceOverlayController()
    let home = HomeViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func turnOn(_ sender: Any) {
        self.voiceControl()
    }
    
    func voiceControl() {
        voiceOverlay.start(on: self, textHandler: {text, final, _ in
            if final {
                if text == "Key" {
                    self.home.callEM()
                }
//                if text == "Liar" {
////                    self.voiceOverlay.dismiss()
//                    self.home.sendMes()
//                }
            }
            else{
                 print("In progress: \(text)")
            }
        }, errorHandler: {error in
            
        }
        )
    }
}
