//
//  top_tapbar.swift
//  Pard_ios
//
//  Created by 박성준 on 10/31/25.
//

import SwiftUI

struct top_tapbar: View {
    @Binding var selected: String  
    let tabs = ["모두", "특가", "식품", "악세사리", "전자제품", "뷰티"]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 30) {
                ForEach(tabs, id: \.self) { tab in
                    VStack {
                        Text(tab)
                            .font(.system(size: 15))
                            .foregroundStyle(selected == tab ? .blue : .gray)
                            .onTapGesture {
                                withAnimation(.easeInOut(duration: 0.2)) {
                                    selected = tab
                                }
                            }
                        Rectangle()
                            .fill(selected == tab ? Color.blue : Color.gray)
                            .frame(height: 2)
                    }
                }
            }
            .padding(.horizontal, 20)
        }
    }
}

#Preview {
    top_tapbar(selected: .constant("모두"))
}
