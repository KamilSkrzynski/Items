//
//  ImageManager.swift
//  Items
//
//  Created by Kamil Skrzyński on 16/05/2021.
//

import Foundation
import FirebaseStorage

final class ImageManager {
    
    static let instance = ImageManager()
    
    private var REF_STORAGE = Storage.storage()
    
    func uploadCollectionImage(userID: String, collectionID: String, image: UIImage) {
        let path = getCollectionImagePath(userID: userID, collectionID: collectionID)
        
        uploadImage(path: path, image: image) { _ in }
    }
    
    private func getCollectionImagePath(userID: String, collectionID: String) -> StorageReference {
        
        let collectionPath = "collections/\(userID)/\(collectionID)"
        let storagePath = REF_STORAGE.reference(withPath: collectionPath)
        return storagePath
    }
    
    private func getItemImagePath(userID: String, itemID: String) -> StorageReference {
        
        let itemPath = "items/\(userID)/\(itemID)"
        let storagePath = REF_STORAGE.reference(withPath: itemPath)
        return storagePath
    }
    
    private func uploadImage(path: StorageReference, image: UIImage, handler: @escaping (_ success: Bool) -> ()) {
        
        var compression: CGFloat = 1.0 // Loops down by 0.05
        let maxFileSize: Int = 240 * 240 // Maximum file size that we want to save
        let maxCompression: CGFloat = 0.05 // Maximum compression we allow
        
        //Get image data
        guard var originalData = image.jpegData(compressionQuality: compression) else {
            print("Error getting data from image")
            handler(false)
            return
        }
        
        //Check maximum file size
        while (originalData.count > maxFileSize) && (compression > maxCompression) {
            compression -= 0.05
            if let compressedData = image.jpegData(compressionQuality: compression) {
                originalData = compressedData
            }
            print(compression)
        }
        
        //Get image data
        guard let finalData = image.jpegData(compressionQuality: compression) else {
            print("Error getting data from image")
            handler(false)
            return
        }
        
        // Get photo metadata
        let metadata = StorageMetadata()
        metadata.contentType = "image/jpeg"
        
        //Save data to path
        path.putData(finalData, metadata: metadata) { (_, error) in
            
            if let error = error {
                // Failure
                print("Error uploading image: \(error)")
                handler(false)
                return
            }
            else {
                // Success
                print("Success uploading image")
                handler(true)
                return
            }
        }
    }
}
