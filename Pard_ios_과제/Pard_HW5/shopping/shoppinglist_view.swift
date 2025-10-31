import SwiftUI

struct shoppinglist_view: View {
    @ObservedObject var viewModel: ShoppingViewModel
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 20) {
                
                if viewModel.selectedCategory == "모두" { // 모두 일때만 맨위 첫번재 상자가 보임
                    firstbox
                }
                
                
                // 상품의 원가의 가격에 따라 정렬하게 함 (낮은 가격부터 높은 가격으로)
                ForEach(Array(viewModel.filteredItems.sorted { $0.price < $1.price }.enumerated()), id: \.element.name) { index, item in
                    itemlist(index: index, item: item)
                }
            }
            .padding()
            .background(Color.white)
        }
    }
    
    var firstbox: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .fill(Color(.systemGray6))
                .frame(height: 180)
            
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text("1천원대부터")
                        .font(.system(size: 17, weight: .bold))
                    Text("고르는 국민간식")
                        .font(.system(size: 17, weight: .bold))
                        .padding(.bottom, 10)
                    Text("삼립식품 초저가 구매하기")
                        .foregroundStyle(.gray)
                        .font(.system(size: 13))
                }
                Spacer()
                Image("간식")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 125)
            }
            .padding(.horizontal, 25)
        }
    }
    
    @ViewBuilder
    func itemlist(index: Int, item: itemData) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            
            if viewModel.selectedCategory == "모두" { // 모두일때 이 글자들이 보이게 함
                if index == 0 {
                    HStack {
                        Text("하루특가")
                            .font(.system(size: 20, weight: .bold))
                        Spacer()
                        Text("전체보기")
                            .foregroundStyle(.gray)
                        Image("볼드오른쪽")
                            .resizable()
                            .frame(width: 10, height: 15)
                    }
                    .padding(.horizontal, 5)
                } else if index == 1 {
                    Text("오늘의 상품")
                        .font(.system(size: 20, weight: .bold))
                        .padding(.horizontal, 5)
                }
            }
            
            ZStack {
                RoundedRectangle(cornerRadius: 15)
                    .fill(Color(.systemGray6))
                    .frame(height: 180)
                
                Image(item.image)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 130)
                    .padding(.horizontal, 30)
                
                // 할인율이 20퍼 넘으면 최저가 보장 스티커 붙이게 하는것 모든 카테고리에 적용되기 때문에 굳이 로직으로 따로 안뺌
                if (Double(item.price - item.discount) / Double(item.price)) * 100 >= 20 {
                    VStack {
                        HStack {
                            Text("최저가 보장")
                                .font(.system(size: 12, weight: .bold))
                                .foregroundColor(.white)
                                .padding(.vertical, 4)
                                .padding(.horizontal, 10)
                                .background(Color.pink)
                                .cornerRadius(10)
                            Spacer()
                        }
                        Spacer()
                    }
                    .padding(10)
                }
            }
            
            Text(item.name)
                .font(.system(size: 15, weight: .semibold))
                .foregroundColor(.black)
                .lineLimit(2)
                .padding(.horizontal, 5)
            
            HStack(spacing: 6) {
                Text("\(item.discount.formatted())원")
                    .font(.system(size: 17, weight: .bold))
                    .foregroundColor(.black)
                
                Text("\(item.price.formatted())원")
                    .font(.system(size: 14))
                    .foregroundColor(.gray)
                
                Text("💎 토스프라임 \(item.point.formatted())원 적립")
                    .font(.system(size: 12, weight: .semibold))
                    .foregroundColor(Color.blue)
                    .padding(.vertical, 4)
                    .padding(.horizontal, 8)
                    .background(Color.blue.opacity(0.1))
                    .cornerRadius(12)
            }
            .padding(.horizontal, 5)
            
            Text(item.ps)
                .font(.system(size: 12))
                .foregroundColor(.gray)
                .padding(.horizontal, 5)
        }
        .padding(.bottom, 10)
        .background(Color.white)
        .cornerRadius(15)
    }
}

#Preview {
    shoppinglist_view(viewModel: ShoppingViewModel())
}
