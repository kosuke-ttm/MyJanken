//
//  ResultView.swift
//  MyJanken
//
//  Created by 辰巳公祐 on 2023/08/25.
//

import SwiftUI

struct ResultView: View {
    @State var answerNumber = 0
    @State var correct = 0
    @State var incorrect = 0
    
    //永続化する正解数設定（初期値は0）
    @AppStorage("result_correct")var resultCorrect = 0
    
    //永続化する不正解数設定（初期値は0）
    @AppStorage("result_incorrect")var resultIncorrect = 0
    
    @State var arr = [Int]()
    
    var body: some View {
        VStack {
            Spacer()
            Text("\(resultCorrect + resultIncorrect)問中\(resultCorrect)問正解!")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(Color.red)
            Spacer()
        }
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView()
    }
}
