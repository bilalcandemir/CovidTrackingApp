//
//  ViewController.swift
//  CovidTrackingApp
//
//  Created by Bilal Candemir on 2/14/21.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var txtIdentityNumber: CustomTextField!
    @IBOutlet weak var txtPassword: CustomTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Login"
        textFieldSettings()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    func textFieldSettings(){
        txtIdentityNumber.placeholder = "T.C Identity Number"
        txtPassword.placeholder = "Your Password"
        txtIdentityNumber.layer.borderWidth = 2
        txtIdentityNumber.layer.borderColor = UIColor(named: "textFieldBorderColor")?.cgColor
        
        txtPassword.layer.borderWidth = 2
        txtPassword.layer.borderColor = UIColor(named: "textFieldBorderColor")?.cgColor
    }
    
    func loginAction(){
        if txtIdentityNumber.text == "" {
            /// Please Enter Your Identity Number
        }
        else if txtPassword.text == "" {
            /// Please Enter Your Password
        }
        else {
            AccountService.Login(identityNo: txtIdentityNumber.text!, password: txtPassword.text!) { (response, message) in
                guard let response = response else {
                    return
                }
                if response.message.uppercased() == "SUCCESS" {
                    self.appDelegate.openMain()
                }
                else {
                    ///Add Alert View
                }
            }
        }
        
        
    }
    
    
    @IBAction func loginPressed(_ sender: Any) {
        loginAction()
    }
    
    @IBAction func signUpPressed(_ sender: Any) {
        let signUpViewController = SignUpPersonalViewController()
        self.navigationController?.pushViewController(signUpViewController, animated: true)
    }
}

