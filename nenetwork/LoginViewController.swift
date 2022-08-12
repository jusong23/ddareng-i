//
//  LoginViewController.swift
//  nenetwork
//
//  Created by 이주송 on 2022/08/12.
//

import UIKit
import GoogleSignIn

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    @IBAction func tapGoogleLoginButton(_ sender: Any) {
        let config = GIDConfiguration(clientID: "795344605481-eh9clt5aracqv6avsfmr3ca611nemc7k.apps.googleusercontent.com")
        var LOGINKEY:Int = 0

        GIDSignIn.sharedInstance.signIn(with: config, presenting: self) { user, error in
            if let error = error { return }
            guard let user = user else { return }
            var USER_TOKEN:String = user.userID ?? ""
            var USER_EMAIL:String = user.profile?.email ?? ""
            var USER_NAME:String = user.profile?.name ?? ""
            LOGINKEY = 1
            
            if LOGINKEY == 1 {
                
                guard let viewController = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as? ViewController else {return}
                self.navigationController?.pushViewController(viewController, animated: true)
                      LOGINKEY = 0
            }
        }
    }
    
}
