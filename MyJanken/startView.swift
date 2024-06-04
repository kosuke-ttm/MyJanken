//
//  SwiftUIView.swift
//  MyJanken
//
//  Created by 辰巳公祐 on 2023/08/24.
//

import SwiftUI

struct startView: View {
    //永続化する秒数設定（初期値は10）
    @AppStorage("question_value")var questionValue = 10
    
    @State private var isSecondViewPresented = false
    
    var body: some View {
        NavigationStack{
            ZStack {
                //背景画像
                Image("startBackground")
                //リサイズする
                    .resizable()
                //セーフエリアを超えて画面全体に配置
                    .ignoresSafeArea()
                //アスペクト比(縦横比)を維持して短辺基準に収まるようにする
                    .scaledToFill()
                
                //垂直にレイアアウト（縦方向にレイアウト）
                //View（部品）間の間隔を30にする
                VStack(spacing: 30.0){
                    //テキスト表示
                    Text("インド式暗記アプリ")
                    //文字サイズを指定
                        .font(.largeTitle)
                        .foregroundColor(Color.black)
                    
                    //テキスト表示
                    Text("問題数:\(questionValue)問")
                    //文字サイズを指定
                        .font(.title)
                    //水平にレイアウト（横方向にレイアウト）
                    HStack{
                        //スタートボタン
                        Button{
                            //ボタンをタップした時のアクション
                            isSecondViewPresented = true
                            
                        }label:{
                            Text("スタート")
                            //文字サイズを指定
                                .font(.title)
                            //文字色を白に指定
                                .foregroundColor(Color.white)
                            //幅高さを140に指定
                                .frame(width:140, height: 140)
                            //背景を設定
                                .background(Color("startColor"))
                            //円形に切り抜く
                                .clipShape(Circle())
                        }
                        .sheet(isPresented: $isSecondViewPresented) {
                            ContentView()
                        }
                        
                        //ナビゲーションボタンにボタンを追加
                        .toolbar{
                            //ナビゲーションバーの右にボタンを追加
                            ToolbarItem(placement: .navigationBarTrailing){
                                //ナビゲーション遷移
                                NavigationLink{
                                    SettingView()
                                }label: {
                                    //テキストを表示
                                    Text("問題設定")
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

struct startView_Previews: PreviewProvider {
    static var previews: some View {
        startView()
    }
}
