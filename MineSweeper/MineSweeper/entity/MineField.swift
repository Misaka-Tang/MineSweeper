//
//  MineField.swift
//  MineSweeper
//
//  Created by 唐伟业 on 2023/4/6.
//

import Foundation

class MineField: ObservableObject{
  /**
   give a 2 dimention array to store spaces
   */
  let field: [[Space]]
  /**
   set a number of flags
   */
  @Published var flagsNum: Int
  /**
   a list contains mine spaces
   */
  var mineList: [Space]
  /**
   turn off view if lose or win the game
   */
  @Published var isDisable: Bool

  init(field: [[Space]], flagsNum: Int, mineList: [Space], isDisable: Bool) {
    self.field = field
    self.flagsNum = flagsNum
    self.mineList = mineList
    self.isDisable = isDisable
  }
}
