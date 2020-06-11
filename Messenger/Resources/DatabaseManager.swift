//
//  DatabaseManager.swift
//  Messenger
//
//  Created by Phillip Cabaniss on 6/11/20.
//  Copyright © 2020 Phillip Cabaniss. All rights reserved.
//

import Foundation
import FirebaseDatabase

final class DatabaseManager {
    
    static let shared = DatabaseManager()
    
    private let database = Database.database().reference()
    


    
}

// MARK: - Account Management

extension DatabaseManager {
    
    public func userExsist(with email: String, completion: @escaping ((Bool) -> Void)) {
        
        database.child(email).observeSingleEvent(of: .value, with: { snapshot in
            guard snapshot.value as? String != nil else {
                completion(false)
                return
            }
            completion(true)
            
        })
        
        
    }
    
    
    /// Insert new user to database
    public func insertUser(with user: ChatAppUser) {
        
        database.child(user.emailAddress).setValue([
            "first_name": user.firstName,
            "last_name": user.lastName
            
        ])
        
    }
    
}

struct ChatAppUser {
    let firstName: String
    let lastName: String
    let emailAddress: String
    //omit saving password, its not good practice if its not encrypted
    //let prifilePictureUrl: String
}
