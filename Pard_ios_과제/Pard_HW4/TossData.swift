//
//  TossData.swift
//  toss clone coding
//
//  Created by 박성준 on 10/7/25.
//

import Foundation
import SwiftUI

struct accountData: Identifiable {
    let id = UUID()
    var icon: String
    var amount: Int
    var name: String
    var num: String
}

extension accountData { // 홈화면 계좌별 데이터
    static let accounts: [accountData] = [
        accountData(icon: "woori",amount: 339690, name: "하나은행통장", num: "하나은행 157-891652-62107"),
        accountData(icon: "toss",amount: 38841, name: "토스뱅크통장", num: "토스뱅크 345-3531-457113"),
        accountData(icon: "lightning",amount: 114, name: "토스뱅크에 쌓인 이자", num: "2346-34576-2345"),
        accountData(icon: "kbank",amount: 650, name: "MY입출금통장", num: "케이뱅크 2345-34672-23474"),
        accountData(icon: "kb",amount: 2090, name: "KB나라사랑우대통장", num: "KB국민은행 734-324773-4522456"),
        accountData(icon: "ibk",amount: 29, name: "보통예금(IBK나라사랑통장)", num: "IBK기업은행 7378-34573-89345"),
        accountData(icon: "global",amount: 118, name: "토스뱅크외화통장 · 2개", num: "토스뱅크(외) 34-32456-23457"),
        accountData(icon: "kakao",amount: 0, name: "입출금통장", num: "카카오뱅크 7343-34573-345732"),
        accountData(icon: "ibk",amount: 1051, name: "보통예금(IBK주거래생활금융통장)", num: "IBK기업은행893-384214-37845"),
        accountData(icon: "coin",amount: 15257990, name: "투자 모아보기 · 15개", num: "4892-347-234889")
    ]
}

struct interationData: Identifiable {
    let id = UUID()
    var logo: String
    var store: String
    var time: String
    var change: Int
    var balance: Int
}
extension interationData{ // 거래 내역 데이터
    static let interations: [interationData] = [
        interationData(logo: "taxi", store: "카카오 택시_0", time: "11:13", change: 6200, balance: 38841),
        interationData(logo: "taxi", store: "카카오 택시 선승인", time: "11:00",change: 6900, balance: 45041),
        interationData(logo: "taxi", store: "카카오 택시 선승인", time: "11:00",change: 6900, balance: 38141),
        interationData(logo: "flex", store: "플렉스PC방", time: "22:44",change: 5500, balance: 45041),
        interationData(logo: "flex", store: "플렉스PC방", time: "21:35",change: 5000, balance: 50541),
        interationData(logo: "cu", store: "씨유한동대오석관점", time: "16:17",change: 2000, balance: 55541),
        interationData(logo: "cu", store: "씨유한동대오석관점", time: "15:59",change: 4400, balance: 57541),
        interationData(logo: "taxi", store: "카카오 택시 _0", time: "10:00",change: 7000, balance: 61941),
        interationData(logo: "taxi", store: "카카오 택시 선승인", time: "09:47",change: 7300, balance: 68941),
        interationData(logo: "taxi", store: "카카오 택시 선승인", time: "09:47",change: 7300, balance: 61641),
        interationData(logo: "taxi", store: "카카오 택시 선승인", time: "09:46",change: 7300, balance: 68941),
        interationData(logo: "taxi", store: "카카오 택시 선승인", time: "09:46",change: 7300, balance: 61641)
    ]
}

struct recentData: Identifiable { // 최근 거래 계좌 데이터
    let id = UUID()
    var logo: String
    var who: String
    var num: String
}
extension recentData{
    static let recent: [recentData] = [
        recentData(logo: "woori", who: "하나은행통장", num: "하나은행 157-891652-62107"),
        recentData(logo: "toss", who: "토스뱅크통장", num: "토스뱅크 345-3531-457113"),
        recentData(logo: "kb", who: "박영언", num: "KB국민은행 734-324773-4522456"),
        recentData(logo: "kakao", who: "손채원", num: "카카오뱅크 7343-34573-345732"),
        recentData(logo: "ibk", who: "박진수", num: "IBK기업은행 7378-34573-89345"),
        recentData(logo: "kb", who: "박영언", num: "KB국민은행 734-324773-4522456"),
        recentData(logo: "kakao", who: "손채원", num: "카카오뱅크 7343-34573-345732"),
        recentData(logo: "ibk", who: "박진수", num: "IBK기업은행 7378-34573-89345")
        
    ]
}






