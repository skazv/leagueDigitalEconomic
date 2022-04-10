//
//  ProfileInteractor.swift
//  BlackListAndPorn
//
//  Created by Suren Kazaryan on 09.04.2022.
//

import Foundation

class ProfileInteractor: ProfileInteractorInputProtocol {
    var presenter: ProfileInteractorOutputProtocol?
    //var store = BlackListStore.shard
    var personItem: PersonModel?
    
    func deletePerson() {
        guard let personItem = personItem else { return }
       // store.removePerson(person: personItem)
        presenter?.didDeletePerson()
    }
    
    func editPerson(title: String, content: String) {
        guard let personItem = personItem else { return }
        personItem.name = title
        //personItem.imageUrl = content
        presenter?.didEditPerson(person: personItem)
    }
    
    
}
