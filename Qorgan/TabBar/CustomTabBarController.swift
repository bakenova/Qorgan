//
//  CustomTabBarController.swift
//  Qorgan
//
//  Created by Арайлым Бакенова on 12.11.2022.
//

import UIKit

class CustomTabBarController: UITabBarController {
    
    @IBInspectable var initialIndex: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        selectedIndex = initialIndex
    }
}
