//
//  ButtonLogics.swift
//  MineSweeper
//
//  Created by 唐伟业 on 2023/4/11.
//

import Foundation

/**
 this part of structrues is to define some logic functions
 in our views which includes when we click to do a queue of actions
 **/
struct ButtonLogics{

  static let buttonLogicServ = ButtonLogics()
  private init(){}
  //need to call some other services
  /**
   here is to do an action of clicking button left side and generate
   numbers of mines or face mine to lose.
   */
  func buttonLogic(space: Space, mineField: MineField) -> Void {
    if(space.isBomb){
      space.status = true
      print("lost game")
      space.confStr = "exclamationmark.triangle.fill"
      mineField.isDisable = true
    }else{
      //call functions from funsServ to count num.
      space.num = FuncsOfImpl.funsServ.countAround(input: space, field: mineField)
      space.confStr = "\(space.num).lane"
      if(space.num == 0){
        space.confStr = " "
        //recursion to check.
        FuncsOfImpl.funsServ.checkAroundFromCurrentRectangle(input: space, mineField: mineField)
      }
      space.status = true
    }
    return 
  }

  /**
   reset new game to play
   */
  func resetGame(level: GameLevel) -> MineFieldView{
    let newField = MineFieldView(level: level)
    newField.innerMap.isDisable = false
    return newField
  }

  func buttonLogicRightSide(space: Space, mineField: MineField) -> Bool{
    FuncsOfImpl.funsServ.adjustFlag(input: space)
    if(space.isFlag){
      space.confStr = "flag.square"
      mineField.flagsNum-=1
    }else if(!space.isFlag){
      space.confStr = ""
      mineField.flagsNum+=1
    }
    return FuncsOfImpl.funsServ.winCondition(minefield: mineField)
  }
}
