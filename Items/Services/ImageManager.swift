//
//  ImageManager.swift
//  Items
//
//  Created by Kamil Skrzyński on 16/05/2021.
//

import Foundation
import FirebaseStorage

let imageCache = NSCache<AnyObject, UIImage>()

final class ImageManager {
    
    static let instance = ImageManager()
    
    private var REF_STORAGE = Storage.storage()
    
    // MARK: Upload image
    func uploadCollectionImage(userID: String, collectionID: String, image: UIImage) {
        let path = getCollectionImagePath(userID: userID, collectionID: collectionID)
        
        uploadImage(path: path, image: image) { _ in }
    }
    
    func uploadItemImage(userID: String, itemID: String, image: UIImage) {
        let path = getItemImagePath(userID: userID, itemID: itemID)
        
        uploadImage(path: path, image: image) { _ in }
    }
    
    //MARK: Download image
    func downloadItemImage(userID: String, itemID: String, handler: @escaping (_ image: UIImage?) -> ()) {
        let path = getItemImagePath(userID: userID, itemID: itemID)
        
        downloadImage(path: path) { returnedImage in
            handler(returnedImage)
        }
    }
    // To-do
//    func deleteItemImage(userID: String, itemID: String, handler: @escaping (_ success: Bool) -> ()) {
//        let path = "items/\(userID)/\(itemID)"
//
//        REF_STORAGE.reference(withPath: path).delete { error in
//            if error != nil {
//                handler(false)
//                return
//            }
//            else {
//                handler(true)
//            }
//        }
//    }
    
    func downloadCollectionImage(userID: String, collectionID: String, handler: @escaping (_ image: UIImage?) -> ()) {
        let path = getCollectionImagePath(userID: userID, collectionID: collectionID)
        
        downloadImage(path: path) { returnedImage in
            handler(returnedImage)
        }
    }
    
    // MARK: Private functions
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
    
    private func downloadImage(path: StorageReference, handler: @escaping(_ image: UIImage?) -> ()) {
        
        if let cachedImage = imageCache.object(forKey: path) {
            handler(cachedImage)
            return
        }
        else {
            path.getData(maxSize: 27 * 1024 * 1024) { (returnedImageData, error) in
                
                if let data = returnedImageData, let image = UIImage(data: data) {
                    // Success getting image data
                    imageCache.setObject(image, forKey: path)
                    handler(image)
                    return
                }
                else {
                    print("Error getting data from path for image")
                    return
                }
            }
        }
    }
}
