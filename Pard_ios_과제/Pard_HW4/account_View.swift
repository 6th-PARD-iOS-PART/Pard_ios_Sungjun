//
//  account.swift
//  toss clone coding
//
//  Created by 박성준 on 10/8/25.
//

import SwiftUI

struct account_View: View {
    let account: accountData // 전에 뷰에서 데이터 가져온걸 사용
    
    var body: some View {
        ScrollView{
            VStack{
                HStack{ // 맨위 메뉴 3가지
                    Spacer()
                    Text("통장")
                        .opacity(0.7)
                    Spacer()
                    Text("내 토스뱅크")
                        .opacity(0.4)
                        .offset(x:15)
                    Spacer()
                    Text("상품찾기")
                        .opacity(0.4)
                    Spacer()
                }
                ZStack{ //구분선만들고 통장 부분에 강조
                    Rectangle()
                        .fill(.gray)
                        .opacity(0.1)
                        .frame(height: 1)
                    Rectangle()
                        .fill(.gray)
                        .frame(width: 110,height: 3)
                        .padding(.trailing, 250)
                }
                
                Text(account.num)
                    .foregroundStyle(.gray)
                    .font(.system(size: 14.2))
                    .padding(.bottom, -10)
                    .padding(.top,90)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 25)
                
                
                HStack{
                    Text("\(account.amount.formatted())원")
                        .font(.system(size: 30))
                        .opacity(0.7)
                        .fontWeight(.bold)
                    Spacer()
                    ZStack{
                        Rectangle()
                            .fill(Color(red: 0.95, green: 0.95, blue: 0.95))
                            .frame(width: 78, height: 45)
                            .cornerRadius(25)
                        HStack{
                            Image("card4")
                                .resizable()
                                .frame(width: 12, height: 16)
                            Text("카드")
                                .foregroundStyle(.gray)
                        }
                    }
                }
                .padding(.horizontal, 25)
                
                HStack{
                    ZStack{
                        Rectangle()
                            .fill(Color.blue)
                            .opacity(0.15)
                            .frame(width: 175, height: 48)
                            .cornerRadius(15)
                        Text("채우기")
                            .foregroundStyle(.blue)
                    }
                    ZStack{ // 전에 뷰에서 넘어온 정보를 똑같이 다시 넘겨준다
                        NavigationLink(destination: send_View(account: account)) {
                            Text("보내기")
                                .foregroundStyle(.white)
                                .frame(width: 175, height: 48)
                                .background(Color.blue)
                                .cornerRadius(15)
                        }
                    }
                }
                .padding(.top,5)
                HStack{
                    Image("lightning2")
                        .resizable()
                        .frame(width: 46, height: 46)
                    VStack(alignment: .leading){
                        Text("어제까지 쌓인 이자")
                            .foregroundStyle(.gray)
                            .font(.system(size: 13.3))
                        Text("114원 지금받기")
                            .font(.system(size: 18))
                            .opacity(0.7)
                    }
                    .padding(.leading, 10)
                    Spacer()
                    Image("볼드오른쪽")
                        .resizable()
                        .frame(width: 7, height: 13)
                }
                .padding(.horizontal,25)
                .padding(.top, 15)
                
                Rectangle()
                    .fill(Color(red: 0.95, green: 0.95, blue: 0.95))
                    .frame(height: 16)
                HStack{
                    Text("전체")
                        .opacity(0.55)
                    Image("아래")
                        .resizable()
                        .frame(width: 13, height: 7)
                    Spacer()
                    Image("돋보기")
                        .resizable()
                        .frame(width: 20, height: 20)
                }
                .padding(.horizontal,30)
                .padding(.vertical,15)
                Text("3월 22일")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal,25)
                    .font(.system(size: 14.3))
                    .foregroundStyle(.gray)
                    .padding(.vertical,10)
                VStack(spacing: 40){
                    ForEach(Array(interationData.interations.prefix(3).enumerated()), id: \.offset) {index, element in
                        
                        if index == 1 {
                            HStack{
                                Image(element.logo)
                                    .resizable()
                                    .frame(width: 45, height: 45)
                                
                                VStack(alignment: .leading){
                                    Text(element.store)
                                    Text(element.time)
                                        .font(.system(size:13))
                                }
                                Spacer()
                                VStack{
                                    Text("+\(element.change.formatted())원")
                                        .foregroundStyle(.blue)
                                    Text("\(element.balance.formatted())원")
                                        .font(.system(size:13))
                                }
                                
                            }
                        }
                        else {
                            HStack{
                                Image(element.logo)
                                    .resizable()
                                    .frame(width: 45, height: 45)
                                
                                VStack(alignment: .leading){
                                    Text(element.store)
                                    Text(element.time)
                                        .font(.system(size:13))
                                    
                                }
                                Spacer()
                                VStack(alignment: .trailing){
                                    Text("-\(element.change.formatted())원")
                                    Text("\(element.balance.formatted())원")
                                        .font(.system(size:13))
                                }
                            }
                        }
                    }
                }
                
                .foregroundStyle(.gray)
                .padding(.horizontal,25)
                Text("3월 21일")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal,25)
                    .font(.system(size: 14.3))
                    .foregroundStyle(.gray)
                    .padding(.vertical,10)
                VStack(spacing: 40){
                    ForEach(Array(interationData.interations.dropFirst(3).prefix(10).enumerated()), id: \.offset) {index, element in
                        
                        if index == 5 || index == 7 {
                            HStack{
                                Image(element.logo)
                                    .resizable()
                                    .frame(width: 45, height: 45)
                                
                                VStack(alignment: .leading){
                                    Text(element.store)
                                    Text(element.time)
                                        .font(.system(size:13))
                                }
                                Spacer()
                                VStack(alignment: .trailing){
                                    Text("+\(element.change.formatted())원")
                                        .foregroundStyle(.blue)
                                    Text("\(element.balance.formatted())원")
                                        .font(.system(size:13))
                                }
                                
                            }
                        }
                        else {
                            HStack{
                                Image(element.logo)
                                    .resizable()
                                    .frame(width: 45, height: 45)
                                
                                VStack(alignment: .leading){
                                    Text(element.store)
                                    Text(element.time)
                                        .font(.system(size:13))
                                }
                                Spacer()
                                VStack(alignment: .trailing){
                                    Text("-\(element.change.formatted())원")
                                    Text("\(element.balance.formatted())원")
                                        .font(.system(size:13))
                                }
                            }
                        }
                    }
                }
                .padding(.horizontal,25)
                .foregroundStyle(.gray)
            }
        }
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("통장관리")
                    .foregroundColor(.black)
                    .opacity(0.4)
                    .padding(.leading, 240)
            }
        }
        
    }
}

#Preview {
    account_View(account: accountData.accounts.first!)
}
