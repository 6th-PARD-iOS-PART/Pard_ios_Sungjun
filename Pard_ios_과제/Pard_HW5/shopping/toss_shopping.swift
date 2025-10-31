//
//  toss_shopping.swift
//  Pard_ios
//
//  Created by 박성준 on 10/31/25.
//

import SwiftUI

struct toss_shopping: View {
    @StateObject private var viewModel = ShoppingViewModel()
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                top_menu()
                    .padding(.bottom, 20)
                
                top_tapbar(selected: $viewModel.selectedCategory)
                
                shoppinglist_view(viewModel: viewModel)
            }
        }
    }
}

#Preview {
    toss_shopping()
}
