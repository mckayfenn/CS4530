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
    
    // TODO: Thread Safety!!!
    public static let Instance: GameList = GameList()
    
    private init() {
        
    }
    
    private var _games: [Game] = []
    
    var gameCount: Int {
        return _games.count
    }
    
    func createGame() {
        _games.append(Game())
    }
    
    func gameWithIndex(gameIndex: Int) -> Game {
        return _games[gameIndex]
    }
    
    func deleteGameIndex(gameIndex: Int) {
            _games.remove(at: gameIndex)
    }
    
    weak var delegate: GameListDelegate?
}
