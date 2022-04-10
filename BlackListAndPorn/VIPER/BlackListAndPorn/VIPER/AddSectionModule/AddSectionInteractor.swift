//
//  3.swift
//  BlackListAndPorn
//
//  Created by Suren Kazaryan on 09.04.2022.
//

import Foundation

class AddSectionInteractor: AddSectionInteractorInputProtocol {
    var presenter: AddSectionInteractorOutputProtocol?
    var coreData = CoreDataManager.shared //???
    
    func saveCategory(name: String) -> Category? {
        do {
            let category = try CoreDataManager.createCategory(name: name)
            return category
        } catch {
            return nil
        }
    }
    
    
}

