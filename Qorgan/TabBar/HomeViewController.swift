//
//  HomeViewController.swift
//  Qorgan
//
//  Created by Арайлым Бакенова on 12.11.2022.
//

import UIKit
import CoreLocation
import MessageUI
import Contacts
import InstantSearchVoiceOverlay

class HomeViewController: UIViewController {

    private var locationManager: CLLocationManager?
    let voiceOverlay = VoiceOverlayController()
    
    @IBOutlet weak var locationLL: UILabel!
    @IBOutlet weak var call112: UIButton!
    @IBOutlet weak var sendLctn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManagerActions()
        self.voiceControl()
    }
    
    func voiceControl() {
        voiceOverlay.start(on: self, textHandler: {text, final, _ in
            if final {
                if text == "Key" {
                    self.callEM()
                }
                if text == "M" {
                    self.sendMes()
                }
            }
            else{
                 print("In progress: \(text)")
            }
        }, errorHandler: {error in
            
        })
    }
    
    func callEM() {
        guard let number = URL(string: "tel://" + "+77761664558") else { return }
            UIApplication.shared.open(number)
    }
    
    func sendMes(){
        voiceOverlay.dismiss()
        guard MFMessageComposeViewController.canSendText() else {
            print("Device is not capable to send messages")
            return
        }
        
        let composer = MFMessageComposeViewController()
        
        composer.recipients = ["+77761664558","+77758844648"]
        composer.body = "Emergency: " + locationLL.text!
        composer.subject = "Emergency:"
        composer.messageComposeDelegate = self
        
        self.present(composer, animated: true)
    }
    
    @IBAction func callEmer(_ sender: Any) {
        callEM()
    }
    
    @IBAction func sendMessage(_ sender: Any) {
        self.sendMes()
    }
    
    func locationManagerActions(){
        locationManager = CLLocationManager()
        locationManager?.requestAlwaysAuthorization()
        locationManager?.startUpdatingLocation()
        locationManager?.delegate = self
        locationManager?.allowsBackgroundLocationUpdates = true
    }
    
}

extension HomeViewController: CLLocationManagerDelegate, MFMessageComposeViewControllerDelegate {
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        switch result {
        case .cancelled:
            print("Cancelled")
        case .failed:
            print("Failed")
        case .sent:
            print("Sent")
        default:
            print("Unknown")
        }
        controller.dismiss(animated: true)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            locationLL.text = "Latitude: \(location.coordinate.latitude) \nLongtitude: \(location.coordinate.longitude)"
            
        }
    }
}
