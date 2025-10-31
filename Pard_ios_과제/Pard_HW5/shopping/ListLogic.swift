//
//  ListLogic.swift
//  Pard_ios
//
//  Created by 박성준 on 10/31/25.
//

import Foundation

class ShoppingViewModel: ObservableObject {
    @Published var selectedCategory: String = "모두"
    
    let allItems = itemData.shoppings
    
    var filteredItems: [itemData] {
        if selectedCategory == "모두" { // 모두 메뉴에서
            return allItems
        } else if selectedCategory == "특가" { // 특가 메뉴에서 특정 할인율이 넘으면 리스트에 뜨게함
            return allItems.filter { item in
                let discountRate = (Double(item.price - item.discount) / Double(item.price)) * 100
                return discountRate >= 20 //20% 이상 할인시 특가에 들어가기 가능
            }
        } else {
            return allItems.filter { $0.category == selectedCategory } // 카테고리에 맞게 아이템 보여줌
        }
    }
}
