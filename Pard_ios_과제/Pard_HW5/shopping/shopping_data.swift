//
//  shopping_data.swift
//  Pard_ios
//
//  Created by 박성준 on 10/31/25.
//

import Foundation
import SwiftUI

struct itemData: Identifiable {
    let id = UUID()
    var image: String
    var name: String
    var discount: Int
    var price: Int
    var point: Int
    var ps: String
    var category: String
}

extension itemData { //상품 데이터
    static let shoppings: [itemData] = [
        itemData(image: "맥북", name: "새로 출시간 맥북 프로 M5 14inch",discount: 2800000, price: 3000000, point: 8450, ps: "55.8만명이 구경함·무료배송", category: "전자제품"),
        itemData(image: "귤", name: "[단독구매불가] 압도적 당도 제주 감귤",discount: 23000, price: 28000, point: 1420, ps: "2.1만명이 구경함·오늘출발", category: "식품"),
        itemData(image: "라로슈", name: "라로슈포제 시카플라스트 밤 B5+ 40ml",discount: 14500, price: 18000, point: 320, ps: "4.7만명이 구경함·무료배송", category: "뷰티"),
        itemData(image: "샤인", name: "샤인머스켓 대형 2kg 프리미엄 청포도",discount: 38000, price: 49000, point: 2800, ps: "1.9만명이 구경함·당일수확", category: "식품"),
        itemData(image: "립밤", name: "버츠비 비즈왁스 립밤 오리지널 4.25g",discount: 5200, price: 6800, point: 210, ps: "3.5만명이 구경함·무료배송", category: "뷰티"),
        itemData(image: "아이패드", name: "아이패드 에어 M2 11형 Wi-Fi 256GB",discount: 1200000, price: 1350000, point: 9700, ps: "12.2만명이 구경함·빠른배송", category: "전자제품"),
        itemData(image: "참", name: "판도라 팔찌 강아지 참",discount: 20800, price: 29800, point: 540, ps: "8.4만명이 구경함·무료배송", category: "악세사리"),
        itemData(image: "에어", name: "아이폰 에어 세상에서 제일 가벼운 아이폰",discount: 1750000, price: 1900000, point: 8800, ps: "32.6만명이 구경함·무료배송", category: "전자제품"),
        itemData(image: "귀걸이", name: "14K 골드 큐빅 드롭 귀걸이",discount: 198000, price: 235000, point: 6120, ps: "5.3만명이 구경함·오늘출발", category: "악세사리"),
        itemData(image: "생수", name: "동원생수 500ml 24병",discount: 10800, price: 13500, point: 430, ps: "7.7만명이 구경함·무료배송", category: "식품")
    ]
}
