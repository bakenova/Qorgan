//
//  BotViewController.swift
//  Qorgan
//
//  Created by Арайлым Бакенова on 13.11.2022.
//

import UIKit
import UIKit
import WebKit

class BotViewController: UIViewController, WKUIDelegate {
    var webView: WKWebView!
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let myURL = URL(string: "https://dina-2.youcanbook.me")
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
    }
}
