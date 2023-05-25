//
//  EnumGameLevels.swift
//  MineSweeper
//
//  Created by 唐伟业 on 2023/4/5.
//

import Foundation
/**
 this file is to store game levels,
 different level has different numbers of mines and size
 of minefield.
 */
enum GameLevel: Int, CaseIterable{
   case easy = 0
   case normal = 1
   case hard = 2
}
