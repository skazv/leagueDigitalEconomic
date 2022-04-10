//
//  AddCellInteractor.swift
//  BlackListAndPorn
//
//  Created by Suren Kazaryan on 10.04.2022.
//

import Foundation

class AddCellInteractor: AddCellInteractorInputProtocol {
    var presenter: AddCellInteractorOutputProtocol?
    
    func savePerson(name: String, section: Int) -> Person? {
        do {
            let person = try CoreDataManager.createPerson(name: name, section: section)
            return person
        } catch {
            return nil
        }
    }
    
}
