//
//  ContentView.swift
//  MineSweeper
//
//  Created by 唐伟业 on 2023/4/4.
//

import SwiftUI

struct MineFieldView: View {
  //property
  @Binding var map: [[SpaceView]]
  @ObservedObject var innerMap: MineField
  //get diff level from GameView and create view, class of map
  init(level: GameLevel) {
    let localVal = InitGame.initGameServ.mineRow(gmLevel: level)
    _map = Binding(get: {localVal.view}, set: {_ in})
    _innerMap = ObservedObject(wrappedValue: localVal.mineField)
  }

    var body: some View {
      VStack{
        HStack{
          Image(systemName: "flag.fill")
          Text("Flag number: \(innerMap.flagsNum)")
        }.padding(.top, -2.0)
        VStack(spacing: 0){
          ForEach(map.indices, id: \.self){row in
            HStack(spacing: 0){
              ForEach(map[row].indices, id: \.self){col in
                map[row][col]
              }
            }
          }
        }
      .padding()
      .disabled(innerMap.isDisable)
      }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
      MineFieldView(level: .easy)
    }
}
