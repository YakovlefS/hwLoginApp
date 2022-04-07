//
//  UserInfoViewController.swift
//  hwLoginApp
//
//  Created by YakovlefS on 06.04.2022.
//

import UIKit

class UserInfoViewController: UIViewController {

    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = user.person.fullName
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let imageVC = segue.destination as? ImageViewController else { return }
        imageVC.user = user
    }
}
