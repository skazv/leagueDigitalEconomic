//
//  ProfileIteractorProtocol.swift
//  BlackListAndPorn
//
//  Created by Suren Kazaryan on 09.04.2022.
//

import Foundation

protocol ProfileInteractorInputProtocol: AnyObject {
    
    var presenter: ProfileInteractorOutputProtocol? { get set }
    var personItem: PersonModel? { get set }
    
    // PRESENTER -> INTERACTOR
    func deletePerson()
    func editPerson(title: String, content: String)
}

protocol ProfileInteractorOutputProtocol: AnyObject {
    
    // INTERACTOR -> PRESENTER
    func didDeletePerson()
    func didEditPerson(person: PersonModel)
}
