//
//  Setting.swift
//  MyJanken
//
//  Created by 辰巳公祐 on 2023/08/24.
//
import SwiftUI

struct SettingView: View {
    //永続化する秒数設定（初期値は10）
    @AppStorage("question_value")var questionValue = 10
    @State var count = 0
    
    var body: some View {
        NavigationStack{
            //奥から手前方向にレイアウト
            ZStack{
                //背景色表示
                Color("backgroundSetting")
                //セーフエリアを超えて画面全体に配置
                    .ignoresSafeArea()
                //垂直にレイアウト（縦方向にレイアウト）
                VStack{
                    Spacer()
                    Text("問題数を選択してください").font(.title)
                    
                    Spacer()
                    //テキストを表示する
                    Text("\(questionValue)問")
                    //文字サイズを指定
                        .font(.largeTitle)
                    Spacer()
                    //Pickerを表示
                    Picker(selection: $questionValue){
                        Text("5").tag(5)
                        ForEach(1..<11){ i in
                            Text("\(i*10)").tag(i*10)
                        }
                    }label:{
                        Text("選択")
                    }
                    //Pickerをホイール表示
                    .pickerStyle(.wheel)
                    Spacer()
                }
            }
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
