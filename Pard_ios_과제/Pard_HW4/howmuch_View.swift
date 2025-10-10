//
//  howmuch_View.swift
//  toss clone coding
//
//  Created by 박성준 on 10/9/25.
//

import SwiftUI

struct howmuch_View: View {
    let account: accountData // 2가지 데이터를 넘긴것을 받는다
    let recent: recentData
    
    @State private var inputNum = "" //입력한 금액
    @State private var all = false // 전액 입력 버튼 TF
    @FocusState private var isFocused: Bool //금액 입력 부분 포커스 TF
    
    var inputAmount: Int { // 문자로 입력된 값을 int값으로 변환
        Int(inputNum) ?? 0
    }
    
    var body: some View {
        VStack{
            HStack{
                Text("내 \(account.name)")
                    .font(.system(size: 23.5))
                    .frame( alignment: .leading)
                    .fontWeight(.bold)
                    .opacity(0.7)
                Text("에서")
                    .foregroundStyle(.gray)
                    .font(.system(size: 23.5))
                    .frame( alignment: .leading)
                Spacer()
            }
            .padding(.horizontal, 20)
            
            Text("잔액 \(account.amount)원")
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundStyle(.gray)
                .padding(.top, 10)
                .padding(.horizontal, 20)
            
            if recent.who == "하나은행통장" || recent.who == "토스뱅크통장" { // 내 계좌로 보내냐 최근 보낸 계좌로 보내냐 구분
                HStack(spacing:0){
                    Text("\(recent.who) ")
                        .frame(alignment: .leading)
                        .fontWeight(.bold)
                        .font(.system(size: 24))
                        .opacity(0.7)
                    Text("으로")
                        .foregroundStyle(.gray)
                        .frame(alignment: .leading)
                    Spacer()
                }
                .padding(.horizontal, 20)
                .padding(.top, 40)
                Text("\(recent.num)")
                    .foregroundStyle(.gray)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, 10)
                    .padding(.horizontal, 20)
            }
            else {
                HStack(spacing:0){
                    Text("\(recent.who) ")
                        .frame(alignment: .leading)
                        .fontWeight(.bold)
                        .font(.system(size: 24))
                    Text("님에게")
                        .frame( alignment: .leading)
                        .foregroundStyle(.gray)
                    Spacer()
                }
                .padding(.horizontal, 20)
                .padding(.top, 40)
                Text("\(recent.num)")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundStyle(.gray)
                    .padding(.top, 10)
                    .padding(.horizontal, 20)
            }
            
            VStack(spacing: 10) { // 값 입력 하는 곳 '얼마나 옮길까요?'
                Button(action: { isFocused = true }) { // 탭으로 활성화
                    if inputNum.isEmpty {
                        Text("얼마나 옮길까요?")
                            .font(.system(size: 26))
                            .opacity(0.6)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal, 20)
                    } else if let amount = Int(inputNum){
                        Text("\(amount.formatted())원")
                            .font(.system(size: 34, weight: .bold))
                            .foregroundStyle(.black)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal, 20)
                    }
                }
                .foregroundStyle(.gray)
                .padding(.top, 40)
                
                TextField("", text: $inputNum) // 실제 값이 입력되는 텍스트 필드
                    .keyboardType(.numberPad)
                    .focused($isFocused)
                    .opacity(0.01) // 안보이고 겹치게 설정
                //숫자만 입력 가능하게
                    .frame(width: 0, height: 0)
                    .onChange(of: inputNum) { oldValue, newValue in
                        inputNum = newValue.filter { "0123456789".contains($0) }
                    }
                    .onAppear { // 뷰 활성화시 자동으로 포커스
                        DispatchQueue.main.async {
                            isFocused = true
                        }
                    }
                
                if inputNum.isEmpty { // 아직 금액 입력 안했을 떄
                    Button(action: {
                        inputNum = String(account.amount)
                        isFocused = false
                        all = true
                    }) {
                        Text("잔액 \(account.amount.formatted())원 입력")
                            .frame(width: 150, height: 25)
                            .font(.system(size: 15))
                        
                            .background(Color(.systemGray6))
                            .cornerRadius(5)
                            .foregroundStyle(.gray)
                    }
                    .padding(.trailing,210)
                }
                
                if !inputNum.isEmpty { // 금액을 입력하였을때
                    
                    if all || (inputAmount > 0 && inputAmount < account.amount) {
                        Text("\(inputAmount.formatted())원")
                            .foregroundStyle(.gray)
                            .font(.system(size: 15))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal, 20)
                    } // 잔액 버튼 위치에 현재 입력값 작성
                    
                    
                    else if inputAmount > 2000000 {
                        
                        Text("한번에 200만원까지 보낼 수 있어요.")
                            .foregroundStyle(.red)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal, 20)
                    } // 200만원 초과 입력시 경고
                    else if inputAmount > account.amount {
                        Text("잔액이 \(account.amount)원이에요.")
                            .foregroundColor(.red)
                            .fontWeight(.semibold)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal, 20)
                    }                   // 현재 잔액 초과 입력시 경고
                }
            }
            Spacer()
            if inputAmount > 0 && inputAmount <= account.amount {
                NavigationLink(destination: success_View(account: account, recent: recent, inputAmount: inputAmount)) {
                    Text("다음")
                        .frame(maxWidth: .infinity, minHeight: 50)
                        .background(Color.blue)
                        .foregroundColor(.white)
                }
            } // 올바른 값 입력시 다음 버튼 활성화
            else if inputAmount > 2000000 {
                Button(action: {
                }) {
                    Text("다음")
                        .frame(maxWidth: .infinity, minHeight: 50)
                        .padding(.horizontal, -20)
                        .background(Color.blue)
                        .opacity(0.3)
                        .foregroundColor(.white)
                }
                .disabled(true) // 올바르지 않은 값 입력시 버튼 투명하게 만들고 비활성화
            }
            else if inputAmount > account.amount {
                Button(action: {
                    print("다음 단계로 이동")
                }) {
                    Text("다음")
                        .frame(maxWidth: .infinity, minHeight: 50)
                        .padding(.horizontal, -20)
                        .background(Color.blue)
                        .opacity(0.3)
                        .foregroundColor(.white)
                }
                .disabled(true) // 올바르지 않은 값 입력시 버튼 투명하게 만들고 비활성화
            }
            VStack{ // 키패드
                HStack{
                    Spacer()
                    Text("1")
                        .frame(width: 70, height: 30)
                        .font(.system(size: 28))
                        .foregroundStyle(Color(red: 0.5, green: 0.5, blue: 0.5))
                    Spacer()
                    Text("2")
                        .frame(width: 70, height: 30)
                        .font(.system(size: 28))
                        .foregroundStyle(Color(red: 0.5, green: 0.5, blue: 0.5))
                    Spacer()
                    Text("3")
                        .frame(width: 70, height: 30)
                        .font(.system(size: 28))
                        .foregroundStyle(Color(red: 0.5, green: 0.5, blue: 0.5))
                    Spacer()
                }
                .padding(.bottom,40)
                HStack{
                    Spacer()
                    Text("4")
                        .frame(width: 70, height: 30)
                        .font(.system(size: 28))
                        .foregroundStyle(Color(red: 0.5, green: 0.5, blue: 0.5))
                    Spacer()
                    Text("5")
                        .frame(width: 70, height: 30)
                        .font(.system(size: 28))
                        .foregroundStyle(Color(red: 0.5, green: 0.5, blue: 0.5))
                    Spacer()
                    Text("6")
                        .frame(width: 70, height: 30)
                        .font(.system(size: 28))
                        .foregroundStyle(Color(red: 0.5, green: 0.5, blue: 0.5))
                    Spacer()
                }
                .padding(.bottom,40)
                HStack{
                    Spacer()
                    Text("7")
                        .frame(width: 70, height: 30)
                        .font(.system(size: 28))
                        .foregroundStyle(Color(red: 0.5, green: 0.5, blue: 0.5))
                    Spacer()
                    Text("8")
                        .frame(width: 70, height: 30)
                        .font(.system(size: 28))
                        .foregroundStyle(Color(red: 0.5, green: 0.5, blue: 0.5))
                    Spacer()
                    Text("9")
                        .frame(width: 70, height: 30)
                        .font(.system(size: 28))
                        .foregroundStyle(Color(red: 0.5, green: 0.5, blue: 0.5))
                    Spacer()
                }
                .padding(.bottom,40)
                HStack{
                    Spacer()
                    Text("00")
                        .frame(width: 70, height: 30)
                        .font(.system(size: 28))
                        .foregroundStyle(Color(red: 0.5, green: 0.5, blue: 0.5))
                    Spacer()
                    Text("0")
                        .frame(width: 70, height: 30)
                        .font(.system(size: 28))
                        .foregroundStyle(Color(red: 0.5, green: 0.5, blue: 0.5))
                    Spacer()
                    Text("⃪")
                        .frame(width: 70, height: 30)
                        .font(.system(size: 28))
                        .foregroundStyle(Color(red: 0.5, green: 0.5, blue: 0.5))
                    Spacer()
                    
                }
            }
        }
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("토스뱅크 송금")
                    .font(.headline)
                    .foregroundColor(.black)
                    .opacity(0.4)
            }
        }
    }
}

#Preview {
    howmuch_View(account: accountData.accounts.first!,recent: recentData.recent.first!)
}
