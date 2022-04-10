//
//  BlackListController.swift
//  BlackListAndPorn
//
//  Created by Suren Kazaryan on 23.03.2022.
//

import Foundation
import UIKit

class BlackListController: UIViewController {
    let tableView = TableView()
    let customCellId = "custumCell"
    let userService = UserService()
    let pornService = PornService()
    
    override func loadView() {
        view = tableView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Black List"
        setup()
        CoreData.fetchAllCategories()
        CoreData.updateModelWithPersons()
        
    }
}

//MARK: - Private methods
extension BlackListController {
    private func setup() {
        view.backgroundColor = .secondarySystemBackground
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addHeaderTapped))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Bitch Mode", style: .done, target: self, action: #selector(editTapped))

        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CustomCell.self, forCellReuseIdentifier: customCellId)
        tableView.dragDelegate = self
        tableView.dropDelegate = self
        
    }
    
    @objc private func addHeaderTapped() {
        let addSectionController = AddSettingHeaderController(titleHeader: "Add Section")
        
        addSectionController.addHeaderCallback = { [weak self] name in
            self?.tableView.beginUpdates()
            Category.createCategory(name: name)
            self?.tableView.insertSections(IndexSet(integer: CoreData.shared.categoryArray.count - 1), with: .fade)
            self?.tableView.endUpdates()
            self?.tableView.reloadData()
        }
        navigationController?.present(addSectionController, animated: true, completion: .none)
    }
    
    @objc private func editTapped() {
        
        for category in CoreData.shared.categoryArray {
            guard let persons = category.personsArray else { return }
            for person in persons {
                pornService.fetchChihua { imageUrl in
                    Person.updatePersonUrl(person: person, imageUrl: imageUrl ?? "")
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                }
            }
        }
    }
    
}

// MARK: - Protocols UITableViewDataSource
extension BlackListController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let sectionHeaderView = CustomSection()
        let addCellSettings = AddSettingCellController(titleHeader: "Add Enemy")
        sectionHeaderView.titleLabel.text = CoreData.shared.categoryArray[section].name
        
        sectionHeaderView.openAddCellSetting = { [weak self] in
            self?.navigationController?.present(addCellSettings, animated: true, completion: .none)
        }
        
        addCellSettings.addCellCallback = { [weak self] name in
            var newName = ""
            var newImage = ""
            self?.userService.fetchWoman { result in
                switch result {
                case .success(let userRawArr):
                    newName = "\(userRawArr[0].name.first) \(userRawArr[0].name.last)"
                    newImage = userRawArr[0].picture.large
                case .failure(let error):
                    print(error)
                    newName = name
                }
                DispatchQueue.main.async {
                    if name != "" && name != "Unnamed" {
                        newName = name
                    }
                    self?.tableView.beginUpdates()
                    if (CoreData.shared.categoryArray[section].personsArray == nil) {
                        let category = CoreData.shared.categoryArray[section]
                        category.personsArray = [Person.createPerson(name: newName, category: category, imageUrl: newImage)]
                    } else {
                        let category = CoreData.shared.categoryArray[section]
                        category.personsArray?.append(Person.createPerson(name: newName, category: category, imageUrl: newImage))
                    }
                    self?.tableView.insertRows(at: [IndexPath(item: 0, section: section)], with: .fade)
                    self?.tableView.endUpdates()
                    self?.tableView.reloadData()
                }
            }
        }
        
        sectionHeaderView.deleteSection = { [weak self] in
            self?.tableView.beginUpdates()
            Category.deleteCategory(section: section)
            self?.tableView.deleteSections(IndexSet(integer: section), with: .left)
            self?.tableView.endUpdates()
            self?.tableView.reloadData()
        }
        
        sectionHeaderView.moveSection = { [weak self] in
            if (section + 1 < CoreData.shared.categoryArray.count) {
                self?.tableView.beginUpdates()
                Category.moveCategory(section: section)
                self?.tableView.moveSection(section, toSection: section + 1)
                self?.tableView.endUpdates()
                self?.tableView.reloadData()
            }
        }
        
        sectionHeaderView.changeSectionTitle = { [weak self] in
            let changeSectionTitleController = AddSettingHeaderController(titleHeader: "ChangeTitle")
            self?.navigationController?.present(changeSectionTitleController, animated: true, completion: .none)
            
            changeSectionTitleController.addHeaderCallback = { name in
                sectionHeaderView.titleLabel.text = name
                CoreData.shared.categoryArray[section].name = name
            }
        }
        
        //        sectionHeaderView.openCloseSection = { [weak self] in
        //            guard let isOpened = self?.categoryArray[section].isOpened else { return }
        //            self?.categoryArray[section].isOpened = !isOpened
        //            sectionHeaderView.openCloseButton.setTitle(isOpened ? "Open" : "Close", for: .normal)
        //            let count = self?.categoryArray[section].personsArray?.count ?? 0
        //            var indexPath: IndexPath
        //            var indexPaths = [IndexPath()]
        //            for key in 0..<count {
        //                indexPath = IndexPath(row: key, section: section)
        //                indexPaths.append(indexPath)
        //            }
        //            indexPaths.remove(at: 0)
        //            if isOpened {
        //                self?.tableView.deleteRows(at: indexPaths, with: .left)
        //            } else {
        //                self?.tableView.insertRows(at: indexPaths, with: .right)
        //            }
        //        }
        
        return sectionHeaderView
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        CoreData.shared.categoryArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if CoreData.shared.categoryArray[section].isOpened == true {
            guard let numberRow = CoreData.shared.categoryArray[section].personsArray?.count else { return 0 }
            return numberRow
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: customCellId, for: indexPath) as? CustomCell
        else { return UITableViewCell() }
        guard let model = CoreData.shared.categoryArray[indexPath.section].personsArray?[indexPath.row] else { return CustomCell() }
        let imageLoader = ImageLoader()
        
        if let imageUrl = model.imageUrl {
            if let url = URL(string: imageUrl) {
                imageLoader.loadImage(by: url, completion: { newImage in
                    if let image = newImage {
                        cell.cellInit(name: model.name ?? "Empty", image: image)
                    } else {
                        cell.cellInit(name: model.name ?? "Empty", image: .actions)
                    }
                })
            } else {
                cell.cellInit(name: model.name ?? "Empty", image: .actions)
            }
        } else {
            cell.cellInit(name: model.name ?? "Empty", image: .actions)
        }
        
        
        cell.selectionStyle = .none
        cell.infoCallback = { [weak self] in
            self?.navigationController?.pushViewController(InfoViewController(title: model.name ?? "Empty", image: cell.avatarImageView.image ?? .actions ), animated: true)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            Person.deletePerson(section: indexPath.section, row: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .left)
        }
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        Person.movePerson(sourceIndexPath: sourceIndexPath, destinationIndexPath: destinationIndexPath)
    }
    
}

//MARK: - UITableViewDelegate
extension BlackListController: UITableViewDelegate {
}


//MARK: - UITableViewDragDelegate
extension  BlackListController: UITableViewDragDelegate {
    func tableView(_ tableView: UITableView, itemsForBeginning session: UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {
        return [UIDragItem(itemProvider: NSItemProvider())]
    }
}


//MARK: - UITableViewDropDelegate
extension  BlackListController: UITableViewDropDelegate {
    func tableView(_ tableView: UITableView, dropSessionDidUpdate session: UIDropSession, withDestinationIndexPath destinationIndexPath: IndexPath?) -> UITableViewDropProposal {
        if session.localDragSession != nil {
            return UITableViewDropProposal(operation: .move, intent: .insertAtDestinationIndexPath)
        }
        
        return UITableViewDropProposal(operation: .cancel, intent: .unspecified)
    }
    
    func tableView(_ tableView: UITableView, performDropWith coordinator: UITableViewDropCoordinator) {
    }
    
}
