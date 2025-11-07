//
//  UserSheetView.swift
//  Pard_ios
//
//  Created by 박성준 on 11/7/25.
//
import Foundation
import SwiftUI

struct UserSheetView : View {
    
    @Environment(\.dismiss) private var dismiss
    
    var user: getUserModel? = nil
    
    var isNewUser: Bool {
        self.user == nil ? true : false
    }
    
    @StateObject var vm = UserViewModel()
    
    @Binding var showSheet: Bool
    @State var name: String = ""
    @State var age: String = ""
    @State var part: String = ""
    
    @State private var errorMessage: String = ""
    
    var body: some View {
        VStack{
            
            Text(isNewUser ? "새로운 멤버 추가하기" : "기존 멤버 수정하기")
                .font(.largeTitle).bold()
                .padding()
            
            HStack{
                Text("이름:")
                    .padding(.leading, 15)
                
                TextField("이름을 입력하세요", text: $name)
                    .textFieldStyle(.roundedBorder)
                    .padding(.horizontal)
            }
            
            HStack{
                Text("나이:")
                    .padding(.leading, 15)
                
                TextField("나이를 입력하세요", text: $age)
                    .textFieldStyle(.roundedBorder)
                    .keyboardType(.numberPad)
                    .padding(.horizontal)
            }
            
            HStack{
                Text("파트:")
                    .padding(.leading, 15)
                
                TextField("파트를 입력하세요", text: $part)
                    .textFieldStyle(.roundedBorder)
                    .padding(.horizontal)
            }
            
            
            // 에러 메시지
            if !errorMessage.isEmpty {
                Text(errorMessage)
                    .foregroundColor(.red)
                    .padding()
            }
            
            
            Button(action:{
                //post
                if name.isEmpty || age.isEmpty || part.isEmpty {
                    errorMessage = "모든 항목을 입력해주세요."
                }else {
                    errorMessage = ""  // 에러 메시지 초기화
                    
                    Task {
                        if isNewUser {
                            //추가
                            let newUser = UserModel(user_name: name, user_age: Int(age) ?? 0, pard_part: part)
                            await vm.postUser(data: newUser)
                            showSheet = false
                            
                        } else {
                            // 수정
                            let newUser = UserModel(user_name: name, user_age: Int(age) ?? 0, pard_part: part)
                            if let id = user?.id {
                               try await vm.updateUser(id: id, data: newUser)
                            }
                            
                            dismiss()
                        }
                    } // Task
                    
                }
                
            }){
                Text(isNewUser ? "추가" : "수정")
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            .padding()
            
            Spacer()
            
        } // VStack
        .onAppear {
            if let user = user {
                name = user.name
                age = String(user.age)
                part = user.part
            }
        }
    }
    
}
