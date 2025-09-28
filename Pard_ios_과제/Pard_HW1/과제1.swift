
//  calculator.swift
//
//  파드 과제 1
//
//  Created by 박성준 on 9/15/25.
//

import SwiftUI

struct DigitalClockView: View {
    @State private var currentTime = Date()
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
            Text(dateFormatter.string(from: currentTime)) // ➜ "시 분 초 방식"
                .font(.system(size: 20, weight: .bold))
                .monospacedDigit()
                .onReceive(timer) { currentTime = $0 } // 시스템 시간 받아옴
        }

        private var dateFormatter: DateFormatter {
            let f = DateFormatter()
            f.locale = Locale(identifier: "ko_KR")
            f.dateFormat = "HH:mm"              // 시 분 까지만 표기
            return f
        }
    }

struct CalculatorView: View {
    var body: some View {
        
        
        
        ZStack (alignment: .topLeading){ //시계위치
            Color.black.ignoresSafeArea(edges: .all) // 전체 배경색
            
            //time
            
            DigitalClockView()
                    .foregroundColor(.white)
                    .padding(.leading, 50)
                    .padding(.top, 25) // SafeArea 무시 → 화면 완전 최상단
                    .ignoresSafeArea(edges: .top)
            
            VStack(spacing: 5) {
                
                HStack {
                    
                    //list button
                    
                    Button() {
                        print("눌림")
                    }
                    label: {
                        Image(systemName: "list.bullet") //sf symbol 가져오기
                            .font(.system(size: 30))// 버튼 글자 크기
                            .foregroundColor(.white) //버튼 글자 색
                            .frame(width: 50, height: 50) //버튼 원 크기
                            .background(Circle().fill(Color(red: 0.2, green: 0.2, blue: 0.2)))
                            .overlay( // 윤곽선
                                Circle()
                                    .trim(from: 0, to:0.25) //윤곽선 시작, 끝 지정
                                    .stroke(LinearGradient(
                                        gradient: Gradient(colors:  [Color.white.opacity(0.8), Color.clear]),
                                        startPoint: .bottom,
                                        endPoint: .top),
                                            lineWidth: 0.5).rotationEffect(.degrees(150))) //윤곽선 색, 투명도, 위치조정, 두께, 그라데이션
                        
                            .overlay(
                                Circle()
                                    .trim(from: 0.25, to:0.5)
                                    .stroke(LinearGradient(
                                        gradient: Gradient(colors: [Color.white.opacity(0.8), Color.clear]),
                                        startPoint: .bottom,
                                        endPoint: .top),
                                            lineWidth: 0.5).rotationEffect(.degrees(150)))
                        
                            .overlay(
                                Circle()
                                    .trim(from: 0.0, to:0.25)
                                    .stroke(LinearGradient(
                                        gradient: Gradient(colors: [Color.white.opacity(0.8), Color.clear]),
                                        startPoint: .bottom,
                                        endPoint: .top),
                                            lineWidth: 0.5).rotationEffect(.degrees(330)))
                        
                        
                            .overlay(
                                Circle()
                                    .trim(from: 0.25, to:0.5)
                                    .stroke(LinearGradient(
                                        gradient: Gradient(colors: [Color.white.opacity(0.8), Color.clear]),
                                        startPoint: .bottom,
                                        endPoint: .top),
                                            lineWidth: 0.5).rotationEffect(.degrees(330)))
                        // 윤곽선의 그라데이션 표현, 각 버튼당 2개표시 위해 4개 만듦
                            .padding(.leading,20)
                        
                        // 이하 각 버튼 생성방식 동일 (노가다)
                    }
                    Spacer()
                    
                    // mode button
                    
                    Button() {
                        print("눌림")
                    }
                    label: {
                        Image("cal") //sf symbol에 계산기 없어서 이미지 가져옴
                            .resizable()
                            .scaledToFit()
                            .padding(10)
                            .font(.system(size: 30, weight: .bold))
                            .foregroundColor(.white)
                            .frame(width: 50, height: 50)
                            .background(Circle().fill(Color(red: 0.2, green: 0.2, blue: 0.2)))
                            .overlay(
                                Circle()
                                    .trim(from: 0, to:0.25)
                                    .stroke(LinearGradient(
                                        gradient: Gradient(colors: [Color.white.opacity(0.8), Color.clear]),
                                        startPoint: .bottom,
                                        endPoint: .top),
                                            lineWidth: 0.5).rotationEffect(.degrees(150)))
                        
                            .overlay(
                                Circle()
                                    .trim(from: 0.25, to:0.5)
                                    .stroke(LinearGradient(
                                        gradient: Gradient(colors: [Color.white.opacity(0.8), Color.clear]),
                                        startPoint: .bottom,
                                        endPoint: .top),
                                            lineWidth: 0.5).rotationEffect(.degrees(150)))
                        
                            .overlay(
                                Circle()
                                    .trim(from: 0.0, to:0.25)
                                    .stroke(LinearGradient(
                                        gradient: Gradient(colors: [Color.white.opacity(0.8), Color.clear]),
                                        startPoint: .bottom,
                                        endPoint: .top),
                                            lineWidth: 0.5).rotationEffect(.degrees(330)))
                        
                        
                            .overlay(
                                Circle()
                                    .trim(from: 0.25, to:0.5)
                                    .stroke(LinearGradient(
                                        gradient: Gradient(colors: [Color.white.opacity(0.8), Color.clear]),
                                        startPoint: .bottom,
                                        endPoint: .top),
                                            lineWidth: 0.5).rotationEffect(.degrees(330)))
                            .padding(.trailing,20)
                    }
                    
                }
                                    
                Spacer()
                
                //result 0
                
                HStack {
                    
                    Spacer()
    
                    
                    Text("0").font(.system(size: 70)).foregroundColor(.white)
                        .padding(.trailing,10)
                    
                }
                
                //row 1
                
                HStack {
                    
                    
                    Button("⌫") {
                        print("눌림")
                    }
                    .font(.system(size: 50))
                    .foregroundColor(.white)
                    .frame(width: 90, height: 90)
                    .background(Circle().fill(Color.gray))
                    .overlay(
                                Circle()
                                    .trim(from: 0, to:0.25)
                                    .stroke(LinearGradient(
                                        gradient: Gradient(colors: [Color.white.opacity(0.8), Color.clear]),
                                        startPoint: .bottom,
                                        endPoint: .top),
                                    lineWidth: 1).rotationEffect(.degrees(150)))
                    
                    .overlay(
                                Circle()
                                    .trim(from: 0.25, to:0.5)
                                    .stroke(LinearGradient(
                                        gradient: Gradient(colors: [Color.white.opacity(0.8), Color.clear]),
                                        startPoint: .bottom,
                                        endPoint: .top),
                                    lineWidth: 1).rotationEffect(.degrees(150)))
                    
                    .overlay(
                                Circle()
                                    .trim(from: 0.0, to:0.25)
                                    .stroke(LinearGradient(
                                        gradient: Gradient(colors: [Color.white.opacity(0.8), Color.clear]),
                                        startPoint: .bottom,
                                        endPoint: .top),
                                    lineWidth: 1).rotationEffect(.degrees(330)))
                            
                    
                    .overlay(
                                Circle()
                                    .trim(from: 0.25, to:0.5)
                                    .stroke(LinearGradient(
                                        gradient: Gradient(colors: [Color.white.opacity(0.8), Color.clear]),
                                        startPoint: .bottom,
                                        endPoint: .top),
                                    lineWidth: 1).rotationEffect(.degrees(330)))
                    
                    Button("AC") {
                        print("눌림")
                    }
                    .font(.system(size: 40))   // 안의 글자 크기 고정
                    .foregroundColor(.white)
                    .frame(width: 90, height: 90)           // 버튼 전체 크기 (원 크기)
                    .background(Circle().fill(Color.gray))
                    
                    .overlay(
                                Circle()
                                    .trim(from: 0, to:0.25)
                                    .stroke(LinearGradient(
                                        gradient: Gradient(colors: [Color.white.opacity(0.8), Color.clear]),
                                        startPoint: .bottom,
                                        endPoint: .top),
                                    lineWidth: 1).rotationEffect(.degrees(150)))
                    
                    .overlay(
                                Circle()
                                    .trim(from: 0.25, to:0.5)
                                    .stroke(LinearGradient(
                                        gradient: Gradient(colors: [Color.white.opacity(0.8), Color.clear]),
                                        startPoint: .bottom,
                                        endPoint: .top),
                                    lineWidth: 1).rotationEffect(.degrees(150)))
                    
                    .overlay(
                                Circle()
                                    .trim(from: 0.0, to:0.25)
                                    .stroke(LinearGradient(
                                        gradient: Gradient(colors: [Color.white.opacity(0.8), Color.clear]),
                                        startPoint: .bottom,
                                        endPoint: .top),
                                    lineWidth: 1).rotationEffect(.degrees(330)))
                            
                    
                    .overlay(
                                Circle()
                                    .trim(from: 0.25, to:0.5)
                                    .stroke(LinearGradient(
                                        gradient: Gradient(colors: [Color.white.opacity(0.8), Color.clear]),
                                        startPoint: .bottom,
                                        endPoint: .top),
                                    lineWidth: 1).rotationEffect(.degrees(330)))
                        
                    
                    
                    Button() {
                        print("눌림")
                    }
                        label: {
                                Image(systemName: "percent")
                                    .font(.system(size: 35))
                                    .foregroundColor(.white)
                                    .frame(width: 90, height: 90)
                                    .background(Circle().fill(Color.gray))
                                    .overlay(
                                                Circle()
                                                    .trim(from: 0, to:0.25)
                                                    .stroke(LinearGradient(
                                                        gradient: Gradient(colors: [Color.white.opacity(0.8), Color.clear]),
                                                        startPoint: .bottom,
                                                        endPoint: .top),
                                                    lineWidth: 1).rotationEffect(.degrees(150)))
                                    
                                    .overlay(
                                                Circle()
                                                    .trim(from: 0.25, to:0.5)
                                                    .stroke(LinearGradient(
                                                        gradient: Gradient(colors: [Color.white.opacity(0.8), Color.clear]),
                                                        startPoint: .bottom,
                                                        endPoint: .top),
                                                    lineWidth: 1).rotationEffect(.degrees(150)))
                                    
                                    .overlay(
                                                Circle()
                                                    .trim(from: 0.0, to:0.25)
                                                    .stroke(LinearGradient(
                                                        gradient: Gradient(colors: [Color.white.opacity(0.8), Color.clear]),
                                                        startPoint: .bottom,
                                                        endPoint: .top),
                                                    lineWidth: 1).rotationEffect(.degrees(330)))
                                            
                                    
                                    .overlay(
                                                Circle()
                                                    .trim(from: 0.25, to:0.5)
                                                    .stroke(LinearGradient(
                                                        gradient: Gradient(colors: [Color.white.opacity(0.8), Color.clear]),
                                                        startPoint: .bottom,
                                                        endPoint: .top),
                                                    lineWidth: 1).rotationEffect(.degrees(330)))
                            }
                    
                    Button() {
                        print("눌림")
                    }
                        label: {
                                Image(systemName: "divide")
                                    .font(.system(size: 40))
                                    .foregroundColor(.white)
                                    .frame(width: 90, height: 90)
                                    .background(Circle().fill(Color.orange))
                                    .overlay(
                                                Circle()
                                                    .trim(from: 0, to:0.25)
                                                    .stroke(LinearGradient(
                                                        gradient: Gradient(colors: [Color.white.opacity(0.8), Color.clear]),
                                                        startPoint: .bottom,
                                                        endPoint: .top),
                                                    lineWidth: 1).rotationEffect(.degrees(150)))
                                    
                                    .overlay(
                                                Circle()
                                                    .trim(from: 0.25, to:0.5)
                                                    .stroke(LinearGradient(
                                                        gradient: Gradient(colors: [Color.white.opacity(0.8), Color.clear]),
                                                        startPoint: .bottom,
                                                        endPoint: .top),
                                                    lineWidth: 1).rotationEffect(.degrees(150)))
                                    
                                    .overlay(
                                                Circle()
                                                    .trim(from: 0.0, to:0.25)
                                                    .stroke(LinearGradient(
                                                        gradient: Gradient(colors: [Color.white.opacity(0.8), Color.clear]),
                                                        startPoint: .bottom,
                                                        endPoint: .top),
                                                    lineWidth: 1).rotationEffect(.degrees(330)))
                                            
                                    
                                    .overlay(
                                                Circle()
                                                    .trim(from: 0.25, to:0.5)
                                                    .stroke(LinearGradient(
                                                        gradient: Gradient(colors: [Color.white.opacity(0.8), Color.clear]),
                                                        startPoint: .bottom,
                                                        endPoint: .top),
                                                    lineWidth: 1).rotationEffect(.degrees(330)))
                            }
                }
                
                //row 2
                
                HStack {
                    Button("7") {
                        print("눌림")
                    }
                    .font(.system(size: 40))   // 안의 글자 크기 고정
                    .foregroundColor(.white)
                    .frame(width: 90, height: 90)           // 버튼 전체 크기 (원 크기)
                    .background(Circle().fill(Color(UIColor.darkGray)))
                    .overlay(
                                Circle()
                                    .trim(from: 0, to:0.25)
                                    .stroke(LinearGradient(
                                        gradient: Gradient(colors: [Color.white.opacity(0.8), Color.clear]),
                                        startPoint: .bottom,
                                        endPoint: .top),
                                    lineWidth: 1).rotationEffect(.degrees(150)))
                    
                    .overlay(
                                Circle()
                                    .trim(from: 0.25, to:0.5)
                                    .stroke(LinearGradient(
                                        gradient: Gradient(colors: [Color.white.opacity(0.8), Color.clear]),
                                        startPoint: .bottom,
                                        endPoint: .top),
                                    lineWidth: 1).rotationEffect(.degrees(150)))
                    
                    .overlay(
                                Circle()
                                    .trim(from: 0.0, to:0.25)
                                    .stroke(LinearGradient(
                                        gradient: Gradient(colors: [Color.white.opacity(0.8), Color.clear]),
                                        startPoint: .bottom,
                                        endPoint: .top),
                                    lineWidth: 1).rotationEffect(.degrees(330)))
                            
                    
                    .overlay(
                                Circle()
                                    .trim(from: 0.25, to:0.5)
                                    .stroke(LinearGradient(
                                        gradient: Gradient(colors: [Color.white.opacity(0.8), Color.clear]),
                                        startPoint: .bottom,
                                        endPoint: .top),
                                    lineWidth: 1).rotationEffect(.degrees(330)))
                            
                    
                
                                        
                    Button("8") {
                        print("눌림")
                    }
                    .font(.system(size: 40))   // 안의 글자 크기 고정
                    .foregroundColor(.white)
                    .frame(width: 90, height: 90)           // 버튼 전체 크기 (원 크기)
                    .background(Circle().fill(Color(UIColor.darkGray)))
                    .overlay(
                                Circle()
                                    .trim(from: 0, to:0.25)
                                    .stroke(LinearGradient(
                                        gradient: Gradient(colors: [Color.white.opacity(0.8), Color.clear]),
                                        startPoint: .bottom,
                                        endPoint: .top),
                                    lineWidth: 1).rotationEffect(.degrees(150)))
                    
                    .overlay(
                                Circle()
                                    .trim(from: 0.25, to:0.5)
                                    .stroke(LinearGradient(
                                        gradient: Gradient(colors: [Color.white.opacity(0.8), Color.clear]),
                                        startPoint: .bottom,
                                        endPoint: .top),
                                    lineWidth: 1).rotationEffect(.degrees(150)))
                    
                    .overlay(
                                Circle()
                                    .trim(from: 0.0, to:0.25)
                                    .stroke(LinearGradient(
                                        gradient: Gradient(colors: [Color.white.opacity(0.8), Color.clear]),
                                        startPoint: .bottom,
                                        endPoint: .top),
                                    lineWidth: 1).rotationEffect(.degrees(330)))
                            
                    
                    .overlay(
                                Circle()
                                    .trim(from: 0.25, to:0.5)
                                    .stroke(LinearGradient(
                                        gradient: Gradient(colors: [Color.white.opacity(0.8), Color.clear]),
                                        startPoint: .bottom,
                                        endPoint: .top),
                                    lineWidth: 1).rotationEffect(.degrees(330)))
                    
                    Button("9") {
                        print("눌림")
                    }
                    .font(.system(size: 40))   // 안의 글자 크기 고정
                    .foregroundColor(.white)
                    .frame(width: 90, height: 90)           // 버튼 전체 크기 (원 크기)
                    .background(Circle().fill(Color(UIColor.darkGray)))
                    .overlay(
                                Circle()
                                    .trim(from: 0, to:0.25)
                                    .stroke(LinearGradient(
                                        gradient: Gradient(colors: [Color.white.opacity(0.8), Color.clear]),
                                        startPoint: .bottom,
                                        endPoint: .top),
                                    lineWidth: 1).rotationEffect(.degrees(150)))
                    
                    .overlay(
                                Circle()
                                    .trim(from: 0.25, to:0.5)
                                    .stroke(LinearGradient(
                                        gradient: Gradient(colors: [Color.white.opacity(0.8), Color.clear]),
                                        startPoint: .bottom,
                                        endPoint: .top),
                                    lineWidth: 1).rotationEffect(.degrees(150)))
                    
                    .overlay(
                                Circle()
                                    .trim(from: 0.0, to:0.25)
                                    .stroke(LinearGradient(
                                        gradient: Gradient(colors: [Color.white.opacity(0.8), Color.clear]),
                                        startPoint: .bottom,
                                        endPoint: .top),
                                    lineWidth: 1).rotationEffect(.degrees(330)))
                            
                    
                    .overlay(
                                Circle()
                                    .trim(from: 0.25, to:0.5)
                                    .stroke(LinearGradient(
                                        gradient: Gradient(colors: [Color.white.opacity(0.8), Color.clear]),
                                        startPoint: .bottom,
                                        endPoint: .top),
                                    lineWidth: 1).rotationEffect(.degrees(330)))
                            
                    
                    Button() {
                        print("눌림")
                    }
                        label: {
                                Image(systemName: "multiply")
                                    .font(.system(size: 40))
                                    .foregroundColor(.white)
                                    .frame(width: 90, height: 90)
                                    .background(Circle().fill(Color.orange))
                                    .overlay(
                                                Circle()
                                                    .trim(from: 0, to:0.25)
                                                    .stroke(LinearGradient(
                                                        gradient: Gradient(colors: [Color.white.opacity(0.8), Color.clear]),
                                                        startPoint: .bottom,
                                                        endPoint: .top),
                                                    lineWidth: 1).rotationEffect(.degrees(150)))
                                    
                                    .overlay(
                                                Circle()
                                                    .trim(from: 0.25, to:0.5)
                                                    .stroke(LinearGradient(
                                                        gradient: Gradient(colors: [Color.white.opacity(0.8), Color.clear]),
                                                        startPoint: .bottom,
                                                        endPoint: .top),
                                                    lineWidth: 1).rotationEffect(.degrees(150)))
                                    
                                    .overlay(
                                                Circle()
                                                    .trim(from: 0.0, to:0.25)
                                                    .stroke(LinearGradient(
                                                        gradient: Gradient(colors: [Color.white.opacity(0.8), Color.clear]),
                                                        startPoint: .bottom,
                                                        endPoint: .top),
                                                    lineWidth: 1).rotationEffect(.degrees(330)))
                                            
                                    
                                    .overlay(
                                                Circle()
                                                    .trim(from: 0.25, to:0.5)
                                                    .stroke(LinearGradient(
                                                        gradient: Gradient(colors: [Color.white.opacity(0.8), Color.clear]),
                                                        startPoint: .bottom,
                                                        endPoint: .top),
                                                    lineWidth: 1).rotationEffect(.degrees(330)))
                            }
                }
                
                //row 3
                
                HStack {
                    Button("4") {
                        print("눌림")
                    }
                    .font(.system(size: 40))   // 안의 글자 크기 고정
                    .foregroundColor(.white)
                    .frame(width: 90, height: 90)           // 버튼 전체 크기 (원 크기)
                    .background(Circle().fill(Color(UIColor.darkGray)))
                    .overlay(
                                Circle()
                                    .trim(from: 0, to:0.25)
                                    .stroke(LinearGradient(
                                        gradient: Gradient(colors: [Color.white.opacity(0.8), Color.clear]),
                                        startPoint: .bottom,
                                        endPoint: .top),
                                    lineWidth: 1).rotationEffect(.degrees(150)))
                    
                    .overlay(
                                Circle()
                                    .trim(from: 0.25, to:0.5)
                                    .stroke(LinearGradient(
                                        gradient: Gradient(colors: [Color.white.opacity(0.8), Color.clear]),
                                        startPoint: .bottom,
                                        endPoint: .top),
                                    lineWidth: 1).rotationEffect(.degrees(150)))
                    
                    .overlay(
                                Circle()
                                    .trim(from: 0.0, to:0.25)
                                    .stroke(LinearGradient(
                                        gradient: Gradient(colors: [Color.white.opacity(0.8), Color.clear]),
                                        startPoint: .bottom,
                                        endPoint: .top),
                                    lineWidth: 1).rotationEffect(.degrees(330)))
                            
                    
                    .overlay(
                                Circle()
                                    .trim(from: 0.25, to:0.5)
                                    .stroke(LinearGradient(
                                        gradient: Gradient(colors: [Color.white.opacity(0.8), Color.clear]),
                                        startPoint: .bottom,
                                        endPoint: .top),
                                    lineWidth: 1).rotationEffect(.degrees(330)))
                    
                
                                        
                    Button("5") {
                        print("눌림")
                    }
                    .font(.system(size: 40))   // 안의 글자 크기 고정
                    .foregroundColor(.white)
                    .frame(width: 90, height: 90)           // 버튼 전체 크기 (원 크기)
                    .background(Circle().fill(Color(UIColor.darkGray)))
                    .overlay(
                                Circle()
                                    .trim(from: 0, to:0.25)
                                    .stroke(LinearGradient(
                                        gradient: Gradient(colors: [Color.white.opacity(0.8), Color.clear]),
                                        startPoint: .bottom,
                                        endPoint: .top),
                                    lineWidth: 1).rotationEffect(.degrees(150)))
                    
                    .overlay(
                                Circle()
                                    .trim(from: 0.25, to:0.5)
                                    .stroke(LinearGradient(
                                        gradient: Gradient(colors: [Color.white.opacity(0.8), Color.clear]),
                                        startPoint: .bottom,
                                        endPoint: .top),
                                    lineWidth: 1).rotationEffect(.degrees(150)))
                    
                    .overlay(
                                Circle()
                                    .trim(from: 0.0, to:0.25)
                                    .stroke(LinearGradient(
                                        gradient: Gradient(colors: [Color.white.opacity(0.8), Color.clear]),
                                        startPoint: .bottom,
                                        endPoint: .top),
                                    lineWidth: 1).rotationEffect(.degrees(330)))
                            
                    
                    .overlay(
                                Circle()
                                    .trim(from: 0.25, to:0.5)
                                    .stroke(LinearGradient(
                                        gradient: Gradient(colors: [Color.white.opacity(0.8), Color.clear]),
                                        startPoint: .bottom,
                                        endPoint: .top),
                                    lineWidth: 1).rotationEffect(.degrees(330)))
                    
                    Button("6") {
                        print("눌림")
                    }
                    .font(.system(size: 40))   // 안의 글자 크기 고정
                    .foregroundColor(.white)
                    .frame(width: 90, height: 90)           // 버튼 전체 크기 (원 크기)
                    .background(Circle().fill(Color(UIColor.darkGray)))
                    .shadow(color: .black.opacity(0.3), radius: 5, x: 3, y: 3)
                    .overlay(
                                Circle()
                                    .trim(from: 0, to:0.25)
                                    .stroke(LinearGradient(
                                        gradient: Gradient(colors: [Color.white.opacity(0.8), Color.clear]),
                                        startPoint: .bottom,
                                        endPoint: .top),
                                    lineWidth: 1).rotationEffect(.degrees(150)))
                    
                    .overlay(
                                Circle()
                                    .trim(from: 0.25, to:0.5)
                                    .stroke(LinearGradient(
                                        gradient: Gradient(colors: [Color.white.opacity(0.8), Color.clear]),
                                        startPoint: .bottom,
                                        endPoint: .top),
                                    lineWidth: 1).rotationEffect(.degrees(150)))
                    
                    .overlay(
                                Circle()
                                    .trim(from: 0.0, to:0.25)
                                    .stroke(LinearGradient(
                                        gradient: Gradient(colors: [Color.white.opacity(0.8), Color.clear]),
                                        startPoint: .bottom,
                                        endPoint: .top),
                                    lineWidth: 1).rotationEffect(.degrees(330)))
                            
                    
                    .overlay(
                                Circle()
                                    .trim(from: 0.25, to:0.5)
                                    .stroke(LinearGradient(
                                        gradient: Gradient(colors: [Color.white.opacity(0.8), Color.clear]),
                                        startPoint: .bottom,
                                        endPoint: .top),
                                    lineWidth: 1).rotationEffect(.degrees(330)))
                    
                    Button() {
                        print("눌림")
                    }
                        label: {
                                Image(systemName: "minus")
                                    .font(.system(size: 40))
                                    .foregroundColor(.white)
                                    .frame(width: 90, height: 90)
                                    .background(Circle().fill(Color.orange))
                                    .overlay(
                                                Circle()
                                                    .trim(from: 0, to:0.25)
                                                    .stroke(LinearGradient(
                                                        gradient: Gradient(colors: [Color.white.opacity(0.8), Color.clear]),
                                                        startPoint: .bottom,
                                                        endPoint: .top),
                                                    lineWidth: 1).rotationEffect(.degrees(150)))
                                    
                                    .overlay(
                                                Circle()
                                                    .trim(from: 0.25, to:0.5)
                                                    .stroke(LinearGradient(
                                                        gradient: Gradient(colors: [Color.white.opacity(0.8), Color.clear]),
                                                        startPoint: .bottom,
                                                        endPoint: .top),
                                                    lineWidth: 1).rotationEffect(.degrees(150)))
                                    
                                    .overlay(
                                                Circle()
                                                    .trim(from: 0.0, to:0.25)
                                                    .stroke(LinearGradient(
                                                        gradient: Gradient(colors: [Color.white.opacity(0.8), Color.clear]),
                                                        startPoint: .bottom,
                                                        endPoint: .top),
                                                    lineWidth: 1).rotationEffect(.degrees(330)))
                                            
                                    
                                    .overlay(
                                                Circle()
                                                    .trim(from: 0.25, to:0.5)
                                                    .stroke(LinearGradient(
                                                        gradient: Gradient(colors: [Color.white.opacity(0.8), Color.clear]),
                                                        startPoint: .bottom,
                                                        endPoint: .top),
                                                    lineWidth: 1).rotationEffect(.degrees(330)))
                            }
                }
                
                //row 4
                
                HStack {
                    Button("1") {
                        print("눌림")
                    }
                    .font(.system(size: 40))   // 안의 글자 크기 고정
                    .foregroundColor(.white)
                    .frame(width: 90, height: 90)           // 버튼 전체 크기 (원 크기)
                    .background(Circle().fill(Color(UIColor.darkGray)))
                    .overlay(
                                Circle()
                                    .trim(from: 0, to:0.25)
                                    .stroke(LinearGradient(
                                        gradient: Gradient(colors: [Color.white.opacity(0.8), Color.clear]),
                                        startPoint: .bottom,
                                        endPoint: .top),
                                    lineWidth: 1).rotationEffect(.degrees(150)))
                    
                    .overlay(
                                Circle()
                                    .trim(from: 0.25, to:0.5)
                                    .stroke(LinearGradient(
                                        gradient: Gradient(colors: [Color.white.opacity(0.8), Color.clear]),
                                        startPoint: .bottom,
                                        endPoint: .top),
                                    lineWidth: 1).rotationEffect(.degrees(150)))
                    
                    .overlay(
                                Circle()
                                    .trim(from: 0.0, to:0.25)
                                    .stroke(LinearGradient(
                                        gradient: Gradient(colors: [Color.white.opacity(0.8), Color.clear]),
                                        startPoint: .bottom,
                                        endPoint: .top),
                                    lineWidth: 1).rotationEffect(.degrees(330)))
                            
                    
                    .overlay(
                                Circle()
                                    .trim(from: 0.25, to:0.5)
                                    .stroke(LinearGradient(
                                        gradient: Gradient(colors: [Color.white.opacity(0.8), Color.clear]),
                                        startPoint: .bottom,
                                        endPoint: .top),
                                    lineWidth: 1).rotationEffect(.degrees(330)))
                    
                
                                        
                    Button("2") {
                        print("눌림")
                    }
                    .font(.system(size: 40))   // 안의 글자 크기 고정
                    .foregroundColor(.white)
                    .frame(width: 90, height: 90)           // 버튼 전체 크기 (원 크기)
                    .background(Circle().fill(Color(UIColor.darkGray)))
                    .overlay(
                                Circle()
                                    .trim(from: 0, to:0.25)
                                    .stroke(LinearGradient(
                                        gradient: Gradient(colors: [Color.white.opacity(0.8), Color.clear]),
                                        startPoint: .bottom,
                                        endPoint: .top),
                                    lineWidth: 1).rotationEffect(.degrees(150)))
                    
                    .overlay(
                                Circle()
                                    .trim(from: 0.25, to:0.5)
                                    .stroke(LinearGradient(
                                        gradient: Gradient(colors: [Color.white.opacity(0.8), Color.clear]),
                                        startPoint: .bottom,
                                        endPoint: .top),
                                    lineWidth: 1).rotationEffect(.degrees(150)))
                    
                    .overlay(
                                Circle()
                                    .trim(from: 0.0, to:0.25)
                                    .stroke(LinearGradient(
                                        gradient: Gradient(colors: [Color.white.opacity(0.8), Color.clear]),
                                        startPoint: .bottom,
                                        endPoint: .top),
                                    lineWidth: 1).rotationEffect(.degrees(330)))
                            
                    
                    .overlay(
                                Circle()
                                    .trim(from: 0.25, to:0.5)
                                    .stroke(LinearGradient(
                                        gradient: Gradient(colors: [Color.white.opacity(0.8), Color.clear]),
                                        startPoint: .bottom,
                                        endPoint: .top),
                                    lineWidth: 1).rotationEffect(.degrees(330)))
                    
                    Button("3") {
                        print("눌림")
                    }
                    .font(.system(size: 40))   // 안의 글자 크기 고정
                    .foregroundColor(.white)
                    .frame(width: 90, height: 90)           // 버튼 전체 크기 (원 크기)
                    .background(Circle().fill(Color(UIColor.darkGray)))
                    .overlay(
                                Circle()
                                    .trim(from: 0, to:0.25)
                                    .stroke(LinearGradient(
                                        gradient: Gradient(colors: [Color.white.opacity(0.8), Color.clear]),
                                        startPoint: .bottom,
                                        endPoint: .top),
                                    lineWidth: 1).rotationEffect(.degrees(150)))
                    
                    .overlay(
                                Circle()
                                    .trim(from: 0.25, to:0.5)
                                    .stroke(LinearGradient(
                                        gradient: Gradient(colors: [Color.white.opacity(0.8), Color.clear]),
                                        startPoint: .bottom,
                                        endPoint: .top),
                                    lineWidth: 1).rotationEffect(.degrees(150)))
                    
                    .overlay(
                                Circle()
                                    .trim(from: 0.0, to:0.25)
                                    .stroke(LinearGradient(
                                        gradient: Gradient(colors: [Color.white.opacity(0.8), Color.clear]),
                                        startPoint: .bottom,
                                        endPoint: .top),
                                    lineWidth: 1).rotationEffect(.degrees(330)))
                            
                    
                    .overlay(
                                Circle()
                                    .trim(from: 0.25, to:0.5)
                                    .stroke(LinearGradient(
                                        gradient: Gradient(colors: [Color.white.opacity(0.8), Color.clear]),
                                        startPoint: .bottom,
                                        endPoint: .top),
                                    lineWidth: 1).rotationEffect(.degrees(330)))
                    
                    Button() {
                        
                        print("눌림")
                    }
                        label: {
                                Image(systemName: "plus")
                                    .font(.system(size: 40))
                                    .foregroundColor(.white)
                                    .frame(width: 90, height: 90)
                                    .background(Circle().fill(Color.orange))
                                    .overlay(
                                                Circle()
                                                    .trim(from: 0, to:0.25)
                                                    .stroke(LinearGradient(
                                                        gradient: Gradient(colors: [Color.white.opacity(0.8), Color.clear]),
                                                        startPoint: .bottom,
                                                        endPoint: .top),
                                                    lineWidth: 1).rotationEffect(.degrees(150)))
                                    
                                    .overlay(
                                                Circle()
                                                    .trim(from: 0.25, to:0.5)
                                                    .stroke(LinearGradient(
                                                        gradient: Gradient(colors: [Color.white.opacity(0.8), Color.clear]),
                                                        startPoint: .bottom,
                                                        endPoint: .top),
                                                    lineWidth: 1).rotationEffect(.degrees(150)))
                                    
                                    .overlay(
                                                Circle()
                                                    .trim(from: 0.0, to:0.25)
                                                    .stroke(LinearGradient(
                                                        gradient: Gradient(colors: [Color.white.opacity(0.8), Color.clear]),
                                                        startPoint: .bottom,
                                                        endPoint: .top),
                                                    lineWidth: 1).rotationEffect(.degrees(330)))
                                            
                                    
                                    .overlay(
                                                Circle()
                                                    .trim(from: 0.25, to:0.5)
                                                    .stroke(LinearGradient(
                                                        gradient: Gradient(colors: [Color.white.opacity(0.8), Color.clear]),
                                                        startPoint: .bottom,
                                                        endPoint: .top),
                                                    lineWidth: 1).rotationEffect(.degrees(330)))
                            }
                }
                
                //row 5
                
                HStack {
                    Button() {
                        print("눌림")
                    }
                        label: {
                                Image(systemName: "plus.forwardslash.minus")
                                    .font(.system(size: 40))
                                    .foregroundColor(.white)
                                    .frame(width: 90, height: 90)
                                    .background(Circle().fill(Color(UIColor.darkGray)))
                                    .overlay(
                                                Circle()
                                                    .trim(from: 0, to:0.25)
                                                    .stroke(LinearGradient(
                                                        gradient: Gradient(colors: [Color.white.opacity(0.8), Color.clear]),
                                                        startPoint: .bottom,
                                                        endPoint: .top),
                                                    lineWidth: 1).rotationEffect(.degrees(150)))
                                    
                                    .overlay(
                                                Circle()
                                                    .trim(from: 0.25, to:0.5)
                                                    .stroke(LinearGradient(
                                                        gradient: Gradient(colors: [Color.white.opacity(0.8), Color.clear]),
                                                        startPoint: .bottom,
                                                        endPoint: .top),
                                                    lineWidth: 1).rotationEffect(.degrees(150)))
                                    
                                    .overlay(
                                                Circle()
                                                    .trim(from: 0.0, to:0.25)
                                                    .stroke(LinearGradient(
                                                        gradient: Gradient(colors: [Color.white.opacity(0.8), Color.clear]),
                                                        startPoint: .bottom,
                                                        endPoint: .top),
                                                    lineWidth: 1).rotationEffect(.degrees(330)))
                                            
                                    
                                    .overlay(
                                                Circle()
                                                    .trim(from: 0.25, to:0.5)
                                                    .stroke(LinearGradient(
                                                        gradient: Gradient(colors: [Color.white.opacity(0.8), Color.clear]),
                                                        startPoint: .bottom,
                                                        endPoint: .top),
                                                    lineWidth: 1).rotationEffect(.degrees(330)))
                            }
                    
                    Button("0") {
                        print("눌림")
                    }
                    .font(.system(size: 40))   // 안의 글자 크기 고정
                    .foregroundColor(.white)
                    .frame(width: 90, height: 90)           // 버튼 전체 크기 (원 크기)
                    .background(Circle().fill(Color(UIColor.darkGray)))
                    .overlay(
                                Circle()
                                    .trim(from: 0, to:0.25)
                                    .stroke(LinearGradient(
                                        gradient: Gradient(colors: [Color.white.opacity(0.8), Color.clear]),
                                        startPoint: .bottom,
                                        endPoint: .top),
                                    lineWidth: 1).rotationEffect(.degrees(150)))
                    
                    .overlay(
                                Circle()
                                    .trim(from: 0.25, to:0.5)
                                    .stroke(LinearGradient(
                                        gradient: Gradient(colors: [Color.white.opacity(0.8), Color.clear]),
                                        startPoint: .bottom,
                                        endPoint: .top),
                                    lineWidth: 1).rotationEffect(.degrees(150)))
                    
                    .overlay(
                                Circle()
                                    .trim(from: 0.0, to:0.25)
                                    .stroke(LinearGradient(
                                        gradient: Gradient(colors: [Color.white.opacity(0.8), Color.clear]),
                                        startPoint: .bottom,
                                        endPoint: .top),
                                    lineWidth: 1).rotationEffect(.degrees(330)))
                            
                    
                    .overlay(
                                Circle()
                                    .trim(from: 0.25, to:0.5)
                                    .stroke(LinearGradient(
                                        gradient: Gradient(colors: [Color.white.opacity(0.8), Color.clear]),
                                        startPoint: .bottom,
                                        endPoint: .top),
                                    lineWidth: 1).rotationEffect(.degrees(330)))
                    
                    Button(".") {
                        print("눌림")
                    }
                    .font(.system(size: 40, weight: .bold))   // 안의 글자 크기 고정
                    .foregroundColor(.white)
                    .frame(width: 90, height: 90)           // 버튼 전체 크기 (원 크기)
                    .background(Circle().fill(Color(UIColor.darkGray)))
                    .overlay(
                                Circle()
                                    .trim(from: 0, to:0.25)
                                    .stroke(LinearGradient(
                                        gradient: Gradient(colors: [Color.white.opacity(0.8), Color.clear]),
                                        startPoint: .bottom,
                                        endPoint: .top),
                                    lineWidth: 1).rotationEffect(.degrees(150)))
                    
                    .overlay(
                                Circle()
                                    .trim(from: 0.25, to:0.5)
                                    .stroke(LinearGradient(
                                        gradient: Gradient(colors: [Color.white.opacity(0.8), Color.clear]),
                                        startPoint: .bottom,
                                        endPoint: .top),
                                    lineWidth: 1).rotationEffect(.degrees(150)))
                    
                    .overlay(
                                Circle()
                                    .trim(from: 0.0, to:0.25)
                                    .stroke(LinearGradient(
                                        gradient: Gradient(colors: [Color.white.opacity(0.8), Color.clear]),
                                        startPoint: .bottom,
                                        endPoint: .top),
                                    lineWidth: 1).rotationEffect(.degrees(330)))
                            
                    
                    .overlay(
                                Circle()
                                    .trim(from: 0.25, to:0.5)
                                    .stroke(LinearGradient(
                                        gradient: Gradient(colors: [Color.white.opacity(0.8), Color.clear]),
                                        startPoint: .bottom,
                                        endPoint: .top),
                                    lineWidth: 1).rotationEffect(.degrees(330)))
                    
                    Button() {
                        print("눌림")
                    }
                        label: {
                                Image(systemName: "equal")
                                    .font(.system(size: 40))
                                    .foregroundColor(.white)
                                    .frame(width: 90, height: 90)
                                    .background(Circle().fill(Color.orange))
                                    .overlay(
                                                Circle()
                                                    .trim(from: 0, to:0.25)
                                                    .stroke(LinearGradient(
                                                        gradient: Gradient(colors: [Color.white.opacity(0.8), Color.clear]),
                                                        startPoint: .bottom,
                                                        endPoint: .top),
                                                    lineWidth: 1).rotationEffect(.degrees(150)))
                                    
                                    .overlay(
                                                Circle()
                                                    .trim(from: 0.25, to:0.5)
                                                    .stroke(LinearGradient(
                                                        gradient: Gradient(colors: [Color.white.opacity(0.8), Color.clear]),
                                                        startPoint: .bottom,
                                                        endPoint: .top),
                                                    lineWidth: 1).rotationEffect(.degrees(150)))
                                    
                                    .overlay(
                                                Circle()
                                                    .trim(from: 0.0, to:0.25)
                                                    .stroke(LinearGradient(
                                                        gradient: Gradient(colors: [Color.white.opacity(0.8), Color.clear]),
                                                        startPoint: .bottom,
                                                        endPoint: .top),
                                                    lineWidth: 1).rotationEffect(.degrees(330)))
                                            
                                    
                                    .overlay(
                                                Circle()
                                                    .trim(from: 0.25, to:0.5)
                                                    .stroke(LinearGradient(
                                                        gradient: Gradient(colors: [Color.white.opacity(0.8), Color.clear]),
                                                        startPoint: .bottom,
                                                        endPoint: .top),
                                                    lineWidth: 1).rotationEffect(.degrees(330)))
                                                        
                            }
                }
            }
        }
    }
}

#Preview {
    CalculatorView()
}
