//
//  Space.swift
//  MineSweeper
//
//  Created by 唐伟业 on 2023/4/4.
//

//this struct we create a squre that it's a basic part in our game which contains many
//featrues.
/**
 status: bool (check if space is clicked)
 num: int (how many mines around space)
 isFlag: bool (dose the space is deployed a flag as a space have mine)
 location: (int, int) (use a tuple to store loc info of space)
 isBomb: bool (to show player if this is a mine)
 */
import Foundation

class Space: Identifiable, ObservableObject{
  //status: show has cliked
  @Published var status: Bool
  //how many mines around space
  @Published var num: Int
  //does this space have a flag
  @Published var isFlag: Bool
  //store a location for this space
  @Published var location: (Int, Int)
  //if this is a mine
  @Published var isBomb: Bool
  //configure images in space systemName
  @Published var confStr: String

  init(status: Bool, num: Int, isFlag: Bool, location: (Int, Int), isBomb: Bool, confStr: String) {
    self.status = status
    self.num = num
    self.isFlag = isFlag
    self.location = location
    self.isBomb = isBomb
    self.confStr = confStr
  }
}
