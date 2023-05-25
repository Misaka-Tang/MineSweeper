//
//  FuncsOfImpl.swift
//  MineSweeper
//
//  Created by 唐伟业 on 2023/4/5.
//

import Foundation

struct FuncsOfImpl: MineGameProtocol{

  static let funsServ = FuncsOfImpl()
  private init(){}

  //this variable is a test one that if we need a input in our funcs.
  var test = Space(status: false, num: 1, isFlag: false, location: (0,0), isBomb: false, confStr: "")

  func countAround(input: Space, field mineField: MineField) -> Int {
    //use count to count mines, use statusLoc to change position
    var count = 0
    for statusLoc in 0..<8{
      let curSpace = BasicServices.baiscServ.getAroundLoc(
        space: input, field: mineField, type: Direction(rawValue: statusLoc)!)
      //find bomb count once time.
      if(curSpace.location != (-1, -1)){
        if(curSpace.isBomb){count+=1}
      }
    }
    return count
  }

  func checkBomb(input: Space) -> Bool {
    return input.isBomb
  }

  func adjustFlag(input: Space) -> Void {
    input.isFlag.toggle()
    if(input.isFlag && !input.status){ input.status = true }
    if(!input.isFlag && input.status){input.status = false}
    return 
  }

  func winCondition(minefield: MineField) -> Bool {
    for item in minefield.mineList{
      if(!item.isFlag){return false}
    }
    return true
  }
  /**
   I don't know why I use struct will cause like 'can't pass immutable in function below.
   I don't think create a temp val is good.
   this function is make to apply the protocol at first but I found former funcrion will always
   cause error. The func is the same with the protocol.
   */
  func checkAroundFromCurrentRectangle(input: Space, mineField: MineField) ->Void{
    //first judge if this time space is out of range or it's a mine
    if(input.location==(-1, -1)||input.isBomb||input.status){
      return
    }
    let mineNum = FuncsOfImpl.funsServ.countAround(input: input, field: mineField)
    //find this space have mines around it stop recursion
    if(mineNum>0){
      input.confStr = "\(mineNum).lane"
      input.status = true
      return
    }else if(mineNum==0){
      input.status = true
      //still don't have mine we continue to recursion untill find around mines.
      checkAroundFromCurrentRectangle(input: BasicServices.baiscServ.getAroundLoc(
          space: input, field: mineField, type: .up), mineField: mineField)
      checkAroundFromCurrentRectangle(input: BasicServices.baiscServ.getAroundLoc(
          space: input, field: mineField, type: .down), mineField: mineField)
      checkAroundFromCurrentRectangle(input: BasicServices.baiscServ.getAroundLoc(
          space: input, field: mineField, type: .left), mineField: mineField)
      checkAroundFromCurrentRectangle(input: BasicServices.baiscServ.getAroundLoc(
          space: input, field: mineField, type: .right), mineField: mineField)
    }
  }

  func findSpaceByLoc(x: Int, y: Int, mineField: MineField) -> Space {
    return mineField.field[x][y]
  }

  func showAllMines(field: MineField) -> Void {
    //show all mines
    for item in field.mineList{
      let item = FuncsOfImpl.funsServ.findSpaceByLoc(x: item.location.0, y: item.location.1, mineField: field)
      item.status = true
      item.confStr = "exclamationmark.triangle.fill"
    }
  }

}
