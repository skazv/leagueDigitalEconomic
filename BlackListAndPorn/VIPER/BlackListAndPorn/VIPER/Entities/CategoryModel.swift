//
//  CategoryItem.swift
//  BlackListAndPorn
//
//  Created by Suren Kazaryan on 09.04.2022.
//

import Foundation

class CategoryModel {
    
    var name: String = "Noname"
    var persons: [PersonModel]?
    
    var imageUrl: String // DELETE
    
    init(name: String, imageUrl: String) {
        self.name = name
        self.imageUrl = imageUrl
    }
    
}

class PersonModel {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}
