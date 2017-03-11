//
//  GameViewController.swift
//  MVCBattleship_Homework3
//
//  Created by u0939404 on 3/10/17.
//  Copyright © 2017 mckay fenn. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    private let _game: Game = Game()
    
    override func loadView() {
        view = GameView()
    }
    
    override func viewDidLoad() {
        view.backgroundColor = UIColor.white
        _game.takeMove(row: 1, col: 1)
        _game.takeMove(row: 3, col: 2)
        refresh()
    }
    
    var gameView: GameView {
        return view as! GameView
    }
    
    func refresh() {
        var p1Tokens: [String] = []
        for boardRow: Int in 0 ..< _game.p1Grid.count {
            for boardCol: Int in 0 ..< _game.p1Grid.count {
                let token: Game.Ships = _game.p1Grid[boardRow][boardCol]
                switch token {
                    case .none : p1Tokens.append("none")
                    case .miss : p1Tokens.append("miss")
                    case .ship : p1Tokens.append("ship")
                    case .hit : p1Tokens.append("hit")
                }
            }
        }
        
        var p2Tokens: [String] = []
        for boardRow: Int in 0 ..< _game.p2Grid.count {
            for boardCol: Int in 0 ..< _game.p2Grid.count {
                let token: Game.Ships = _game.p2Grid[boardRow][boardCol]
                switch token {
                case .none : p2Tokens.append("none")
                case .miss : p2Tokens.append("miss")
                case .ship : p2Tokens.append("ship")
                case .hit : p2Tokens.append("hit")
                }
            }
        }
        
        gameView.p1Grid = p1Tokens
        gameView.p2Grid = p2Tokens
    }
}
