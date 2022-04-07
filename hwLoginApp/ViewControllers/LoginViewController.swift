//
//  LoginViewController.swift
//  hwLoginApp
//
//  Created by YakovlefS on 31.03.2022.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet var userNameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    private let user = User.getUserData()
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tabBarController = segue.destination as? UITabBarController else { return }
        guard let viewControllers = tabBarController.viewControllers else { return }
        
        viewControllers.forEach {
            if let welcomeVC = $0 as? WelcomeViewController {
                welcomeVC.user = user
            } else if let navigationVC = $0 as? UINavigationController {
                let userInfoVC = navigationVC.topViewController as! UserInfoViewController
                userInfoVC.user = user
            }
        }
    }
    
     
    @IBAction func loginPressed() {
        if userNameTextField.text != user.login || passwordTextField.text != user.password {
            showAlert(
                title: "Invalid login or password",
                message: "Please, enter correct login or password",
                textField: passwordTextField
            )
        }
    }
    @IBAction func unwindSegue(segue: UIStoryboardSegue) {
        userNameTextField.text = ""
        passwordTextField.text = ""
    }
}

extension LoginViewController {
    private func showAlert(title: String, message: String, textField: UITextField? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default) { _ in
            textField?.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

extension LoginViewController: UITextViewDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameTextField {
            passwordTextField.becomeFirstResponder()
        } else {
            loginPressed()
            performSegue(withIdentifier: "showWelcomeVC", sender: nil)
        }
        return true
    }
}
//for viewController in viewControllers {
//    ...
//    } else if let navigationVC = viewController as? UINavigationController {
//        let aboutUserVC = navigationVC.topViewController as! AboutMeViewController
//    }
//}
//
//override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//    let tabBarController = segue.destination as! UITabBarController
//    ...
//    for viewController in viewControllers {
//        if let welcomeVC = viewController as? WelcomeViewController {
//
//        }
//    }
//    ...
//}
