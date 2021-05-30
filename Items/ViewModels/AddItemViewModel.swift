//
//  AddItemViewModel.swift
//  Items
//
//  Created by Kamil Skrzyński on 03/05/2021.
//

import Foundation
import SwiftUI

final class AddItemViewModel: ObservableObject {
    
    @AppStorage("userID") private var userID = ""
    
    let title = "New Item"
    let subtitle = "Create new item you want to track"
    
    let buttonTitle = "Create"
    let buttonImageName = "plus.square.fill"
    
    let namePlaceholer = "name"
    let storePlaceholer = "store"
    let tagPlaceholer = "tag"
    let collectionPlaceholder = "collection"
    
    let imagePlaceholderImageName = "photo.fill"
    
    let nameImageName = "square.and.pencil"
    let tagImageName = "tag.fill"
    let collectionImageName = "doc.fill"
    let closeButtonImageName = "xmark"
    
    @State var imageSelected: UIImage = UIImage(named: "Placeholder")!
    @State var showImagePicker: Bool = false
    @State var showCollections = false
    @State var showAlert = false
    
    @Published var name = ""
    @Published var tag = ""
    @Published var collection = "collection"
    @Published var collectionNames = [String]()
    
    @State var alertTitle = "Added!"
    @State var alertMessage = "Item successfully added"
    @State var alertButtonText = "OK"
    
    init() {
        DataService.instance.downloadCollectionNames(userID: userID) { returnedNames in
            self.collectionNames.append(contentsOf: returnedNames)
            print(self.collectionNames)
        }
    }
    
    
    func check() -> Bool {
        if !name.isEmpty, !tag.isEmpty, !collection.isEmpty {
            return true
        }
        else {
            return false
        }
    }
}
