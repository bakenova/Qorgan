//
//  SettingsViewController.swift
//  Qorgan
//
//  Created by Арайлым Бакенова on 13.11.2022.
//

import UIKit
import InstantSearchVoiceOverlay

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    let voiceOverlay = VoiceOverlayController()
    let home = HomeViewController()
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
            
        })
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
