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
    
    /// Load from a file
    public func load() {
        
        _games.removeAll()
        
        //let docDirectory: URL = getDocumentsDirectory().appendingPathComponent("Library.json")
        //let jsonData: Data = try! Data(contentsOf: docDirectory)
        //let jsonData: Data = try! Data(contentsOf: URL.init(fileURLWithPath: "/Users/Authenticated User/Desktop/Library.json"))
        var gameDictionaries: [NSDictionary] = []
        let path: String = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String
        let url = NSURL(fileURLWithPath: path)
        let filePath: String? = url.appendingPathComponent("Library.json")?.path
        let fileManager: FileManager = FileManager.default
        if fileManager.fileExists(atPath: filePath!) {
            let docDirectory: URL = getDocumentsDirectory().appendingPathComponent("Library.json")
            let jsonData: Data = try! Data(contentsOf: docDirectory)
            gameDictionaries = try! JSONSerialization.jsonObject(with: jsonData, options: []) as! [NSDictionary]
        }
        
        for gameDictionary: NSDictionary in gameDictionaries {
            let game: Game = Game(dictionary: gameDictionary)
            game.delegates.append(self)
            _games.append(game)
        }
        NSLog("finish load")
    }
    
    /// Save to a file
    public func save() {
        
        var gameDictionaries: [NSDictionary] = []
        for game: Game in _games {
            gameDictionaries.append(game.dictionaryRepresentation)
        }
        
        
        let jsonData: Data = try! JSONSerialization.data(withJSONObject: gameDictionaries, options: .prettyPrinted)
        let docDirectory: URL = getDocumentsDirectory().appendingPathComponent("Library.json")
        try! jsonData.write(to: docDirectory)
        //try! jsonData.write(to: URL.init(fileURLWithPath: "/Users/Authenticated User/Desktop/Library.json"))
        //NSLog("finsih save")
    }
    
    private func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectory = paths[0]
        return documentsDirectory
    }
    
    private func getDesktop() -> URL {
        let paths = FileManager.default.urls(for: .desktopDirectory, in: .userDomainMask)
        let desktopDirectory = paths[0]
        return desktopDirectory
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
