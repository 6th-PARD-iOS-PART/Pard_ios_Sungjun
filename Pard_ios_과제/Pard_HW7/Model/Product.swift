//
//  Product.swift
//  Pard_ios
//
//  Created by 박성준 on 11/16/25.
//

struct Product: Codable, Identifiable, Hashable {
    var id: Int?              
    let name: String
    let price: Int
    let count: Int
    let color: String
    let sellable: Bool
    
 
    var isInStock: Bool { count > 0 && sellable }
}
