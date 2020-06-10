//
//  ViewController.swift
//  Messenger
//
//  Created by Phillip Cabaniss on 6/9/20.
//  Copyright © 2020 Phillip Cabaniss. All rights reserved.
//

import UIKit

class ConversationsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .red

    }

    override func viewDidAppear( _ animated: Bool) {
        super.viewDidAppear(animated)
        
        let isLoggedIn = UserDefaults.standard.bool(forKey:"Logged in")
        
        if !isLoggedIn {
            
            let vc = LoginViewController()
            let nav = UINavigationController(rootViewController: vc)
            nav.modalPresentationStyle = .fullScreen
            present(nav, animated: false)
            
            
            
        }
    }

}

