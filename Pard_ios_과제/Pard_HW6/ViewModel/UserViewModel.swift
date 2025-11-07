//
//  UserViewModel.swift
//  Pard_ios
//
//  Created by 박성준 on 11/7/25.
//
import SwiftUI
import Combine

final class UserViewModel: ObservableObject {
    
    //MARK: - get
    public func getUserList(_ search: String = "all") async throws -> [getUserModel] {
        let urlString = BaseURL.baseUrl.rawValue
        
        guard let url = URL(string: "\(urlString)/user?part=\(search)") else {
            throw ErrorType.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let HTTPresponse = response as? HTTPURLResponse, (200...299).contains(HTTPresponse.statusCode) else{
            throw ErrorType.invalidResponse
        }
        
        do{
            let data = try JSONDecoder().decode([getUserModel].self, from:data)
            print(data)
            
            return(data)
        } catch {
            print(error)
            throw ErrorType.networkError
        }
    }

    //MARK: - delete
    //"deleteUser" 함수를 작성하시오.
    public func deleteUser(id: Int) async throws {
        let urlString = BaseURL.baseUrl.rawValue
        guard let url = URL(string: "\(urlString)/user/\(id)")
        else {
            throw ErrorType.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"
        
        do {
            let (_, response) = try await URLSession.shared.data(for: request)
            
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode)
            else {
                throw ErrorType.invalidResponse
            }
            
            print("User \(id) successfully deleted.")
            
        }
        
        catch {
            print("Delete Error: \(error)")
            throw ErrorType.networkError
        }
    }
    
    //MARK: - post
    //"postUser" 함수를 작성하시오.
    public func postUser(data: UserModel) async {

        let urlString = BaseURL.baseUrl.rawValue
        guard let url = URL(string: "\(urlString)/user") else {
            print("❌ invalidURL")
            return
        }

        let newUser = UserModel(user_name: data.user_name, user_age: data.user_age, pard_part: data.pard_part)

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        do {
            request.httpBody = try JSONEncoder().encode(newUser)
        } catch {
            print("❌ Encodin error: \(error)")
            return
        }

        do {
            let (_, response) = try await URLSession.shared.data(for: request)

            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                print("❌ error: \(response)")
                return
            }

        } catch {
            print("❌ Network error: \(error)")
        }
    }
    //MARK: - PATCH
    //"updateUser" 함수를 작성하시오.
    public func updateUser(id: Int, data: UserModel) async throws {
        let urlString = BaseURL.baseUrl.rawValue
        guard let url = URL(string: "\(urlString)/user/\(id)")
        else {
            throw ErrorType.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "PATCH"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            let body = try JSONEncoder().encode(data)
            request.httpBody = body
        }
        catch {
            throw ErrorType.networkError
        }
        
        do {
            let(_, response) = try await URLSession.shared.data(for: request)
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode)
            else {
                throw ErrorType.invalidResponse
            }
            
            print("User\(id) successfully updated.")
        }
        catch {
            print("Update Error: \(error)")
            throw ErrorType.networkError
        }
    }
}
