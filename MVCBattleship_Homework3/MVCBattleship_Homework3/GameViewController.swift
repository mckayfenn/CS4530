//
//  GameViewController.swift
//  MVCBattleship_Homework3
//
//  Created by u0939404 on 3/10/17.
//  Copyright © 2017 mckay fenn. All rights reserved.
//

import UIKit

class GameViewController: UIViewController, GameViewDelegate, GameModelDelegate {
    private var _gameList: GameList? = nil
    private var _gameIndex: Int? = nil
    
    private var _game: Game
    
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
    
    init (game: Game) {
        _game = game
        super.init(nibName: nil, bundle: nil)
        _game.delegates.append(self)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = GameView()
        self.edgesForExtendedLayout = []
        gameView.delegate = self
        _game.delegates.append(self)
    }
    
    override func viewDidLoad() {
        view.backgroundColor = UIColor.white
        
        gameView.delegate = self
        _game.delegates.append(self)

        dontAllowMultipleTouches()
        
        refresh()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        if(_gameList == nil || _gameIndex == nil) {
            return
        }
        
        let game: Game = (_gameList?.gameWithIndex(gameIndex: gameIndex!))!
        gameView.game = game
        
        dontAllowMultipleTouches()
        
        switchGrids()
    }
    
    func deleteGameSelected() {
        NSLog("delete game selected")
        _gameList?.deleteGameIndex(gameIndex: gameIndex!)
        _ = navigationController?.popViewController(animated: true)
    }
    
    func tochedInRect(row: Int, col: Int) {
        // Only allow a single selection per turn.
        if (!multipleTouches) {
            //NSLog("take move in row:\(row), col:\(col)")
            _gameList?.gameWithIndex(gameIndex: gameIndex!).takeMove(row: row, col: col)
        
            _ = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(showChangeScreen), userInfo: nil, repeats: false)
        
            // TODO: Make this change in response to the game actually changing
            
            refresh()
        }
        multipleTouches = true
        
    }
    
    
    private var p1Tokens: [String] = []
    private var p2Tokens: [String] = []
    func refresh() {
        p1Tokens = []
        //var p1Tokens: [String] = []
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
        
        p2Tokens = []
        //var p2Tokens: [String] = []
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
        
        //view.setNeedsDisplay()
        
        
        //view.setNeedsDisplay()
        if (_gameList?.gameWithIndex(gameIndex: gameIndex!).currentPlayerIs1)! {
            gameView.p1Grid = p1Tokens
            gameView.p2Grid = p2Tokens
        }
        else {
            gameView.p1Grid = p2Tokens
            gameView.p2Grid = p1Tokens
        }
        gameView.setNeedsDisplay()
        
    }
    
    func switchGrids() {
        NSLog("switch grids")
        if (_gameList?.gameWithIndex(gameIndex: gameIndex!).currentPlayerIs1)! {
            gameView.p1Grid = p2Tokens
            gameView.p2Grid = p1Tokens
        }
        else {
            gameView.p1Grid = p1Tokens
            gameView.p2Grid = p2Tokens
        }
        gameView.setNeedsDisplay()
    }
    
    private var multipleTouches = false
    
    func dontAllowMultipleTouches() {
        multipleTouches = false
    }
    
    private var alert: UIAlertController!
    
    func showTouchedStatus(status: String) {
        //alert = UIAlertController(title: status, message: nil, preferredStyle: UIAlertControllerStyle.alert)
        
        //self.present(alert, animated: true, completion: nil)
        
        //_ = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(dismissAlert), userInfo: nil, repeats: false)

    }
    func dismissAlert() {
        self.alert.dismiss(animated: true, completion: nil)
    }
    
    func showChangeScreen() {
        let change: UIViewController = ChangePlayerView()
        self.navigationController?.pushViewController(change, animated: true)
    }
}
