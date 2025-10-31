//
//  shopping.swift
//  Pard_ios
//
//  Created by 박성준 on 10/31/25.
//

import SwiftUI

struct Tosshome: View {
    let accounts = accountData.accounts
    
    var body: some View {
        NavigationStack {
            ScrollView {
                ZStack {
                    LazyVStack {
                        HStack(spacing: 12){ // 맨위 아이콘 4가지
                            Image("네모")
                                .resizable()
                                .frame(width: 21, height: 22)
                            Image("할일")
                                .resizable()
                                .frame(width: 36, height: 18)
                            Image("오른쪽")
                                .resizable()
                                .frame(width: 8, height: 12)
                            Spacer()
                            Image("결제")
                                .resizable()
                                .frame(width: 40, height: 25)
                                .padding(.trailing, 12)
                            Image("종")
                                .resizable()
                                .frame(width: 21, height: 22)
                            
                            Rectangle()
                                .fill(Color(.red))
                                .frame(width: 8, height: 8)
                                .cornerRadius(8)
                                .padding(.bottom, 17)
                                .padding(.leading, -12)
                        }
                        .padding(.horizontal, 17)
                        
                        ZStack { // 홈화면 1번째 사각형
                            Rectangle()
                                .fill(Color(.white))
                                .frame(width: 380, height: 99)
                                .cornerRadius(25)
                            HStack{
                                Image("치아")
                                    .resizable()
                                    .frame(width: 31, height: 35)
                                VStack(alignment: .leading){
                                    Text("치아는 뼈일까?")
                                        .font(.system(size: 15.3))
                                        .foregroundStyle(.gray)
                                    Text("정답보기")
                                        .font(.system(size: 18.4))
                                        .foregroundStyle(.blue)
                                }
                                Spacer()
                                Image("볼드오른쪽")
                                    .resizable()
                                    .frame(width: 7, height: 13)
                            }
                            .padding(.horizontal, 36)
                        }
                        .padding(.top, 15)
                        ZStack{ // 홈화면 2번째 사각형
                            Rectangle()
                                .fill(Color(.white))
                                .frame(width: 380, height: 65)
                                .cornerRadius(25)
                            HStack(spacing: 12){
                                Text("토스뱅크")
                                    .font(.system(size: 17.4))
                                    .foregroundStyle(.gray)
                                Spacer()
                                Text("내 소비복권긁기")
                                    .font(.system(size: 13.5))
                                    .foregroundStyle(.blue)
                                Image("볼드오른쪽")
                                    .resizable()
                                    .frame(width: 7, height: 13)
                                    .padding(.trailing, 12)
                            }
                            .padding(.horizontal, 25)
                        }
                        ZStack{ // 홈화면 3번째 사각형
                            Rectangle()
                                .fill(Color(.white))
                                .frame(width: 380, height: 650)
                                .cornerRadius(25)
                            VStack(){
                                ForEach(Array(accountData.accounts.enumerated()), id:\.offset) { index, element in // for each 조건 달아서 다르게 하고 배열 인덱스와 element를 넣는다
                                    if index == 2 {
                                        Spacer().frame(height: 20)
                                        HStack{
                                            Image(element.icon)
                                                .resizable()
                                                .frame(width: 34, height: 34)
                                            VStack(alignment: .leading){
                                                Text("\(element.amount.formatted())원")
                                                    .font(.system(size:18))
                                                Text(element.name)
                                                    .font(.system(size:13))
                                                    .foregroundStyle(.gray)
                                            }
                                            Spacer()
                                            ZStack{
                                                Button("지금받기") {
                                                    
                                                }
                                                .frame(width: 77, height: 36)
                                                .background(Color(red: 0.95, green: 0.95, blue: 0.95))
                                                .cornerRadius(10)
                                                .foregroundStyle(.gray)
                                            }
                                        }
                                    }
                                    else if index == 6 {
                                        Spacer().frame(height: 20)
                                        HStack{
                                            Image(element.icon)
                                                .resizable()
                                                .frame(width: 34, height: 34)
                                            VStack(alignment: .leading){
                                                HStack{
                                                    Text("\(element.amount.formatted())원")
                                                        .font(.system(size:18))
                                                    Text("+4.42%")
                                                        .foregroundStyle(.red)
                                                        .font(.system(size:18))
                                                }
                                                Text(element.name)
                                                    .font(.system(size:13))
                                                    .foregroundStyle(.gray)
                                            }
                                            Spacer()
                                            Rectangle()
                                                .fill(Color.white)
                                                .frame(width: 25, height: 25)
                                                .padding(.trailing)
                                        }
                                    }
                                    else if index == 9 {
                                        Spacer().frame(height: 20)
                                        HStack{
                                            Image(element.icon)
                                                .resizable()
                                                .frame(width: 34, height: 34)
                                            VStack(alignment: .leading){
                                                HStack{
                                                    Text("\(element.amount.formatted())원")
                                                        .font(.system(size:18))
                                                    Text("-2.6%")
                                                        .foregroundStyle(.blue)
                                                        .font(.system(size:18))
                                                }
                                                Text(element.name)
                                                    .font(.system(size:13))
                                                    .foregroundStyle(.gray)
                                            }
                                            Spacer()
                                            Rectangle()
                                                .fill(Color.white)
                                                .frame(width: 25, height: 25)
                                                .padding(.trailing)
                                        }
                                    }
                                    else {
                                        Spacer().frame(height: 20)
                                        HStack{
                                            Image(element.icon)
                                                .resizable()
                                                .frame(width: 34, height: 34)
                                            VStack(alignment: .leading){
                                                Text("\(element.amount.formatted())원")
                                                    .font(.system(size:18))
                                                Text(element.name)
                                                    .font(.system(size:13))
                                                    .foregroundStyle(.gray)
                                            }
                                            Spacer() // 송금 버튼을 누르면 다음 뷰로 넘어간다 넘어갈때 해당 계좌의 잔액과 계좌 이름 아이콘 등 정보를 넘긴다
                                            NavigationLink(destination: account_View(account: element)) {
                                                Text("송금")
                                                    .foregroundStyle(.gray)
                                                    .frame(width: 60, height: 35)
                                                    .background(Color(red: 0.95, green: 0.95, blue: 0.95))
                                                    .cornerRadius(10)
                                            }
                                        }
                                    }
                                }
                                .padding(.horizontal, 20)
                                Rectangle() // 3번째 사각형 아래 4가지 버튼 구현
                                    .fill(
                                        LinearGradient(gradient: Gradient(colors: [
                                            Color.gray.opacity(0.0),
                                            Color.gray.opacity(0.5),
                                            Color.gray.opacity(0.0)
                                        ]),startPoint: .leading, endPoint: .trailing))
                                    .frame(width: 380, height: 1)
                                    .offset(y:6)
                                
                                ZStack{
                                    Rectangle()
                                        .fill(
                                            LinearGradient(gradient: Gradient(colors: [
                                                Color.gray.opacity(0.0),
                                                Color.gray.opacity(0.05),
                                                Color.gray.opacity(0.0)
                                            ]),startPoint: .leading, endPoint: .trailing))
                                        .frame(width: 380, height: 60)
                                        .cornerRadius(25)
                                    
                                    HStack{
                                        Spacer()
                                        Text("대출 0")
                                            .font(.system(size: 13.3))
                                            .foregroundStyle(.gray)
                                        Spacer()
                                        Rectangle()
                                            .fill(
                                                LinearGradient(gradient: Gradient(colors: [
                                                    Color.gray.opacity(0.3),
                                                    Color.gray.opacity(0.0)
                                                ]),startPoint: .top, endPoint: .bottom))
                                            .frame(width: 1, height: 56)
                                        
                                        Spacer()
                                        Text("증권 7")
                                            .font(.system(size: 13.3))
                                            .foregroundStyle(.gray)
                                        
                                        Spacer()
                                        Rectangle()
                                            .fill(
                                                LinearGradient(gradient: Gradient(colors: [
                                                    Color.gray.opacity(0.5),
                                                    Color.gray.opacity(0.5)
                                                ]),startPoint: .top, endPoint: .bottom))
                                            .frame(width: 1, height: 54)
                                        
                                        Spacer()
                                        Text("저축 3")
                                            .font(.system(size: 13.3))
                                            .foregroundStyle(.gray)
                                        
                                        Spacer()
                                        Rectangle()
                                            .fill(
                                                LinearGradient(gradient: Gradient(colors: [
                                                    Color.gray.opacity(0.3),
                                                    Color.gray.opacity(0.0)
                                                ]),startPoint: .top, endPoint: .bottom))
                                            .frame(width: 1, height: 56)
                                        
                                        Spacer()
                                        Text("전체 26")
                                            .font(.system(size: 13.3))
                                            .foregroundStyle(.gray)
                                        
                                        Spacer()
                                    }
                                }
                            }
                            .padding(.horizontal, 20)
                            
                        }
                        ZStack{
                            Rectangle()
                                .fill(Color.white)
                                .frame(width: 380, height: 85)
                                .cornerRadius(25)
      
                            HStack{ // 4번째 사각형
                                ZStack{
                                    Image("blank")
                                        .resizable()
                                        .frame(width: 34, height: 34)
                                    Text("W")
                                        .foregroundStyle(.blue)
                                        .opacity(0.8)
                                }
                                VStack(alignment: .leading){
                                    Text("823,643원")
                                        .font(.system(size: 18.3))
                                        .opacity(0.8)
                                    
                                    Text("3월에 쓴돈")
                                        .font(.system(size: 13.3))
                                        .foregroundStyle(.gray)
                                }
                                Spacer()
                                Button("내역") {
                                    
                                }
                                .frame(width: 59, height: 36)
                                .background(Color(red: 0.95, green: 0.95, blue: 0.95))
                                .cornerRadius(10)
                                .foregroundStyle(.gray)
                            }
                            .padding(.horizontal,25)
                            
                        }
                        .padding(.top, 3)
                        
                        ZStack{ // 5번째 사각형
                            Rectangle()
                                .fill(Color.white)
                                .frame(width: 380, height: 130)
                                .cornerRadius(25)
                            VStack{
                                Spacer()
                                HStack{
                                    Image("credit")
                                        .resizable()
                                        .frame(width: 34, height: 34)
                                    Text("내 신용점수")
                                        .font(.system(size: 18.3))
                                        .foregroundStyle(.gray)
                                    Spacer()
                                    Button("확인하기") {
                                        
                                    }
                                    .frame(width: 77, height: 36)
                                    .background(Color(red: 0.95, green: 0.95, blue: 0.95))
                                    .cornerRadius(10)
                                    .foregroundStyle(.gray)
                                }
                                .padding(.horizontal, 25)
                                Rectangle() // 5번째 사각형 아래 3개 버튼 구현
                                    .fill(
                                        LinearGradient(gradient: Gradient(colors: [
                                            Color.gray.opacity(0.0),
                                            Color.gray.opacity(0.5),
                                            Color.gray.opacity(0.0)
                                        ]),startPoint: .leading, endPoint: .trailing))
                                    .frame(width: 380, height: 1)
                                    .offset(y:6)
                                
                                ZStack{
                                    Rectangle()
                                        .fill(
                                            LinearGradient(gradient: Gradient(colors: [
                                                Color.gray.opacity(0.0),
                                                Color.gray.opacity(0.05),
                                                Color.gray.opacity(0.0)
                                            ]),startPoint: .leading, endPoint: .trailing))
                                        .frame(width: 380, height: 55)
                                        .cornerRadius(25)
                                    
                                    HStack{
                                        Spacer()
                                        Text("계좌개설")
                                            .font(.system(size: 13.3))
                                            .foregroundStyle(.gray)
                                        Spacer()
                                        Rectangle()
                                            .fill(
                                                LinearGradient(gradient: Gradient(colors: [
                                                    Color.gray.opacity(0.3),
                                                    Color.gray.opacity(0.0)
                                                ]),startPoint: .top, endPoint: .bottom))
                                            .frame(width: 1, height: 56)
                                        Spacer()
                                        Text("카드발급")
                                            .font(.system(size: 13.3))
                                            .foregroundStyle(.gray)
                                        Spacer()
                                        Rectangle()
                                            .fill(
                                                LinearGradient(gradient: Gradient(colors: [
                                                    Color.gray.opacity(0.3),
                                                    Color.gray.opacity(0.0)
                                                ]),startPoint: .top, endPoint: .bottom))
                                            .frame(width: 1, height: 56)
                                        
                                        Spacer()
                                        Text("대출받기")
                                            .font(.system(size: 13.3))
                                            .foregroundStyle(.gray)
                                        
                                        Spacer()
                                    }
                                }
                            }
                        }
                        ZStack{
                            Rectangle()
                                .fill(Color.white)
                                .frame(width: 380, height: 94)
                                .cornerRadius(25)
                            
                            HStack { // 6번째 사각형
                                Image("mail")
                                    .resizable()
                                    .frame(width: 50, height: 50)
                                    .padding(.leading, 25)
                                
                                VStack(alignment: .leading) {
                                    Text("[7만원]이 지급되었습니다")
                                        .font(.system(size: 18.3))
                                        .opacity(0.8)
                                    Text("빗썸신규회원100%지급")
                                        .foregroundStyle(.gray)
                                        .font(.system(size: 15))
                                }
                                Spacer()
                            }
                        }
                        Text("박성준님을 위해 준비했어요")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 20)
                            .padding(.top, 25)
                        
                        HStack{ // 7번째 사각형 hstack 2 개
                            Spacer()
                            ZStack{
                                Rectangle()
                                    .fill(Color.white)
                                    .frame(width: 185, height: 85)
                                    .cornerRadius(25)
                                HStack {
                                    VStack{
                                        Text("혜택받는")
                                            .foregroundStyle(.gray)
                                            .font(.system(size: 16))
                                        Text("체크카드")
                                            .foregroundStyle(.gray)
                                            .font(.system(size: 16))
                                    }
                                    .padding(.leading, 20)
                                    Spacer()
                                    Image("card")
                                        .resizable()
                                        .frame(width: 55, height: 55)
                                        .padding(.top, 20)
                                        .padding(.trailing, 15)
                                }
                            }
                            Spacer()
                            ZStack{ //8번째 마지막 사각형
                                Rectangle()
                                    .fill(Color.white)
                                    .frame(width: 185, height: 85)
                                    .cornerRadius(25)
                                HStack {
                                    VStack{
                                        Text("내 카드보다")
                                            .foregroundStyle(.gray)
                                            .font(.system(size: 16))
                                        Text("혜택받기")
                                            .foregroundStyle(.gray)
                                            .font(.system(size: 16))
                                    }
                                    .padding(.leading, 20)
                                    Spacer()
                                    Image("card2")
                                        .resizable()
                                        .frame(width: 57, height: 58)
                                        .padding(.top, 20)
                                        .padding(.trailing, 15)
                                }
                            }
                            Spacer()
                        }
                        
                        ZStack{
                            Rectangle()
                                .fill(Color.white)
                                .frame(width: 380, height: 180)
                                .cornerRadius(25)
                            VStack{
                                HStack{
                                    Image("receipt")
                                        .resizable()
                                        .frame(width: 20, height: 25)
                                    
                                    Text("내현금영수증")
                                        .padding(.leading, 20)
                                        .foregroundStyle(.gray)
                                    Spacer()
                                    Image("볼드오른쪽")
                                        .resizable()
                                        .frame(width: 10, height: 15)
                                }
                                
                                HStack{
                                    Image("card3")
                                        .resizable()
                                        .frame(width: 20, height: 25)
                                    
                                    Text("토스신용카드")
                                        .padding(.leading, 20)
                                        .foregroundStyle(.gray)
                                    Spacer()
                                    Image("볼드오른쪽")
                                        .resizable()
                                        .frame(width: 10, height: 15)
                                }
                                .padding(.top, 15)
                                
                                HStack{
                                    Image("cal2")
                                        .resizable()
                                        .frame(width: 20, height: 25)
                                    
                                    Text("더 낸 연말정산 돌려받기")
                                        .padding(.leading, 20)
                                        .foregroundStyle(.gray)
                                    Spacer()
                                    Image("볼드오른쪽")
                                        .resizable()
                                        .frame(width: 10, height: 15)
                                }
                                .padding(.top, 15)
                            }
                            .padding(.horizontal,25)
                        }
                
                        HStack{
                            Spacer()
                            Text("내 자산 숨기기")
                                .foregroundStyle(.gray)
                            Spacer()
                            Text("금액 가리기")
                                .foregroundStyle(.gray)
                            Spacer()
                        }
                        .padding(.top, 60)
                    }
                }
                
            }
            .padding(.horizontal, 8)
            .background(Color(red: 0.95, green: 0.95, blue: 0.95))
        }
    }
}

#Preview {
    Tosshome()
}
