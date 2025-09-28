//
//  toss_clone.swift
//  Pard_ios
//
//  Created by 박성준 on 9/30/25.
//

import SwiftUI

struct toss_clone_main: View {
    
    let icons = ["woori", "toss", "lightning", "kbank", "kb", "ibk", "global", "kakao", "ibk", "coin"]
    let menu = ["송금", "송금", "지금받기", "송금", "송금", "송금", "송금", "송금", "송금", "송금"]
    let amount = [
        ("339,690원", "하나은행"),
        ("38,841원", "토스뱅크통장"),
        ("114원", "토스뱅크에 쌓인 이자"),
        ("650원", "케이뱅크"),
        ("2,090원", "KB나라사랑우대통장"),
        ("29원", "보통예금(IBK나라사랑통장)"),
        ("118원", "토스뱅크외화통장 · 2개"),
        ("0원", "카카오뱅크"),
        ("1,051원", "보통예금(IBK주거래생활금융통장"),
        ("15,257,990원", "투자 모아보기 · 15개"),
    ]
    
    @State private var tabSelection = 0
    
    var body: some View {
        
        
        ZStack {
            
            NavigationView {
                
                ScrollView {
                    
                    
                    
                    LazyVStack {
                        
                        HStack {
                            Image("1st")
                                .resizable()
                                .frame(width: 25, height: 25)
                                .padding(.leading,25)
                            Image("할일")
                                .resizable()
                                .frame(width: 40, height: 20)
                                .padding(.horizontal, 5)
                            
                            
                            Image("오른쪽")
                                .resizable()
                                .frame(width: 8, height: 12)
                            
                            Spacer()
                            Image("결제")
                                .resizable()
                                .frame(width: 40, height: 25)
                                .padding(.trailing, 10)
                            Image("종")
                                .resizable()
                                .frame(width: 20, height: 25)
                                
                            Rectangle()
                                .fill(Color(.red))
                                .frame(width: 7, height: 7)
                                .cornerRadius(5)
                                .padding(.trailing, 25)
                                .padding(.bottom, 25)
                                .padding(.leading, -5)
                            
                            
                        }
                        ZStack{
                            
                            Rectangle()
                            
                                .fill(Color.white)
                                .frame(height: 100)
                                .cornerRadius(30)
                                .padding(.horizontal, 10)
                            
                            HStack {
                                
                                Image("치아")
                                    .resizable()
                                    .frame(width: 31, height: 35)
                                    .padding(.leading, 40)
                                
                                VStack(alignment: .leading){
                                    Text("치아는 뼈일까?")
                                        .foregroundStyle(.gray)
                                    
                                    Text("정답보기")
                                        .foregroundStyle(.blue)
                                    
                                    
                                }
                                .padding(.leading, 10)
                                
                                Spacer()
                                
                                Image("볼드오른쪽")
                                    .resizable()
                                    .frame(width: 7, height: 13)
                                    .padding(.trailing, 40)
                                
                            }
                            
                        }
                        
                        ZStack {
                            Rectangle()
                                .fill(Color.white)
                                .frame(height: 80)
                                .cornerRadius(30)
                                .padding(.horizontal, 10)
                            
                            HStack {
                                
                                Text("토스뱅크")
                                    .padding(.leading, 30)
                                
                                Spacer()
                                
                                Text("내 소비복권긁기")
                                    .foregroundStyle(.blue)
                                    .padding(.trailing, 10)
                                    .font(.system(size: 15))
                                
                                Image("볼드오른쪽")
                                    .resizable()
                                    .frame(width: 7, height: 13)
                                    .padding(.trailing, 40)
                            }
                        }
                        ZStack {
                            
                            
                            Rectangle()
                                .fill(Color.white)
                                .frame(height: 650)
                                .cornerRadius(30)
                                .padding(.horizontal, 10)
                            
                            
                            
                            HStack (alignment: .top){
                                
                                VStack {
                                    ForEach(icons, id:\.self) {name in
                                        Image(name)
                                            .resizable()
                                            .frame(width: 35,height: 35)
                                            .padding(.top,15)
                                        
                                    }
                                }
                                
                                VStack(alignment:.leading){
                                    ForEach(Array(amount.enumerated()), id:\.offset) { index, element in
                                        let (value, bank) = element
                                        if index == 6 {
                                            VStack(alignment: .leading){
                                                HStack{
                                                    Text(value)
                                                        .font(.system(size:17))
                                                    Text("+4.42%")
                                                        .foregroundStyle(.red)
                                                }
                                                Text(bank)
                                                    .font(.system(size: 12))
                                                    .foregroundStyle(.gray)
                                                
                                            }
                                            .padding(.top,15)
                                            .padding(.leading, 5)
                                        }
                                        
                                        else if index == 9 {
                                            VStack(alignment: .leading){
                                                HStack{
                                                    Text(value)
                                                        .font(.system(size:17))
                                                    Text("-2.6%")
                                                        .foregroundStyle(.blue)
                                                }
                                                Text(bank)
                                                    .font(.system(size: 12))
                                                    .foregroundStyle(.gray)
                                                
                                            }
                                            .padding(.top,15)
                                            .padding(.leading, 5)
                                        }
                                        
                                        else {
                                            VStack(alignment: .leading){
                                                Text(value)
                                                    .font(.system(size:17))
                                                Text(bank)
                                                    .font(.system(size: 12))
                                                    .foregroundStyle(.gray)
                                                
                                            }
                                            .padding(.top,15)
                                            .padding(.leading, 5)
                                            
                                        }
                                        
                                    }
                                }
                                
                                Spacer()
                                
                                VStack {
                                    ForEach(Array(menu.enumerated()), id: \.offset) { index, item in
                                        if [2].contains(index) {
                                            
                                            Button(item) {
                                                print("\(item) 특별 버튼 눌림")
                                            }
                                            .foregroundStyle(.gray)
                                            .frame(width: 80, height: 35)
                                            .background(Color(red: 0.95, green: 0.95, blue: 0.95))
                                            .cornerRadius(10)
                                            .padding(.top, 15)
                                            .padding(.trailing, 20)
                                            .font(.system(size: 15))
                                        }
                                        
                                        else if [6].contains(index) {
                                            
                                            Button(item) {
                                                print("눌림")
                                            }
                                            .foregroundStyle(.white)
                                            .frame(width: 10, height: 35)
                                            .background(Color(.white))
                                            .cornerRadius(15)
                                            .padding(.top, 15)
                                            
                                            
                                        }
                                        
                                        else if [9].contains(index) {
                                            
                                            Button(item) {
                                                print("눌림")
                                            }
                                            .foregroundStyle(.white)
                                            .frame(width: 10, height: 35)
                                            .background(Color(.white))
                                            .cornerRadius(15)
                                            .padding(.top, 15)
                                        }
                                        
                                        else {
                                            
                                            NavigationLink(destination: toss_clone_info()) {
                                                Text(item)
                                                    .foregroundStyle(.gray)
                                                    .frame(width: 60, height: 35)
                                                    .background(Color(red: 0.95, green: 0.95, blue: 0.95))
                                                    .cornerRadius(10)
                                                    .padding(.top, 15)
                                                    .font(.system(size: 14))
                                            }
                                            
                                            
                                            
                                        }
                                        
                                    }
                                    
                                }
                                                  
                            }
            
                            .padding(.leading, 30)
                            .padding(.trailing, 0)
                            .padding(.bottom, 65)
                            
                        }
                        
                        ZStack{
                            Rectangle()
                                .fill(Color(.white))
                                .frame(height: 50)
                                .cornerRadius(25)
                                .padding(.horizontal,10)
                                .padding(.top, -15)
                            
                            VStack{
                                Rectangle()
                                    .fill(
                                        LinearGradient(
                                            gradient: Gradient(colors: [
                                                Color.gray.opacity(0),
                                                Color.gray.opacity(0.3),
                                                Color.gray.opacity(0)
                                            ]),
                                            startPoint: .leading,
                                            endPoint: .trailing
                                        )
                                    )
                                    .frame(height: 1)
                                    .padding(.horizontal, 20)
                                    .offset(y: -10)

                                HStack{
                                    Spacer()
                                    Text("대출 0")
                                        .font(.system(size: 13))
                                    Spacer()
                                    Rectangle()
                                        .fill(
                                            LinearGradient(
                                                gradient: Gradient(colors: [
                                                    Color.gray.opacity(0.3),
                                                    Color.gray.opacity(0.15),
                                                    Color.gray.opacity(0.05)
                                                ]),
                                                startPoint: .top,
                                                endPoint: .bottom
                                            )
                                        )
                                        .frame(width: 1, height: 30)
                                    
                                    Spacer()
                                    Text("증권 7")
                                        .font(.system(size: 13))
                                    Spacer()
                                    Rectangle()
                                        .fill(Color(red: 0.85, green: 0.85, blue: 0.85))
                                        .frame(width: 2, height: 30)

                                    Spacer()
                                    Text("저축 3")
                                        .font(.system(size: 13))
                                    Spacer()
                                    Rectangle()
                                        .fill(
                                            LinearGradient(
                                                gradient: Gradient(colors: [
                                                    Color.gray.opacity(0.3),
                                                    Color.gray.opacity(0.15),
                                                    Color.gray.opacity(0.05)
                                                ]),
                                                startPoint: .top,
                                                endPoint: .bottom
                                            )
                                        )
                                        .frame(width: 1, height: 30)

                                    Spacer()
                                    Text("전체 26")
                                        .font(.system(size: 13))
                                    Spacer()
                                }
                                .padding(.bottom,25)
                                .foregroundStyle(.gray)
                            }
                        }
                        .padding(.top, -50)
                        
                        ZStack{
                            Rectangle()
                                .fill(Color.white)
                                .frame(height: 80)
                                .cornerRadius(30)
                                .padding(.horizontal, 10)
                            
                            HStack {
                                ZStack {
                                    Image("blank")
                                        .resizable()
                                        .frame(width: 35, height: 35)
                                        .padding(.leading, 30)
                                    Text("W")
                                        .padding(.leading, 30)
                                        .foregroundStyle(.blue)
                                }
                                
                                VStack(alignment: .leading){
                                    Text("823,643원")
                                        .font(.system(size: 18))
                                    Text("3월에 쓴돈")
                                        .font(.system(size: 12))
                                        .foregroundStyle(.gray)
                                    
                                }
                                Spacer()
                                
                                Button("내역") {
                                    print("눌림")
                                }
                                .foregroundStyle(.gray)
                                .frame(width: 60, height: 35)
                                .background(Color(red: 0.95, green: 0.95, blue: 0.95))
                                .cornerRadius(10)
                                .padding(.trailing, 40)
                            }
                        }
                        ZStack {
                            
                                Rectangle()
                                    .fill(Color.white)
                                    .frame(height: 125)
                                    .cornerRadius(30)
                                    .padding(.horizontal, 10)
                            VStack{
                                
                                HStack {
                                    Image("credit")
                                        .resizable()
                                        .frame(width: 35, height: 35)
                                        .padding(.leading, 30)
                                    
                                    Text("내 신용점수")
                                        .font(.system(size: 18))
                                    
                                    Spacer()
                                    
                                    Button("확인하기") {
                                        print("눌림")
                                    }
                                    .foregroundStyle(.gray)
                                    .frame(width: 80, height: 35)
                                    .background(Color(red: 0.95, green: 0.95, blue: 0.95))
                                    .cornerRadius(10)
                                    .padding(.trailing, 40)
                                }
                                .padding(.top,-1)
                                
                                VStack{
                                    Rectangle()
                                        .fill(
                                            LinearGradient(
                                                gradient: Gradient(colors: [
                                                    Color.gray.opacity(0),
                                                    Color.gray.opacity(0.3),
                                                    Color.gray.opacity(0)
                                                ]),
                                                startPoint: .leading,
                                                endPoint: .trailing
                                            )
                                        )
                                        .frame(height: 1)
                                        .padding(.horizontal, 20)

                                    HStack{
                                        Spacer()

                                        Text("계좌개설")
                                            .font(.system(size: 16))
                                        Spacer()
                                        Rectangle()
                                            .fill(
                                                LinearGradient(
                                                    gradient: Gradient(colors: [
                                                        Color.gray.opacity(0.3),
                                                        Color.gray.opacity(0.15),
                                                        Color.gray.opacity(0.05)
                                                    ]),
                                                    startPoint: .top,
                                                    endPoint: .bottom
                                                )
                                            )
                                            .frame(width: 1, height: 30)

                                        Spacer()
                                        Text("카드발급")
                                            .font(.system(size: 16))
                                        Spacer()
                                        Rectangle()
                                            .fill(
                                                LinearGradient(
                                                    gradient: Gradient(colors: [
                                                        Color.gray.opacity(0.3),
                                                        Color.gray.opacity(0.15),
                                                        Color.gray.opacity(0.05)
                                                    ]),
                                                    startPoint: .top,
                                                    endPoint: .bottom
                                                )
                                            )
                                            .frame(width: 1, height: 30)

                                        Spacer()
                                        Text("대출받기")
                                            .font(.system(size: 16))
                                        Spacer()
                                    }
                                    .foregroundStyle(.gray)
                                }
                            }
                        }
                        
                        
                        ZStack {
                            Rectangle()
                                .fill(Color.white)
                                .frame(height: 80)
                                .cornerRadius(30)
                                .padding(.horizontal, 10)
                            
                            HStack {
                                Image("mail")
                                    .resizable()
                                    .frame(width: 50, height: 50)
                                    .padding(.leading, 30)
                                
                                VStack(alignment: .leading) {
                                    Text("[7만원]이 지급되었습니다")
                                    Text("빗썸신규회원100%지급")
                                        .foregroundStyle(.gray)
                                        .font(.system(size: 15))
                                }
                                Spacer()
                            }
                        }
                        
                        Text("박성준님을 위해 준비했어요")
                            .padding(.top, 20)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 40)
                        
                        
                        HStack {
                            
                            Spacer()
                            
                            ZStack {
                                Rectangle()
                                    .fill(Color.white)
                                    .frame(height: 80)
                                    .cornerRadius(30)
                                
                                
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
                            
                            ZStack {
                                Rectangle()
                                    .fill(Color.white)
                                    .frame(height: 80)
                                    .cornerRadius(30)
                                
                                
                                HStack {
                                    VStack(alignment: .leading){
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
                                        .frame(width: 55, height: 55)
                                        .padding(.top, 20)
                                        .padding(.trailing, 15)
                                }
                            }
                            Spacer()
                        }
                        
                        .padding(.horizontal, 10)
                        
                        
                        ZStack {
                            Rectangle()
                                .fill(Color.white)
                                .frame(height: 175)
                                .cornerRadius(30)
                                .padding(.horizontal, 10)
                            
                            VStack{
                                HStack{
                                    Image("receipt")
                                        .resizable()
                                        .frame(width: 20, height: 25)
                                    
                                    Text("내현금영수증")
                                    Spacer()
                                    Image("볼드오른쪽")
                                        .resizable()
                                        .frame(width: 10, height: 15)
                                    
                                }
                                .padding(.horizontal,40)
                                HStack{
                                    Image("card3")
                                        .resizable()
                                        .frame(width: 20, height: 25)
                                    
                                    Text("토스신용카드")
                                    Spacer()
                                    Image("볼드오른쪽")
                                        .resizable()
                                        .frame(width: 10, height: 15)
                                }
                                .padding(.top, 15)
                                .padding(.horizontal,40)
                                HStack{
                                    Image("cal2")
                                        .resizable()
                                        .frame(width: 20, height: 25)
                                    
                                    Text("더 낸 연말정산 돌려받기")
                                    Spacer()
                                    Image("볼드오른쪽")
                                        .resizable()
                                        .frame(width: 10, height: 15)
                                }
                                .padding(.top, 15)
                                .padding(.horizontal,40)
                            }
                        }
                        
                        HStack{
                            Text("내 자산 숨기기")
                                .foregroundStyle(.gray)
                                .padding(.trailing,60)
                            Text("금액 가리기")
                                .foregroundStyle(.gray)
                        }
                        .padding(.top,67)
                        
                        
                    }
                    .padding(.bottom,37)
                    
                }
                .background(Color(red: 0.95, green: 0.95, blue: 0.95))
                
                
            }
            .navigationTitle("홈")
            .navigationBarTitleDisplayMode(.inline)
            
        }
    }
}

#Preview {
    toss_clone_main()
}
