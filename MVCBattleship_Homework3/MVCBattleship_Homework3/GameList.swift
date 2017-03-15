//
//  GameList.swift
//  MVCBattleship_Homework3
//
//  Created by Cronus on 3/14/17.
//  Copyright © 2017 mckay fenn. All rights reserved.
//

import Foundation

protocol GameListDelegate: class {
    func list(list: GameList)
}

class GameList {
    private var _games: [Game] = []
    
    var gameCount: Int {
        return _games.count
    }
    
    func createGame(game: Game) {
        _games.append(game)
        NSLog("new game created")
    }
    
    func gameWithIndex(gameIndex: Int) -> Game {
        return _games[gameIndex]
    }
    
    func deletePaintingIndex(gameIndex: Int) {
            _games.remove(at: gameIndex)
    }
    
    weak var delegate: GameListDelegate?
}
