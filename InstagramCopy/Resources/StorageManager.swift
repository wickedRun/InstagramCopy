//
//  StorageManager.swift
//  InstagramCopy
//
//  Created by wickedRun on 2022/03/02.
//

import FirebaseStorage

public class StorageManager {
    
    static let shared = StorageManager()
    	
    private let bucket = Storage.storage().reference()
    
    public enum IGStorageManagerError: Error {
        case failedToDownload
    }
    
    // MARK: - Public
    
    public func uploadUserPost(model: UserPost, completion: (Result<URL, Error>) -> Void) {
        
    }
    
    public func downloadImage(with reference: String, completion: @escaping (Result<URL, Error>) -> Void) {
        bucket.child(reference).downloadURL { url, error in
            guard let url = url, error == nil else {
                completion(.failure(IGStorageManagerError.failedToDownload))
                return
            }
            
            completion(.success(url))
        }
    }
    
}
