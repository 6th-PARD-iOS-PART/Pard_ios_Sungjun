//
//  ProductDetailView.swift
//  Pard_ios
//
//  Created by 박성준 on 11/16/25.
//

import SwiftUI

struct ProductDetailView: View {
    enum Mode: Hashable {
        case create
        case edit(Product)
    }

    @ObservedObject var viewModel: ProductViewModel
    let mode: Mode

    @Environment(\.dismiss) private var dismiss

    @State private var name: String
    @State private var price: String
    @State private var count: String
    @State private var color: String
    @State private var sellable: Bool
    @State private var errorMessage: String?

    init(viewModel: ProductViewModel, mode: Mode) {
        self.viewModel = viewModel
        self.mode = mode

        switch mode {
        case .create:
            _name = State(initialValue: "")
            _price = State(initialValue: "")
            _count = State(initialValue: "")
            _color = State(initialValue: "")
            _sellable = State(initialValue: true)
        case .edit(let product):
            _name = State(initialValue: product.name)
            _price = State(initialValue: "\(product.price)")
            _count = State(initialValue: "\(product.count)")
            _color = State(initialValue: product.color)
            _sellable = State(initialValue: product.sellable)
        }
    }

    var body: some View {
        Form {
            productInfoSection
            errorSection
        }
        .navigationTitle(navigationTitle)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .confirmationAction) {
                Button("저장") {
                    saveChanges()
                }
                .disabled(!isFormValid)
            }
        }
        .onChange(of: viewModel.selectedProduct) { updated in
            guard
                case .edit(let original) = mode,
                let updated,
                updated.id == original.id
            else {
                return
            }

            apply(updatedProduct: updated)
        }
    }

    private var isFormValid: Bool {
        !name.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty &&
        !color.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty &&
        Int(price) != nil &&
        Int(count) != nil
    }

    private func saveChanges() {
        guard let priceValue = Int(price), priceValue >= 0 else {
            errorMessage = "가격은 0 이상의 숫자로 입력해주세요."
            return
        }

        guard let countValue = Int(count), countValue >= 0 else {
            errorMessage = "수량은 0 이상의 숫자로 입력해주세요."
            return
        }

        errorMessage = nil

        switch mode {
        case .create:
            viewModel.createProduct(
                name: name,
                price: priceValue,
                count: countValue,
                color: color,
                sellable: sellable
            )
        case .edit(let product):
            viewModel.updateProduct(
                id: product.id ?? 0,
                name: name,
                price: priceValue,
                count: countValue,
                color: color,
                sellable: sellable
            )
        }

        dismiss()
    }

    private var navigationTitle: String {
        switch mode {
        case .create:
            return "새 상품 추가"
        case .edit:
            return "상세 정보"
        }
    }

    private var productInfoSection: some View {
        Section(header: Text("상품 정보")) {
            TextField("상품명", text: $name)
            TextField("가격", text: $price)
                .keyboardType(.numberPad)
            TextField("수량", text: $count)
                .keyboardType(.numberPad)
            TextField("색상", text: $color)
            Toggle("판매 가능", isOn: $sellable)
        }
    }


    @ViewBuilder
    private var errorSection: some View {
        if let errorMessage {
            Section {
                Text(errorMessage)
                    .foregroundColor(.red)
            }
        }
    }

    private func apply(updatedProduct: Product) {
        name = updatedProduct.name
        price = "\(updatedProduct.price)"
        count = "\(updatedProduct.count)"
        color = updatedProduct.color
        sellable = updatedProduct.sellable
    }
}
