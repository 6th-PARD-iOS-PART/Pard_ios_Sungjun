//
//  final_View.swift
//  toss clone coding
//
//  Created by 박성준 on 10/10/25.
//

import SwiftUI



struct success_View: View {
    
    let account: accountData // 직전 뷰에서 송금할 금액 데이터 까지 추가하여 가져옴
    let recent: recentData
    let inputAmount: Int
    
    var body: some View {
        VStack{
            Spacer()
            if recent.who == "하나은행통장" || recent.who == "토스뱅크통장" {
                HStack(spacing:0){
                    Text("내 \(recent.who) ")
                        .foregroundStyle(.blue)
                        .fontWeight(.bold)
                    
                    Text("으로")
                        .foregroundStyle(.gray)
                        .frame(alignment: .leading)
                        .fontWeight(.bold)
                }
                .padding(.top, 160)
                .font(.system(size: 30))
                Text("\(inputAmount.formatted())원을")
                    .fontWeight(.bold)
                    .font(.system(size: 30))
                    .opacity(0.7)
                Text("옮길까요?")
                    .fontWeight(.bold)
                    .font(.system(size: 30))
                    .opacity(0.7)
            }
            
            else {
                HStack(spacing:0){
                    Text("\(recent.who) ")
                        .fontWeight(.bold)
                        .foregroundStyle(.blue)
                    Text("님에게")
                        .frame( alignment: .leading)
                        .foregroundStyle(.gray)
                        .fontWeight(.bold)
                }
                .font(.system(size: 30))
                Text("\(inputAmount.formatted())원을")
                    .fontWeight(.bold)
                    .font(.system(size: 30))
                    .opacity(0.7)
                Text("옮길까요?")
                    .fontWeight(.bold)
                    .font(.system(size: 30))
                    .opacity(0.7)
            }
            Spacer()
            
            HStack{
                Text("받는 분에게 표시")
                
                Spacer()
                Text("박성준")
                Image("볼드오른쪽")
                    .resizable()
                    .frame(width: 8, height: 13)
            }
            .font(.system(size: 15))
            .foregroundStyle(.gray)
            .padding(.top, 250)
            .padding(.bottom, 20)
            
            HStack{
                Text("출금 계좌")
                Spacer()
                Text("\(account.name)")
                
                Image("볼드오른쪽")
                    .resizable()
                    .frame(width: 8, height: 13)
            }
            .font(.system(size: 15))
            .foregroundStyle(.gray)
            .padding(.bottom, 20)
            
            HStack{
                Text("입금 계좌")
                Spacer()
                Text("\(recent.num)")
            }
            .font(.system(size: 15))
            .foregroundStyle(.gray)
            .padding(.bottom, 40)
  
            NavigationLink(destination: Home_View()) {
                ZStack {
                    Rectangle()
                        .fill(Color.blue)
                        .frame(width: 365, height: 60)
                        .cornerRadius(20)
                    
                    Text("옮기기")
                        .foregroundStyle(.white)
                        .fontWeight(.bold)
                }
            }
            .padding(.bottom, 20)
            
            Text("평생수수료 무료")
                .foregroundStyle(.gray)
                .font(.system(size: 15))
        }
        .padding(.horizontal, 20)
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
    success_View(account: accountData.accounts.first!,recent: recentData.recent.first!, inputAmount: 50000)
}
