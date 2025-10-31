//
//  toss_shopping.swift
//  Pard_ios
//
//  Created by 박성준 on 10/31/25.
//

import SwiftUI

struct toss_shopping: View {
    @StateObject private var viewModel = ShoppingViewModel() // ✅ 뷰모델 생성
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                top_menu()
                    .padding(.bottom, 20)
                
                // ✅ top_tapbar와 ViewModel의 selectedCategory 연결
                top_tapbar(selected: $viewModel.selectedCategory)
                
                // ✅ 뷰모델을 전달
                shoppinglist_view(viewModel: viewModel)
            }
        }
    }
}

#Preview {
    toss_shopping()
}
