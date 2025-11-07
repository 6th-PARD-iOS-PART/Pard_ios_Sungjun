//
//  UserListView.swift
//  Pard_ios
//
//  Created by 박성준 on 11/7/25.
//
import SwiftUI

struct UserListView: View {
    
    @State private var userList: [getUserModel] = []
    @State private var showSheet: Bool = false
    
    @State private var searchTextField: String = ""
    
    @StateObject var vm = UserViewModel()
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                HStack {
                    TextField("파트 조회하기", text: $searchTextField)
                        .textFieldStyle(.roundedBorder)
                        .padding(.horizontal)
                    
                    Button(action: {
                        Task {
                            // all / iOS / web / server
                            do{
                                if searchTextField == "" {
                                    userList = try await vm.getUserList()
                                }
                                else {
                                    userList = try await vm.getUserList(searchTextField)
                                }
                            } catch {
                                print("❌ Get Error: \(error)")
                            }
                        }
                    }) {
                        Text("검색")
                    }
                    .buttonStyle(.borderedProminent)
                    .padding()
                }
                
                List {
                    ForEach(userList, id: \.self) { user in
                        NavigationLink {
                            UserSheetView(user: user, showSheet: $showSheet)
                        } label: {
                            HStack {
                                Text(user.name)
                                    .font(.title2).bold()
                                
                                Text(String(user.age))
                                    .font(.body)
                                
                                Text(user.part)
                                    .font(.body)
                            }
                        }
                        .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                            Button {
                                // delete
                                Task {
                                    if let id = user.id {
                                       try await vm.deleteUser(id: id)
                                    }
                                    userList = try await vm.getUserList()
                                }
                            } label: {
                                Text("삭제")
                            }
                            .tint(.red)
                        } // : swipeActions
                    }
                } // : List
            } // : VStack
            .task {
                do {
                    userList = try await vm.getUserList()
                } catch {
                    print("❌ Get Error: \(error)")
                }
                
            }
            .navigationTitle("URLSession 실습")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing:
                                    Button(action : {showSheet = true}){
                Text("추가")
            }
            )
            .sheet(isPresented: $showSheet) {
                UserSheetView(showSheet: $showSheet)
            }
            .onChange(of: showSheet) {
                Task{
                    userList = try await vm.getUserList()
                }
            }
        }
    } // : NavigationStack
}



#Preview {
    UserListView()
}
