//
//  ContactsViewController.swift
//  Qorgan
//
//  Created by Арайлым Бакенова on 13.11.2022.
//

import UIKit
import Contacts

class ContactsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var contacts = [Contact]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.reloadData()
        tableView.delegate = self
        tableView.dataSource = self
        
        
        
        fetchAllContacts()
    }
    
    func fetchAllContacts() {
        let store = CNContactStore()
        let keys = [CNContactGivenNameKey, CNContactFamilyNameKey, CNContactPhoneNumbersKey] as [CNKeyDescriptor]
        
        store.requestAccess(for: .contacts) {(success, error) in
            if success {
                print("Success")
            }
        }
        
        let fetchRequest = CNContactFetchRequest(keysToFetch: keys)
        
        try! store.enumerateContacts(with: fetchRequest) { (contact, result) in
            
            let name = contact.givenName
            let surname = contact.familyName
            let num = contact.phoneNumbers.first?.value.stringValue
                
            let contactAppend = Contact(name, num!, UIImage(named: "ic")!)
            self.contacts.append(contactAppend)
            print(contacts)
            
        }
                                     
        tableView.reloadData()
        
    }
    
    //  MARK: - TableView functions
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return contacts.count
        }
        
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! ContactTableViewCell
//            cell.imgQ.image = UIImage(named: "ic")
            cell.name.text = contacts[indexPath.row].givenName
            cell.num.text = contacts[indexPath.row].number
            return cell
        }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}
