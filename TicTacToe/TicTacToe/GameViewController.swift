//
//  GameViewController.swift
//  TicTacToe
//
//  Created by u0939404 on 3/8/17.
//  Copyright © 2017 mckayfenn. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    // MARK: - Instance Data
    private let _game: Game = Game()
    
    // MARK: - UIViewController Overrides
    override func loadView() {
        view = GameView()
    }
    
    override func viewDidLoad() {
        view.backgroundColor = UIColor.lightGray
        _game.takeMove(col: 1, row: 1)
        _game.takeMove(col: 0, row: 0)
        _game.takeMove(col: 2, row: 2)
        _game.takeMove(col: 2, row: 1)
        refresh()
    }
    
    
    // MARK: - GameViewController Methods
    var gameView: GameView {
        return view as! GameView
    }
    
    func refresh() {
        var viewTokens: [String] = []
        for boardCol: Int in 0 ..< _game.board.count {
            for boardRow: Int in 0 ..< _game.board[boardCol].count {
                let token: Game.Token = _game.board[boardCol][boardRow]
                switch token {
                case .none : viewTokens.append(" ")
                case .x : viewTokens.append("X")
                case .o : viewTokens.append("O")
                }
            }
        }
        
        gameView.tokens = viewTokens
    }
}
