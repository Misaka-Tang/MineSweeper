//
//  SpaceView.swift
//  MineSweeper
//
//  Created by 唐伟业 on 2023/4/5.
//

import SwiftUI

struct SpaceView: View{
  //property and methods
  @ObservedObject var space: Space
  let mineField: MineField
  @State var isLose: Bool = false
  @State var isWin: Bool = false
  //this var to check if we need an alert to show
  @State var needAlert: Bool = false
  @State var kindOfAlert: AlertType = .lose
  
  init(space: Space, mineField: MineField) {
    self.mineField = mineField
    self.space = space
  }

//MARK: this part is View!
  var body: some View {
    /*
     if this button doesn't click, botton text is " ",
     else botton text is num
     */
    VStack{
      Button(action: {
        //actions
        ButtonLogics.buttonLogicServ.buttonLogic(space: space, mineField: mineField)
        if(space.isBomb){isLose = true}
        if(isLose){
          needAlert = true
          kindOfAlert = .lose
        }
      }, label: {
        Image(systemName: space.confStr)
          .font(.system(size: 15.5, weight: .bold))
          .frame(width: 35, height: 35)
          .contentShape(Rectangle())
          .background(space.status==true ? .gray : .blue)
      })
      .frame(width: 30, height: 30)
      .border(.gray, width: 2)
      .disabled(space.status)
      .cornerRadius(3)
      .buttonStyle(PlainButtonStyle())
      .contextMenu(menuItems: {
        Button(action: {
         isWin = ButtonLogics.buttonLogicServ.buttonLogicRightSide(space: space, mineField: mineField)
          if(isWin){
            needAlert = true
            kindOfAlert = .win
          }
        }, label: {
          Text("add flag")
        })
        
      })
    }
    .alert(isPresented: $needAlert){
      BasicServices.baiscServ.showAlert(input: kindOfAlert, mineField: mineField)
    }
  }
}

struct SpaceView_Previews: PreviewProvider {
    static var previews: some View {
      let input: Space = Space(status: false, num: 3, isFlag: true, location: (0,0), isBomb: false, confStr: "")//give a Space instaces from minefield.
      let inputN: MineField = MineField(field: [[input]], flagsNum: 0, mineList: [input], isDisable: false)
      SpaceView(space: input, mineField: inputN)
    }
}


