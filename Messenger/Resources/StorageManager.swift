//
//  StorageManager.swift
//  Messenger
//
//  Created by Phillip Cabaniss on 6/15/20.
//  Copyright © 2020 Phillip Cabaniss. All rights reserved.
//

import Foundation
import FirebaseStorage

final class StorageManager {
    static let shared = StorageManager()
    
    private let storage = Storage.storage().reference()
    
    /*
     /images/url for picture
     **/
    
    public typealias UploadPictureCompletion = (Result<String, Error>) -> Void
    
    /// Uploads picture to Firebase storage and returns completion with url string to download
    public func uploadProfilePicture(with data: Data,fileName: String, completion: @escaping UploadPictureCompletion) {
        storage.child("images/\(fileName)").putData(data, metadata: nil, completion: { metadata, error in
            guard error == nil else {
                //failed
                print("Failed to upload photo to firebase database")
                completion(.failure(storageErrors.failedToUpload))
                return
            }
            
            self.storage.child("images/\(fileName)").downloadURL(completion: { url, error in
                guard let url = url else {
                    print("Failed to get download URL")
                    completion(.failure(storageErrors.failedToGetDownloadURL))
                    return
                }
                
                let urlString = url.absoluteString
                print("Downloaded url returned: \(urlString)")
                completion(.success(urlString))
                
            })
            
        })
        
    }
    
    public enum storageErrors: Error {
        case failedToUpload
        case failedToGetDownloadURL
        
    }
    
}
