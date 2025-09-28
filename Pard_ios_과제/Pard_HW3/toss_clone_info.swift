//
//  toss_clone_info.swift
//  Pard_ios
//
//  Created by 박성준 on 10/2/25.
//

import SwiftUI

struct list: Identifiable {
    let id = UUID()
    let icon: String
    let time: String
    let title: String
    let price: String
    let balance: String
}

let lists = [
    list(icon:"taxi", time:"1234", title:"카카오 택시_0", price:"-6,200원", balance:"38,841원"),
    list(icon:"taxi", time:"1234", title:"카카오 택시 선승인", price:"+6,900원", balance:"45,041원"),
    list(icon:"taxi", time:"1234", title:"카카오 택시 선승인", price:"-6,900원", balance:"38,141원")
]

let lists2 = [
    list(icon:"flex", time:"1234", title:"플렉스PC방", price:"-5,500원", balance:"45,041원"),
    list(icon:"flex", time:"1234", title:"플렉스PC방", price:"-5,000원", balance:"50,541원"),
    list(icon:"cu", time:"1234", title:"씨유한동대오석관점", price:"-2,000원", balance:"55,541원"),
    list(icon:"cu", time:"1234", title:"씨유한동대오석관점", price:"-4,400원", balance:"57,541원"),
    list(icon:"taxi", time:"1234", title:"카카오 택시_0", price:"-7,000원", balance:"61,941원"),
    list(icon:"taxi", time:"1234", title:"카카오 택시 선승인", price:"+7,300원", balance:"68,941원"),
    list(icon:"taxi", time:"1234", title:"카카오 택시 선승인", price:"-7,300원", balance:"61,641원"),
    list(icon:"taxi", time:"1234", title:"카카오 택시 선승인", price:"+7,300원", balance:"68,941원"),
    list(icon:"taxi", time:"1234", title:"카카오 택시 선승인", price:"-7,300원", balance:"61,641원")
]


struct toss_clone_info: View {
    var body: some View {
        ScrollView {
            
            LazyVStack {
                HStack{
                    Text("통장")
                        .foregroundStyle(.gray)
                        .font(.system(size: 18))
                        .padding(.leading, 45)
                    Spacer()
                    Text("내 토스뱅크")
                        .foregroundStyle(.gray)
                        .font(.system(size: 18))
                        .padding(.leading, 15)
                        
                    Spacer()
                    Text("상품찾기")
                        .foregroundStyle(.gray)
                        .font(.system(size: 18))
                    Spacer()
                }
                .padding(.horizontal, 20)
                ZStack{
                    Divider()
                    Rectangle()
                        .background(Color.black)
                        .frame(height: 1)
                        .padding(.leading, 30)
                        .padding(.trailing, 270)
                }
                
                Text("토스뱅크1000-9047-0710")
                    .font(.system(size: 15))
                    .foregroundStyle(.gray)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, 70)
                    .padding(.horizontal, 27)
                
                HStack {
                    Text("38,841원")
                        .font(.system(size: 30))
                        .fontWeight(.bold)
                        .foregroundStyle((Color(red: 0.3, green: 0.3, blue: 0.3)))
                    Spacer()
                    ZStack{
                        Rectangle()
                            .fill((Color(red: 0.95, green: 0.95, blue: 0.95)))
                            .frame(width: 75, height:45)
                            .cornerRadius(20)
                        HStack{
                            Image("card4")
                                .resizable()
                                .frame(width: 15, height: 20)
                            Text("카드")
                                .font(.system(size: 15))
                                .foregroundStyle(.gray)
                        }
                    
                    }
                        
                }
                .padding(.horizontal, 27)
                
                HStack {
                    ZStack{
                        Rectangle()
                            .fill(Color(red: 0.90, green: 0.95, blue: 1.00))
                            .cornerRadius(20)
                            .frame(width: 175, height: 60)
                        Text("채우기")
                            .foregroundStyle(.blue)
                            .font(.system(size: 20))
                    }
                    ZStack{
                        Rectangle()
                            .fill(Color.blue)
                            .frame(width: 175, height: 60)
                            .cornerRadius(20)
                        
                        Text("보내기")
                            .foregroundStyle(Color(red: 0.90, green: 0.95, blue: 1.00))
                            .font(.system(size: 20))
                    }
                        
                }
                .padding(.horizontal, 27)
                
                HStack {
                    Image("lightning2")
                        .resizable()
                        .frame(width: 40, height: 40)
                    
                    VStack (alignment: .leading){
                        Text("어제까지 쌓인 이자")
                            .foregroundStyle(.gray)
                            .font(.system(size: 13))
                        Text("114원 지금받기")
                            .foregroundStyle(Color(red: 0.4, green: 0.4, blue: 0.4))
                    }
                    .padding(.leading,10)
                    Spacer()
                    Image("볼드오른쪽")
                        .resizable()
                        .frame(width: 10, height: 15)
                }
                .padding(.horizontal, 27)
                
                Rectangle()
                    .fill(Color(red: 0.95, green: 0.95, blue: 0.95))
                    .frame(height: 25)
            }
            
            HStack {
                Text("전체")
                    .foregroundStyle(.gray)
                    .padding(.trailing, 10)
                Image("아래")
                    .resizable()
                    .frame(width: 15, height: 10)
                Spacer()
                Image("돋보기")
                    .resizable()
                    .frame(width: 25, height: 25)
            }
            .padding(.top, 20)
            .padding(.horizontal, 27)
            
            Text("3월 22일")
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundStyle(.gray)
                .padding(.top, 20)
                .padding(.horizontal, 27)
            
            VStack{
                ForEach (Array(lists.enumerated()), id:\.offset) {index, element in
                    
                    if (index == 1) {
                        HStack{
                            Image(element.icon)
                                .resizable()
                                .frame(width: 45, height: 45)
                            
                            VStack (alignment: .leading){
                                Text(element.title)
                                    .font(.system(size: 20))
                                    .foregroundStyle(Color(red: 0.3, green: 0.3, blue: 0.3))
                                Text(element.time)
                                    .font(.system(size: 14))
                                    .foregroundStyle(.gray)
                            }
                            
                            Spacer()
                            
                            VStack (alignment: .trailing){
                                Text(element.price)
                                    .font(.system(size: 20))
                                    .foregroundStyle(.blue)
                                Text(element.balance)
                                    .font(.system(size: 14))
                                    .foregroundStyle(.gray)
                                
                            }
                            
                        }
                        .padding(.top,25)
                        
                    }
                    else {
                        HStack{
                            Image(element.icon)
                                .resizable()
                                .frame(width: 45, height: 45)
                            
                            VStack (alignment: .leading){
                                Text(element.title)
                                    .font(.system(size: 20))
                                    .foregroundStyle(Color(red: 0.3, green: 0.3, blue: 0.3))
                                Text(element.time)
                                    .font(.system(size: 14))
                                    .foregroundStyle(.gray)
                            }
                            
                            Spacer()
                            
                            VStack (alignment: .trailing){
                                Text(element.price)
                                    .font(.system(size: 20))
                                    .foregroundStyle(Color(red: 0.3, green: 0.3, blue: 0.3))
                                Text(element.balance)
                                    .font(.system(size: 14))
                                    .foregroundStyle(.gray)
                                
                            }
                            
                        }
                        .padding(.top,25)
                    }
                    
                }
            }
            .padding(.horizontal, 27)
            
            Text("3월 21일")
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundStyle(.gray)
                .padding(.top, 20)
                .padding(.horizontal, 27)
            
            VStack{
                ForEach (Array(lists2.enumerated()), id:\.offset) {index, element in
                    if (index == 5) {
                        HStack{
                            Image(element.icon)
                                .resizable()
                                .frame(width: 45, height: 45)
                            
                            VStack (alignment: .leading){
                                Text(element.title)
                                    .font(.system(size: 20))
                                    .foregroundStyle(Color(red: 0.3, green: 0.3, blue: 0.3))
                                Text(element.time)
                                    .font(.system(size: 14))
                                    .foregroundStyle(.gray)
                            }
                            
                            Spacer()
                            
                            VStack (alignment: .trailing){
                                Text(element.price)
                                    .font(.system(size: 20))
                                    .foregroundStyle(.blue)
                                Text(element.balance)
                                    .font(.system(size: 14))
                                    .foregroundStyle(.gray)
                                
                            }
                            
                        }
                        .padding(.top,25)
                    }
                    else if (index == 7) {
                        HStack{
                            Image(element.icon)
                                .resizable()
                                .frame(width: 45, height: 45)
                            
                            VStack (alignment: .leading){
                                Text(element.title)
                                    .font(.system(size: 20))
                                    .foregroundStyle(Color(red: 0.3, green: 0.3, blue: 0.3))
                                Text(element.time)
                                    .font(.system(size: 14))
                                    .foregroundStyle(.gray)
                            }
                            
                            Spacer()
                            
                            VStack (alignment: .trailing){
                                Text(element.price)
                                    .font(.system(size: 20))
                                    .foregroundStyle(.blue)
                                Text(element.balance)
                                    .font(.system(size: 14))
                                    .foregroundStyle(.gray)
                                
                            }
                            
                        }
                        .padding(.top,25)
                    }
                    else {
                        HStack{
                            Image(element.icon)
                                .resizable()
                                .frame(width: 45, height: 45)
                            
                            VStack (alignment: .leading){
                                Text(element.title)
                                    .font(.system(size: 20))
                                    .foregroundStyle(Color(red: 0.3, green: 0.3, blue: 0.3))
                                Text(element.time)
                                    .font(.system(size: 14))
                                    .foregroundStyle(.gray)
                            }
                            
                            Spacer()
                            
                            VStack (alignment: .trailing){
                                Text(element.price)
                                    .font(.system(size: 20))
                                    .foregroundStyle(Color(red: 0.3, green: 0.3, blue: 0.3))
                                Text(element.balance)
                                    .font(.system(size: 14))
                                    .foregroundStyle(.gray)
                                
                            }
                            
                        }
                        .padding(.top,25)
                    }
                }
            }
            .padding(.horizontal, 27)
        }
        
    }
}

#Preview {
    toss_clone_info()
}
