//
//  XibCell.swift
//  Lesson6
//
//  Created by Suren Kazaryan on 15.03.2022.
//

import UIKit

class XibCell: UITableViewCell {
    var changDestination: ChangeDestinationProtocol?

    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var saleLabel: UILabel!
    @IBOutlet weak var descriptionaLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    func cellInit(price: String, description: String, sale: String) {
        priceLabel.text = price
        descriptionaLabel.text = description
        saleLabel.text = sale
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func tapped(_ sender: UIButton) {
        changDestination?.changeDestinationTapped()
    }
    
    @IBAction func moreTapped(_ sender: Any) {
        changDestination?.addToStack()
    }
    
}

//MARK: - Private functions
extension XibCell {
    private func setup() {
        cardView.layer.cornerRadius = 12
        saleLabel.layer.borderWidth = 1
        saleLabel.layer.cornerRadius = 10
        saleLabel.layer.borderColor = UIColor.lightGray.cgColor
    }
}
