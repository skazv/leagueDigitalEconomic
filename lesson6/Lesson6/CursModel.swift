//
//  CursModel.swift
//  Lesson6
//
//  Created by Suren Kazaryan on 11.03.2022.
//
// ВОПРОСЫ И ДОРАБОТКИ:
// 1) Стоит ли использовать глобальные переменные?

import Foundation

struct CursModel {
    let price: String
    let description: String
    let sale: String
    
    init(price: String, description: String, sale: String) {
        self.price = price
        self.description = description
        self.sale = sale
    }
}

let models: [CursModel] = [
    CursModel(price: "7840 ₽", description: "Backend разработка", sale: "Первые три занятия бесплатно"),
    CursModel(price: "9800 ₽", description: "Курсы по Android разработке", sale: "1.02.2022 - 1.04.2022 Скидка 10%"),
    CursModel(price: "11760 ₽", description: "Курсы по iOS разработке + Computer Science + Computer Vision + System Design", sale: ""),]
