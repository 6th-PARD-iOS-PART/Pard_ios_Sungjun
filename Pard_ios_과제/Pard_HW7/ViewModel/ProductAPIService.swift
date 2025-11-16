//
//  ProductAPIService.swift
//  Pard_ios
//
//  Created by 박성준 on 11/16/25.
//

import Foundation

enum APIError: Error, LocalizedError {
    case invalidURL
    case invalidResponse(statusCode: Int)
    case decodingError
    case encodingError
    case unknown(Error)

    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "잘못된 URL 입니다."
        case .invalidResponse(let statusCode):
            return "서버 응답이 올바르지 않습니다. (code: \(statusCode))"
        case .decodingError:
            return "데이터 디코딩에 실패했습니다."
        case .encodingError:
            return "요청 본문 생성에 실패했습니다."
        case .unknown(let error):
            return "알 수 없는 오류가 발생했습니다: \(error.localizedDescription)"
        }
    }
}


final class ProductAPIService {

    func fetchProducts(_ search: String = "all") async throws -> [Product] {
        //TODO: 상품의 전체 리스트를 받아오세요
            let urlString = BaseURL.baseUrl.rawValue
            
            guard let url = URL(string: "\(urlString)/user?part=\(search)") else {
                throw APIError.invalidURL
            }
            
            do {
                
                let (data, response) = try await URLSession.shared.data(from: url)
                
                
                guard let httpResponse = response as? HTTPURLResponse,
                      (200...299).contains(httpResponse.statusCode) else {
                    throw APIError.invalidResponse(statusCode: (response as? HTTPURLResponse)?.statusCode ?? -1)
                }
                
                do {
                    let users = try JSONDecoder().decode([Product].self, from: data)
                    print("✅ Fetched users: \(users)")
                    return users
                } catch {
                    print("❌ Decoding Error: \(error)")
                    throw APIError.decodingError
                }
                
            } catch {
                print("❌ Network Error: \(error)")
                throw APIError.unknown(error)
            }
        }

    func fetchProduct(id: Int) async throws -> Product {
        let urlString = BaseURL.baseUrl.rawValue
        
        guard let url = URL(string: "\(urlString)/product/\(id)") else {
            throw APIError.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
        do {
            let (responseData, response) = try await URLSession.shared.data(for: request)
            
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                throw APIError.invalidResponse(statusCode: (response as? HTTPURLResponse)?.statusCode ?? -1)
            }
            
            do {
                let product = try JSONDecoder().decode(Product.self, from: responseData)
                print("✅ Product fetched successfully: \(product)")
                return product
            } catch {
                print("❌ Decoding Error: \(error)")
                throw APIError.decodingError
            }
            
        } catch {
            print("❌ Network Error: \(error)")
            throw APIError.unknown(error)
        }
    }

//    func fetchColorCounts() async throws -> [Int] {
//        //TODO: 동일한 색상의 모든 상품 수를 받아오세요.
//    }

    func createProduct(request body: Product) async throws -> Product {
        let urlString = BaseURL.baseUrl.rawValue
        
        guard let url = URL(string: "\(urlString)/product") else {
            throw APIError.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            request.httpBody = try JSONEncoder().encode(body)
        } catch {
            print("❌ Encoding Error: \(error)")
            throw APIError.encodingError
        }
        
        do {
            let (responseData, response) = try await URLSession.shared.data(for: request)
            
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                throw APIError.invalidResponse(statusCode: (response as? HTTPURLResponse)?.statusCode ?? -1)
            }
            
            do {
                let createdProduct = try JSONDecoder().decode(Product.self, from: responseData)
                print("✅ Product created successfully: \(createdProduct)")
                return createdProduct
            } catch {
                print("❌ Decoding Error: \(error)")
                throw APIError.decodingError
            }
            
        } catch {
            print("❌ Network Error: \(error)")
            throw APIError.unknown(error)
        }
    }

    func updateColorCount(request body: [String: Any]) async throws {
        let urlString = BaseURL.baseUrl.rawValue

        guard let url = URL(string: "\(urlString)/product/color/update") else {
            throw APIError.invalidURL
        }

        var request = URLRequest(url: url)
        request.httpMethod = "PATCH"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: body, options: [])
        } catch {
            print("❌ Encoding Error: \(error)")
            throw APIError.encodingError
        }

        do {
            let (_, response) = try await URLSession.shared.data(for: request)

            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                throw APIError.invalidResponse(statusCode: (response as? HTTPURLResponse)?.statusCode ?? -1)
            }

            print("✅ Successfully updated color quantities for: \(body)")

        } catch {
            print("❌ Network Error: \(error)")
            throw APIError.unknown(error)
        }
    }

}


