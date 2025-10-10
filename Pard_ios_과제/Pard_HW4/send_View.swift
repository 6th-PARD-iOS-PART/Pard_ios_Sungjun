//
//  send_View.swift
//  toss clone coding
//
//  Created by 박성준 on 10/9/25.
//

import SwiftUI

struct send_View: View {

    let recent = recentData.recent // 최근 보낸 계좌 데이터 가져옴
    let account: accountData
    
    var body: some View {
        ScrollView{
            VStack{
                Text("어디로 돈을 보낼까요?")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.system(size: 27))
                ZStack{
                    Rectangle()
                        .fill(Color(red: 0.95, green:0.95, blue:0.95))
                        .frame(width: 350, height: 55)
                    
                    HStack{
                        ZStack{
                            Rectangle()
                                .fill(.white)
                                .frame(width: 165, height: 45)
                                .cornerRadius(10)
                            Text("계좌")
                                .foregroundStyle(.gray)
                        }
                        .padding(.leading,10)
                        Spacer()
                        Text("연락처")
                            .padding(.trailing, 75)
                            .foregroundStyle(.gray)
                    }
                }
                HStack{
                    Text("계좌번호입력")
                        .foregroundStyle(.gray)
                        .fontWeight(.bold)
                        .font(.system(size: 20))
                    Spacer()
                    Image("카메라")
                        .resizable()
                        .frame(width: 24, height: 24)
                }
                .padding(.top, 10)
                
                Divider()
                
                HStack{
                    Text("내 계좌")
                        .foregroundStyle(.gray)
                    Spacer()
                    Text("+18개")
                        .foregroundStyle(.gray)
                    Image("볼드오른쪽")
                        .resizable()
                        .frame(width: 7, height: 13)
                }
                .padding(.top, 10)
                
                VStack(spacing: 35){ // 데이터 배열의 2번째 까지만 사용한다고 선언
                    ForEach(Array(recent).prefix(2).enumerated(), id: \.offset) { index, element in
                        NavigationLink(destination: howmuch_View( account:account, recent:element)) {
                            ZStack{
                                Rectangle()
                                    .fill(Color.white)
                                    .frame(maxWidth: .infinity, minHeight: 40)
                                HStack{
                                    Image(element.logo)
                                        .resizable()
                                        .frame(width: 45, height: 45)
                                        .clipShape(Circle())
                                    VStack(alignment: .leading){
                                        Text(element.who)
                                            .foregroundStyle(.black)
                                            .font(.system(size: 16))
                                        Text(element.num)
                                            .foregroundStyle(.gray)
                                            .font(.system(size: 13))
                                            .padding(.top, 1)
                                    }
                                    Spacer()
                                    Image("파랑별")
                                        .resizable()
                                        .frame(width: 25, height: 25)
                                }
                            }
                        }
                    }
                }

                .padding(.top)
                Text("최근 보낸 계좌")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top,50)
                VStack(spacing:35){ // 데이터 배열의 앞 2개를 빼고 사용한다고 선언
                    ForEach(Array(recent.dropFirst(2).enumerated()), id: \.offset) { index, element in
                        NavigationLink(destination: howmuch_View( account:account, recent:element)) { //이번엔 데이터를 넘길때 추가로 최근 보낸 계좌 데이터까지 넘긴다
                            ZStack{
                                Rectangle()
                                    .fill(Color.white)
                                    .frame(maxWidth: .infinity, minHeight: 40)
                                HStack{
                                    Image(element.logo)
                                        .resizable()
                                        .frame(width: 45, height: 45)
                                        .clipShape(Circle())
                                    VStack(alignment: .leading){
                                        Text(element.who)
                                            .foregroundStyle(.black)
                                            .font(.system(size: 16))
                                        Text(element.num)
                                            .foregroundStyle(.gray)
                                            .font(.system(size: 13))
                                            .padding(.top, 1)
                                    }
                                    Spacer()
                                    Image("회색별")
                                        .resizable()
                                        .frame(width: 25, height: 25)
                                }
                            }
                        }
                    }
                }
                .padding(.top, 30)
                
            }
            .padding(.horizontal, 20)
        }
    }
}

#Preview {
    send_View(account: accountData.accounts.first!)
}
