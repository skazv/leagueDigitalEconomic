//
//  TableViewController.swift
//  BlackListAndPorn
//
//  Created by Suren Kazaryan on 31.03.2022.
//

import UIKit

class TableView: UITableView {

    init() {
        super.init(frame: .zero, style: .plain)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

//MARK: Private methods
extension TableView {
    private func setup() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .secondarySystemBackground
        // tv.estimatedRowHeight = 1000
        self.rowHeight = UITableView.automaticDimension
        self.separatorColor = .secondarySystemBackground
        self.separatorStyle = .none
        self.dragInteractionEnabled = true
    }
}

