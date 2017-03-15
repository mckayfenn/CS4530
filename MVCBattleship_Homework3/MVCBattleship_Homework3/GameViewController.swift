//
//  GameViewController.swift
//  MVCBattleship_Homework3
//
//  Created by u0939404 on 3/10/17.
//  Copyright © 2017 mckay fenn. All rights reserved.
//

import UIKit

class GameViewController: UIViewController, GameViewDelegate {
    private var _gameList: GameList? = nil
    private var _gameIndex: Int? = nil
    
    var gameList: GameList? {
        get { return _gameList }
        set { _gameList = newValue }
    }
    var gameIndex: Int? {
        get { return _gameIndex }
        set { _gameIndex = newValue }
    }
    
    var gameView: GameView {
        return view as! GameView
    }
    
    override func loadView() {
        view = GameView()
        gameView.delegate = self
    }
    
    override func viewDidLoad() {
        view.backgroundColor = UIColor.white
        
        gameView.delegate = self
        
        
//        _game.takeMove(row: 1, col: 1)
//        _game.takeMove(row: 3, col: 2)
        refresh()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        if(_gameList == nil || _gameIndex == nil) {
            return
        }
        
        let game: Game = (_gameList?.gameWithIndex(gameIndex: gameIndex!))!
        gameView.game = game
    }
    
    func deleteGameSelected() {
        NSLog("delete game selected")
        _gameList?.deletePaintingIndex(gameIndex: gameIndex!)
        _ = navigationController?.popViewController(animated: true)
    }
    
    func tochedInRect(row: Int, col: Int) {
        NSLog("take move in \(row), \(col)")
        _gameList?.gameWithIndex(gameIndex: gameIndex!).takeMove(row: row, col: col)
        refresh()
        
    }
    
    func refresh() {
        var p1Tokens: [String] = []
        for boardRow: Int in 0 ..< (_gameList?.gameWithIndex(gameIndex: gameIndex!).p1Grid.count)! {
            for boardCol: Int in 0 ..< (_gameList?.gameWithIndex(gameIndex: gameIndex!).p1Grid.count)! {
                let token: Game.Ships = (_gameList?.gameWithIndex(gameIndex: gameIndex!).p1Grid[boardRow][boardCol])!
                switch token {
                case .none : p1Tokens.append("none")
                case .miss : p1Tokens.append("miss")
                case .ship : p1Tokens.append("ship")
                case .hit : p1Tokens.append("hit")
                }
            }
        }
        
        var p2Tokens: [String] = []
        for boardRow: Int in 0 ..< (_gameList?.gameWithIndex(gameIndex: gameIndex!).p2Grid.count)! {
            for boardCol: Int in 0 ..< (_gameList?.gameWithIndex(gameIndex: gameIndex!).p2Grid.count)! {
                let token: Game.Ships = (_gameList?.gameWithIndex(gameIndex: gameIndex!).p2Grid[boardRow][boardCol])!
                switch token {
                case .none : p2Tokens.append("none")
                case .miss : p2Tokens.append("miss")
                case .ship : p2Tokens.append("ship")
                case .hit : p2Tokens.append("hit")
                }
            }
        }
        
        if (_gameList?.gameWithIndex(gameIndex: gameIndex!).currentPlayerIs1)! {
            gameView.p1Grid = p2Tokens
            gameView.p2Grid = p1Tokens
        }
        else {
            gameView.p1Grid = p1Tokens
            gameView.p2Grid = p2Tokens
        }
        
    }
}
