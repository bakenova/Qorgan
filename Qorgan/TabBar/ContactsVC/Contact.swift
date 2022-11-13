//
//  Contact.swift
//  Qorgan
//
//  Created by Арайлым Бакенова on 13.11.2022.
//

import Foundation

//struct Contact {
//    let givenName: String
//    let familyName: String
//    let number: String
//}

import UIKit
class Contact {
    var givenName: String?
    var number: String?
    var image: UIImage?
    init(_ givenName: String, _ number: String, _ image: UIImage) {
        self.givenName = givenName
        self.number = number
        self.image = image
    }
}
