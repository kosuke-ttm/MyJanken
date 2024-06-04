//
//  ContentView.swift
//  MyJanken
//
//  Created by 辰巳公祐 on 2023/08/22.
//

import SwiftUI

struct ContentView: View {
    @State var answerNumber = 0
    @State var correct = 0
    @State var incorrect = 0
    
    @State var ansdisplay = "スタート！"
    @State var arr = [Int]()
    @State var firstNumber = Int.random(in: 11...20)
    @State var secondNumber = Int.random(in: 11...20)
    //永続化する秒数設定（初期値は10）
    @AppStorage("question_value")var questionValue = 10
    
    //永続化する正解数設定（初期値は0）
    @AppStorage("result_correct")var resultCorrect = 0
    
    //永続化する不正解数設定（初期値は0）
    @AppStorage("result_incorrect")var resultIncorrect = 0
    
    
    //入力中に文字列を保持する状態変数
    @State var inputText: String = ""
    //検索キーワードを保持する状態変数
    @State var displaySearchKey: String = ""
    @State private var isViewPresented = false
    
    
    var body: some View {
        
        if correct+incorrect != questionValue{
            VStack {
                Spacer()
                Text(ansdisplay)
                Spacer()
                
                Text("\(firstNumber) × \(secondNumber)")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color.red)
                Spacer()
                TextField("数字",text: $inputText,prompt:Text("答えを入力してください"))
                //入力が完了された時
                //改行ボタンが押された時
                    .onSubmit {
                        //入力が完了したので検索キーワードに設定する
                        displaySearchKey = inputText
                        print(inputText)
                        
                        //条件分岐
                        if Int(inputText) == firstNumber*secondNumber{
                            ansdisplay = "正解！"
                            arr.append(firstNumber)
                            arr.append(secondNumber)
                            inputText = ""
                            correct += 1
                            firstNumber = Int.random(in: 11...20)
                            secondNumber = Int.random(in: 11...20)
                            
                            
                        }else{
                            incorrect += 1
                            ansdisplay = "不正解..."
                            firstNumber = Int.random(in: 11...20)
                            secondNumber = Int.random(in: 11...20)
                        }
                    }
                    .padding()
                Spacer()
            }
        }
        else{
            
            VStack{
                Text("お疲れ様でした！")
                Button{
                    resultCorrect = correct
                    resultIncorrect = incorrect
                    //ボタンをタップした時のアクション
                    isViewPresented = true
                }label: {
                    Text("結果を見る")
                }
                .sheet(isPresented: $isViewPresented) {
                    ResultView()
                }
            }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
