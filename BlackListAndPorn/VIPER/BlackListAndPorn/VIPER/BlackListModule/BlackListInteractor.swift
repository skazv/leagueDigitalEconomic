//
//  Iteractor.swift
//  BlackListAndPorn
//
//  Created by Suren Kazaryan on 09.04.2022.
//

import Foundation

class BlackListInteractor: BlackListInteractorInputProtocol {
    var presenter: BlackListInteractorOutputProtocol?
    var coreData: CoreDataManager?
    
    func fetchCategories() {
        do {
            let categories = try CoreDataManager.fetchCategories()
            presenter?.didFetchCategories(categories: categories)
        } catch {
            presenter?.didFetchCategories(categories: [])
        }
    }
    
    func deleteCategory(section: Int) {
        CoreDataManager.deleteCategory(section: section)
        presenter?.didDeleteCategory(section: section)
    }
    
    func deletePerson(with indexPath: IndexPath) {
        CoreDataManager.deletePerson(indexPath: indexPath)
        presenter?.didDeletePerson(with: indexPath)
    }
    
    func movePerson(sourceIndexPath: IndexPath, destinationIndexPath: IndexPath) {
        CoreDataManager.movePerson(sourceIndexPath: sourceIndexPath, destinationIndexPath: destinationIndexPath)
        presenter?.didMovePerson(sourceIndexPath: sourceIndexPath, destinationIndexPath: destinationIndexPath)
    }
    
}
