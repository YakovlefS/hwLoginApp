//
//  WelcomeViewController.swift
//  hwLoginApp
//
//  Created by YakovlefS on 31.03.2022.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet var welcomeLabel: UILabel!
    var user = User
    
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeLabel.text = "Welcome, \(user.person.fullName)!"
    }
}
