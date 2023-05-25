//
//  InitGameProtocols.swift
//  MineSweeper
//
//  Created by 唐伟业 on 2023/4/4.
//

/**
 this part we make some interfaces about when we init our game,
 show some funcs about conditions of success, fail, deploy mines.
 */
import Foundation

protocol InitGameProtocol{
  /**
   deploy mine function
   this func we deploy mines randomly
   */
  func deployMine(mineNums: Int, field: MineField) -> Void
  /**
   init the size of minefield
   we have three levels: easy, normal, hard
   */
  func initMineField(gameLevel: GameLevel) -> MineField
}
