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
    func boardChanged()
    func gameWon(player: Int)
}

class GameList: GameModelDelegate {
    
    // TODO: Thread Safety!!!
    public static let Instance: GameList = GameList()
    
    private init() {
        
    }
    
    private var _games: [Game] = []
    
    var gameCount: Int {
        return _games.count
    }
    
    func createGame() {
        let game: Game = Game()
        game.delegates.append(self)
        _games.append(game)
    }
    
    func gameWithIndex(gameIndex: Int) -> Game {
        return _games[gameIndex]
    }
    
    func deleteGameIndex(gameIndex: Int) {
        _games.remove(at: gameIndex)
    }
    
    public func load() {
        // load from a file
        //        _games.removeAll()
        //
        //        let jsonData: Data = try! Data(contentsOf: URL.init(fileURLWithPath: "../Library.json"))
        //        let gameDictionaries: [NSDictionary] = try! JSONSerialization.jsonObject(with: jsonData, options: []) as! [NSDictionary]
        //
        //        for gameDictionary: NSDictionary in gameDictionaries {
        //            let game: Game = Game(dictionary: gameDictionary)
        //            game.delegates.append(self)
        //            _games.append(game)
        //        }
        NSLog("finish load")
    }
    
    public func save() {
        
        var gameDictionaries: [NSDictionary] = []
        for game: Game in _games {
            gameDictionaries.append(game.dictionaryRepresentation)
        }
        
        let jsonData: Data = try! JSONSerialization.data(withJSONObject: gameDictionaries, options: .prettyPrinted)
        let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        let docDirectory: URL =  URL(string: documentsPath)!
        try! jsonData.write(to: docDirectory)
        NSLog("finsih save")
    }
    
    // MARK: - GameModelDelegate Methods
    func showTouchedStatus(status: String) {
        // TODO: something here
        delegate?.boardChanged()
    }
    
    func showPlayerWon(player: Int) {
        // do it here?
        delegate?.gameWon(player: player)
    }
    
    weak var delegate: GameListDelegate?
}
