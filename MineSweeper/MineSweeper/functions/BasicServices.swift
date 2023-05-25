//
//  BasicServices.swift
//  MineSweeper
//
//  Created by 唐伟业 on 2023/4/6.
//

import Foundation
import SwiftUI

struct BasicServices{
  //only once be called
  static let baiscServ = BasicServices()
  private init(){}
  
// find around spaces from current one
  //which include up, down, left, right directions.
   func getAroundLoc(space: Space, field: MineField, type: Direction) -> Space {
    let loc = space.location
    let x:Int = loc.0, y:Int = loc.1
    //basic direction around
    let up: Int = x-1, down: Int = x+1
    let left: Int = y-1, right: Int = y+1
    //give a switch of choose what's space we need.
     var retSpace: Space = Space(status: false, num: 0, isFlag: false, location: (-1, -1), isBomb: false, confStr: "")
    switch(type){
    case .up:
      if (up>=0) {
        retSpace = field.field[up][y]
      }
    case .down:
      if (down<field.field.count){
        retSpace = field.field[x][down]
      }
    case .left:
      if (left>=0){
        retSpace = field.field[left][y]
      }
    case .right:
      if (right<field.field[0].count){
        retSpace = field.field[x][right]
      }
    case .upLeft:
      if (up>=0 && left>=0){
        retSpace = field.field[up][left]
      }
    case .upRight:
      if (up>=0 && right<field.field[0].count){
        retSpace = field.field[up][right]
      }
    case .downLeft:
      if (down<field.field.count && left>=0){
        retSpace = field.field[down][left]
      }
    case .downRight:
      if (down<field.field.count && right<field.field[0].count){
        retSpace = field.field[down][right]
      }
    }
     return retSpace
  }

  func showAlert(input: AlertType, mineField: MineField) -> Alert {
    switch(input){
    case .win:
      return Alert(
      title: Text("Good!"),
      message: Text("You win"),
      dismissButton: .default(Text("OK"))
      )
    case .lose:
      return Alert(
        title: Text("Ops!"),
        message: Text("You lose"),
        dismissButton: .default(Text("OK"), action: {
          //show all mines in field
          FuncsOfImpl.funsServ.showAllMines(field: mineField)
        })
      )
    }
  }
}


