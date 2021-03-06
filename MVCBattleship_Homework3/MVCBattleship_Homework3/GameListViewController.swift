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
    //private var _gameList: GameList = GameList()
    private var _gameList: GameList = GameList.Instance
    
    override func loadView() {
        let gameTableView: UITableView = UITableView()
        view = gameTableView
        _gameList.load()
    }
    
    override func viewDidLoad() {
        title = "Games"
        
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(createGameClicked))
        self.navigationItem.rightBarButtonItem = addButton
        
        _gameList.delegate = self
        _gameListView.dataSource = self
        _gameListView.delegate = self
    }
    override func viewWillAppear(_ animated: Bool) {
        // load games from file
        //_gameList.load()
        _gameListView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return _gameList.gameCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell: UITableViewCell = UITableViewCell()
        
        let cell: UITableViewCell = {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell") else {
                // Never fails:
                return UITableViewCell(style: UITableViewCellStyle.value1, reuseIdentifier: "UITableViewCell")
            }
            return cell
        }()
        
        var labelText: String = ""
        
        if _gameList.gameWithIndex(gameIndex: indexPath.row).winner == 1 {
            labelText = "Player 1 Won!"
        }
        else if _gameList.gameWithIndex(gameIndex: indexPath.row).winner == 2 {
            labelText = "Player 2 Won!"
        }
        else if _gameList.gameWithIndex(gameIndex: indexPath.row).currentPlayerIs1 {
            labelText = "Player 2's turn"
        }
        else if !_gameList.gameWithIndex(gameIndex: indexPath.row).currentPlayerIs1 {
            labelText = "Player 1's turn"
        }
        
        cell.textLabel?.text = labelText
        let p1ShipsSunk = _gameList.gameWithIndex(gameIndex: indexPath.row).p1ShipsSunk
        let p2ShipsSunk = _gameList.gameWithIndex(gameIndex: indexPath.row).p2ShipsSunk
        let detailLabel: String = "P1 sunk: \(p1ShipsSunk) ships.  P2 sunk: \(p2ShipsSunk) ships."
        cell.detailTextLabel?.text = detailLabel
        cell.detailTextLabel?.font = cell.detailTextLabel?.font.withSize(9)
        cell.detailTextLabel?.textColor = UIColor.blue
        cell.backgroundColor = UIColor.white
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let gameIndex: Int = indexPath.row
        let game: Game = _gameList.gameWithIndex(gameIndex: gameIndex)
        
        let gameDetailViewController: GameViewController = GameViewController(game: game)
        
        navigationController?.pushViewController(gameDetailViewController, animated: true)
    }
    
    func list(list: GameList) {
        NSLog("When is this called?")
        _gameListView.reloadData()
    }
    
    func boardChanged() {
        // TODO: save the game here
        _gameList.save()
        NSLog("GameListViewController says to save the game")
    }
    
    func gameWon(player: Int) {
        // maybe do something here
        _gameList.save()
    }
    
    
    func createGameClicked() {
        _gameList.createGame()
        _gameListView.reloadData()
    }
    
}
