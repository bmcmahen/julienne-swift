//
//  RecipeStore.swift
//  julienne
//
//  Created by Ben McMahen on 2019-06-28.
//  Copyright © 2019 Ben McMahen. All rights reserved.
//

import SwiftUI
import Combine
import Firebase

struct Ingredient {
    var amount: String
    var name: String
    
    init(amount: String, name: String) {
        self.amount = amount
        self.name = name
    }
}

struct Recipe : Identifiable {
    var id: String
    var author: String
    var title: String
    var image: String?
    

    static let `default` = Self(
        id: "sdfdsaf",
        author: "Ben McMahen",
        title: "Spaghetti Puttanesca"
    )
    
    init(id: String, author: String, title: String, image: String? = nil) {
        self.id = id
        self.author = author
        self.title = title
        self.image = image
    }
}

class RecipeStore : BindableObject {
    var db = Firestore.firestore()
    var didChange = PassthroughSubject<RecipeStore, Never>()
    var recipes: [Recipe] = [] {
        didSet { self.didChange.send(self) }
    }
    
    init(recipes: [Recipe] = []) {
        self.recipes = recipes
    }
    
    func fetch (userId: String) {
        db.collection("recipes")
            .whereField("userId", isEqualTo: userId)
            .order(by: "updatedAt", descending: true)
            .getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting docs: \(err)")
                } else {
                    for document in querySnapshot!.documents {
                        print("\(document.documentID) => \(document.data())")
                        let d = document.data()
                        
                        
                        guard let author = d["author"] as? String else {
                            print("no author")
                            return
                            
                        }
                        guard let title = d["title"] as? String else {
                            print("error titlte")
                            return
                        }

                        guard let image = d["image"] as? String else {
                            print("error photo URL")
                            return
                        }
                        
                        let recipe = Recipe(
                            id: document.documentID,
                            author: author,
                            title: title,
                            image: image
                        )
                        
                        print("add recipe \(recipe)")
                        
                        self.recipes.append(recipe)
                    }
                }
        }
    }
}
