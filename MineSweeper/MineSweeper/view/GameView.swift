//
//  GameView.swift
//  MineSweeper
//
//  Created by 唐伟业 on 2023/4/13.
//

import SwiftUI

struct GameView: View {
 
  @State var chooseDiff = GameLevel.easy
  @State var tempView: MineFieldView = MineFieldView(level: .easy)
  var body: some View {
      VStack{
        HStack{
          Picker("choose diffculty", selection: $chooseDiff, content: {
            ForEach(GameLevel.allCases, id: \.self){
              if($0.rawValue==0){
                Text("easy")
              }
              if($0.rawValue==1){
                Text("normal")
              }
              if($0.rawValue==2){
                Text("hard")
              }
            }
          })
          .padding(.horizontal)
          .frame(width: 300.0)
          Button(action: {
            tempView = ButtonLogics.buttonLogicServ.resetGame(level: chooseDiff)
          }, label: {
            Image(systemName: "face.smiling")
            Text("start game")
          })

        }
        .padding()
        tempView
      }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
      GameView()
    }
}
