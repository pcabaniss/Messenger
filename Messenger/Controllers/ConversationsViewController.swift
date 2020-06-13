//
//  ViewController.swift
//  Messenger
//
//  Created by Phillip Cabaniss on 6/9/20.
//  Copyright © 2020 Phillip Cabaniss. All rights reserved.
//

import UIKit
import FirebaseAuth

class ConversationsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()


    }

    override func viewDidAppear( _ animated: Bool) {
        super.viewDidAppear(animated)
        validateAuth()
       
    }

    private func validateAuth() {
        
        if FirebaseAuth.Auth.auth().currentUser == nil {
            let vc = LoginViewController()
            let nav = UINavigationController(rootViewController: vc)
            nav.modalPresentationStyle = .fullScreen
            present(nav, animated: true)
        }
        
    }
    
    
}

