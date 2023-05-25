//
//  initGameImpl.swift
//  MineSweeper
//
//  Created by 唐伟业 on 2023/4/5.
//

import Foundation

struct InitGame: InitGameProtocol{

  static let initGameServ = InitGame()
  private init(){}
  /**
   this function add init original spaces field and deploy mines
   */
  func initMineField(gameLevel: GameLevel) ->MineField {
    switch(gameLevel){
      //init mineField and deploy mines
    case .easy:
      let iField = initField(row: 9, col: 9)
      deployMine(mineNums: 10, field: iField)
      return iField
    case .normal:
      let iField =  initField(row: 16, col: 16)
      deployMine(mineNums: 40, field: iField)
      return iField
    case .hard:
      let iField =  initField(row: 30, col: 16)
      deployMine(mineNums: 99, field: iField)
      return iField
    }
  }
  
  //give different size of mineField, but nou include deploy mine.
  func initField(row: Int, col: Int) -> MineField {
    let globalFlag: Int = 0
    let globalMineList: [Space] = []
    var newField: [[Space]] = []
    for i in 0..<row{
      var tempList: [Space] = []
      for j in 0..<col{
        tempList.append(Space(
          status: false, num: 0, isFlag: false, location: (i, j), isBomb: false, confStr: ""))
      }
      newField.append(tempList)
    }
    return MineField(field: newField, flagsNum: globalFlag, mineList: globalMineList, isDisable: false)
  }

  //deploy mines
  func deployMine(mineNums: Int, field: MineField) {
    field.flagsNum = mineNums
    var count = 0
    var randomTuple = (-1, -1)
    field.flagsNum = mineNums
    while count<mineNums {
      randomTuple = (Int(arc4random_uniform(UInt32(field.field.count))),
                     Int(arc4random_uniform(UInt32(field.field[0].count))))
      //if an iteration contains an exsits location infos, go ahead
      if(FuncsOfImpl.funsServ.findSpaceByLoc(
        x: randomTuple.0, y: randomTuple.1, mineField: field)
        .isBomb == true){
        continue
      }
      //else we add this posiiton in mineList
      field.mineList.append(
        FuncsOfImpl.funsServ.findSpaceByLoc(x: randomTuple.0, y: randomTuple.1, mineField: field))
      //specify this loc is mine
      FuncsOfImpl.funsServ.findSpaceByLoc(x: randomTuple.0, y: randomTuple.1
                                 , mineField: field).isBomb = true
      count+=1
    }
    
  }
  //create a i*j arrays 'view' and inner entity by selecting game levels.
  func mineRow(gmLevel: GameLevel)->(view: [[SpaceView]], mineField: MineField){
    let field = initMineField(gameLevel: gmLevel)
    var mapRow: [[SpaceView]] = []
    for i in 0..<field.field.count{
      var temp: [SpaceView] = []
      for j in 0..<field.field[0].count{
        temp.append(SpaceView(space: field.field[i][j], mineField: field))
      }
      mapRow.append(temp)
    }
    /*print basic info about minefield like what's location of mine
     and dose the minefield will change after functions.
     **/
    print(field.mineList)
    return (mapRow, field)
  }

}
