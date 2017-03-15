//
//  GameListViewController.swift
//  MVCBattleship_Homework3
//
//  Created by Cronus on 3/14/17.
//  Copyright © 2017 mckay fenn. All rights reserved.
//

import UIKit

class GameListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, GameListDelegate {
    
    private var _gameListView: UITableView! { return view as! UITableView }
    private var _gameList: GameList = GameList()
    
    override func loadView() {
        let gameTableView: UITableView = UITableView()
        view = gameTableView
    }
    
    override func viewDidLoad() {
        title = "Games"
        
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(createGameClicked))
        self.navigationItem.rightBarButtonItem = addButton
        
        _gameList.delegate = self
        _gameListView.dataSource = self
        _gameListView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return _gameList.gameCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell()
        cell.textLabel?.text = _gameList.gameWithIndex(gameIndex: indexPath.row).currentPlayerIs1 ? "Player 2's turn" : "Player 1's turn"
        cell.backgroundColor = UIColor.white
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let gameIndex: Int = indexPath.row
        
        let gameDetailViewController: GameViewController = GameViewController()
        gameDetailViewController.gameList = _gameList
        gameDetailViewController.gameIndex = gameIndex
        
        navigationController?.pushViewController(gameDetailViewController, animated: true)
    }
    
    func list(list: GameList) {
        _gameListView.reloadData()
    }
    
    
    func createGameClicked() {
        _gameList.createGame(game: Game())
        _gameListView.reloadData()
    }
    
}
