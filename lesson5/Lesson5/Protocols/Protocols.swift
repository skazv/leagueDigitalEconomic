//
//  Protocols.swift
//  Lesson5
//
//  Created by Suren Kazaryan on 06.03.2022.
//

import Foundation
import UIKit


protocol ValidationProtocol {
    func validation(label: UILabel, field: UITextField, regEx: String)
}

extension ValidationProtocol {
    
     func validation(label: UILabel, field: UITextField, regEx: String) {

            let predicate = NSPredicate(format: "SELF MATCHES[c] %@", regEx)
            let isValid = predicate.evaluate(with: field.text)
            label.text = isValid ? "Валидация прошла успешно" : "Ошибка (Тупишь как моя бывшая)"
            label.textColor = isValid ? .systemGreen : .systemRed

    }

}
