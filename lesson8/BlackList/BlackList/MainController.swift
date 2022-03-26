//
//  ViewController.swift
//  BlackList
//
//  Created by Suren Kazaryan on 21.03.2022.
//

import UIKit

class ViewController: UIViewController {
    
    var exGfNames = [["Катя", "Таня", "Вика", "Эля"], ["Света", "Настя", "Элвира"], ["Жанна", "Боня", "Саша"], ["Кристина", "Тая", "Сая"]]
    let addViewController = AddViewController()
    
    lazy var tableView: UITableView = {
        let tv = UITableView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.backgroundColor = .systemCyan
        tv.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tv.delegate = self
        tv.dataSource = self
        return tv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Black List"
        let editButton = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(editTapped))
        navigationItem.rightBarButtonItem = editButton
        navigationItem.leftBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
        setup()
    }
    
    @objc func editTapped() {
        tableView.isEditing = !tableView.isEditing
    }
    
    @objc func addTapped() {
        addViewController.callback = { [weak self] name, selectedRow in
            self?.exGfNames[selectedRow].insert(name, at: 0)
            self?.tableView.insertRows(at: [IndexPath(row: 0, section: selectedRow)], with: .top)
        }
        navigationController?.present(addViewController, animated: true, completion: .none)
    }


}

//MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.backgroundColor = .systemBrown
        cell.textLabel?.text = exGfNames[indexPath.section][indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        exGfNames[section].count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return BlackList()[section]
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return exGfNames.count
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            exGfNames[indexPath.section].remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .left)
        }
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let item = exGfNames[sourceIndexPath.section][sourceIndexPath.row]
        exGfNames[sourceIndexPath.section].remove(at: sourceIndexPath.row)
        exGfNames[destinationIndexPath.section].insert(item, at: destinationIndexPath.row)
    }
    
}

//MARK: - UITableViewDelegate
extension ViewController: UITableViewDelegate {
}

//MARK: - Private methods
extension ViewController {
    private func setup() {
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}
