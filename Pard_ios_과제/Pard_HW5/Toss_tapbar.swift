//
//  Toss_tapbar.swift
//  Pard_ios
//
//  Created by 박성준 on 10/31/25.
//

import SwiftUI

struct toss_tapbar: View {
    
    @State private var selection = 0
    
    var body: some View {
        VStack {
            ZStack {
                switch selection {
                case 0: Tosshome()
                case 1: Text("혜택 화면")
                case 2: toss_shopping()
                default: Text("기타")
                }
            }
            
            HStack {
                Spacer()
                CustomTabButton(icon: "home", title: "홈", isSelected: selection == 0) {
                    selection = 0
                }
                Spacer()
                CustomTabButton(icon: "diamond", title: "혜택", isSelected: selection ==  1) {
                    selection = 1
                }
                Spacer()
                CustomTabButton(icon: "bag", title: "토스쇼핑", isSelected: selection == 0) {
                    selection = 2
                }
                Spacer()
                CustomTabButton(icon: "stock", title: "증권", isSelected: selection == 0) {
                    selection = 3
                }
                Spacer()
                CustomTabButton(icon: "three", title: "전체", isSelected: selection == 0) {
                    selection = 4
                }
                Spacer()
            }
            .background(
                Color.white
                    .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous)))
            .cornerRadius(20)
            .padding()
            
        }
        
    }
}

struct CustomTabbar: View {
    let icon: String
    let title: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            VStack(spacing: 4) {
                Image(icon)
                    .resizable()
                    .frame(width:22, height:23)
                    
                Text(title)
                    .font(.system(size: 12))
                    .foregroundStyle(.gray)
            }
        }
    }
}
            
#Preview {
    toss_tapbar()
}
