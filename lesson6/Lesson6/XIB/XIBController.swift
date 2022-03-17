//
//  XIBController.swift
//  Lesson6
//
//  Created by Suren Kazaryan on 07.03.2022.
//
// ВОПРОСЫ И ДОРАБОТКИ:
// 1) Переписать отделив вьюшку

import UIKit

class XIBController: UIViewController {
    
    let topView = TopView()
    private let customCellId = "XibCell"
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        topViewSetup()
        initXib()
    }
    
    @objc func imagePressed() {
        navigationController?.present(KrinjController(backgroundColor: 2), animated: true, completion: .none)
    }
    
    
}

// MARK: - Private functions
extension XIBController {
    private func topViewSetup() {
        
        navigationItem.leftBarButtonItems = [
            UIBarButtonItem(customView: topView.imageView),
            UIBarButtonItem(customView: topView.nameLabel)]
        let tap = UITapGestureRecognizer(target: self, action: #selector(imagePressed))
        topView.imageView.addGestureRecognizer(tap)
        
    }
    
    private func initXib() {
        guard let xibView = Bundle.main.loadNibNamed("XibTableView", owner: self, options: nil)![0] as? UIView
        else {
            print("Chikenmacnagets error")
            return
        }
        xibView.frame = view.bounds
        view.addSubview(xibView) //fuck
        tableView.delegate = self //vhjdghjdh
        tableView.dataSource = self
        tableView.register(UINib(nibName: customCellId, bundle: nil), forCellReuseIdentifier: customCellId)
        tableView.backgroundColor = .secondarySystemBackground
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorColor = .secondarySystemBackground
        tableView.separatorStyle = .none
    }
    
}

//MARK: - Protocols ChangeDestinationProtocol NEW
extension XIBController: ChangeDestinationProtocol {
    func changeDestinationTapped() {
        tabBarController?.selectedIndex = 3
    }
    
    func addToStack() {
        navigationController?.pushViewController(KrinjController(backgroundColor: 3), animated: true)
    }
    
}

//MARK: - Protocols UITableViewDelegate, UITableViewDataSource
extension XIBController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: customCellId, for: indexPath) as? XibCell
        else { return UITableViewCell() }
        let model = models[indexPath.row]
        cell.cellInit(price: model.price,
                      description: model.description,
                      sale: model.sale)
        cell.changDestination = self
        cell.selectionStyle = .none
        return cell
    }
}

