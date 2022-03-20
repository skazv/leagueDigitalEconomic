//
//  ViewController.swift
//  UIKitExamples
//
//  Created by Александров Роман Витальевич on 23.02.2022.
//

import UIKit

class ViewController: UIViewController {
    
    var models = [
        Songs(isOpened: true, cells: [CustomCellModel(title: "Yamakasi\nMiyagi&AndyPanda", imageString: "Yamakasi", rating: 5),
                                      CustomCellModel(title: "Umshakalaka\nMiyagi&AndyPanda", imageString: "Umshakalaka", rating: 3),
                                      CustomCellModel(title: "Hajime pt 3\nMiyagi&Эндшпиль", imageString: "Hajime", rating: 4)]),
        Songs(isOpened: true, cells: [CustomCellModel(title: "GameOfThrones\nRamin Djawadi", imageString: "GameOfThrones", rating: 3),
                                      CustomCellModel(title: "WestWord\nRamin Djawadi", imageString: "WestWord", rating: 4),
                                      CustomCellModel(title: "Dark Knight\nHans Zimmer", imageString: "DarkKnight", rating: 5)]),
        Songs(isOpened: true, cells: [CustomCellModel(title: "Подруга\nСкриптонит", imageString: "Scryp", rating: 4),
                                      CustomCellModel(title: "3 на 3\nСкриптонит", imageString: "Scryp2", rating: 3),
                                      CustomCellModel(title: "Положение\nСкриптонит", imageString: "Scryp3", rating: 5)])
    ]
    
    private let customCellId = "customCellId"

    
    private lazy var tableView: UITableView = {
        let tv = UITableView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.delegate = self
        tv.dataSource = self
        tv.estimatedRowHeight = 50
        tv.rowHeight = UITableView.automaticDimension
        tv.register(CustomCell.self, forCellReuseIdentifier: customCellId)
        return tv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}

// MARK: - UITableViewDataSource & UITableViewDelegate
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: customCellId,
            for: indexPath
        ) as? CustomCell else { return UITableViewCell() }
        let model = models[indexPath.section].cells[indexPath.row]
        cell.configureCell(title: model.title, imageString: model.imageString, rating: model.rating)
        return cell
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let topView = TopView()
        var indexPaths = [IndexPath]()
        
        topView.titleLabel.text = Genre[section]
        
        topView.callback = { [weak self] in
            for row in self!.models[section].cells.indices {
                let indexPath = IndexPath(row: row, section: section)
                indexPaths.append(indexPath)
            }
            
            let isOpened = self!.models[section].isOpened
            self!.models[section].isOpened = !isOpened
            
            topView.openCloseButton.setTitle(isOpened ? "Open" : "Close", for: .normal)
            
            if isOpened {
                self?.tableView.deleteRows(at: indexPaths, with: .left)
            } else {
                tableView.insertRows(at: indexPaths, with: .left)
            }
        }
        return topView
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        if !models[section].isOpened {
            return 0
        }
        return models[section].cells.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        models.count
    }
}
