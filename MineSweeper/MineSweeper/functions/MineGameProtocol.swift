//
//  ProtoclsOfFuncs.swift
//  MineSweeper
//
//  Created by 唐伟业 on 2023/4/4.
//

/**
this part we first create a procol to clear our goals of each fucntions, and let
 user to know each function efficiently.
 */
import Foundation

protocol MineGameProtocol{
  //countFunction
  //this func means to count numbers of mines around current space we choose
  func countAround(input: Space, field: MineField) -> Int
  //check bomb function
  //this func show us whether or not it's a mine this space, if result is true means we gotta
  //a mine then lose. 
  func checkBomb(input: Space)-> Bool
  //set flag function
  //this func player can set this space a flag or cancel this action
  func adjustFlag(input: Space) -> Void
  //check remain sapces around current one
  //this func means when we make some flags that flags number equal to current
  //numbers space contain bombs or click on this funtion must turn remain spaces on
  //if isn't bomb under a flag then fail the game
  func checkAroundFromCurrentRectangle(input: Space, mineField: MineField) ->Void
  //our win condition is every space contains mines are set flags
  func winCondition(minefield: MineField) -> Bool
  //we need a function to find other spaces by using the location information.
  func findSpaceByLoc(x: Int, y: Int, mineField: MineField) -> Space
}
