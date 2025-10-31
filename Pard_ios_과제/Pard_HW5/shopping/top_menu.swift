//
//  top_menu.swift
//  Pard_ios
//
//  Created by 박성준 on 10/31/25.
//

import SwiftUI

struct top_menu: View {
    var body: some View {
        HStack{
            Text("토스쇼핑")
                .font(.system(size: 25))
                .fontWeight(.bold)
            Spacer()
            Image("돋보기")
                .resizable()
                .frame(width: 25, height: 25)
                .padding(.trailing, 15)
            Image("사람")
                .resizable()
                .frame(width: 25, height: 25)
                .padding(.trailing, 15)
            Image("카트")
                .resizable()
                .frame(width: 25, height: 25)
        }
        .padding(.horizontal, 20)
    }
}

#Preview {
    top_menu()
}
