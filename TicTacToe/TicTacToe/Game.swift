//
//  Game.swift
//  TicTacToe
//
//  Created by u0939404 on 3/6/17.
//  Copyright © 2017 mckayfenn. All rights reserved.
//

import Foundation

class Game {
    
    // ------------------------------
    // MARK: - Static Members
    // ------------------------------
    public enum Token {
        case none
        case x
        case o
    }
    
    // ------------------------------
    // MARK: - Instance Data
    // ------------------------------
    private var _board: [[Token]] = [[.none, .none, .none], [.none, .none, .none], [.none, .none, .none]]
    
    
    // ------------------------------
    // MARK: - Attributes
    // ------------------------------
    
    /// Determins the current player.
    ///
    /// Give additional detail.
    ///
    /// @return @a true if the player is the X player, @a false if it is the O player
    ///
    public var currentPlayerIsX: Bool {
        return movesTaken % 2 == 0
    }
    
    public var movesTaken: Int {
        var count = 0
        for boardCol: [Token] in _board {
            for token: Token in boardCol {
                if (token != .none) {
                    count = count + 1
                }
            }
        }
        return count
    }
    
    public var winner: Token {
        // TODO: Determine winner
        return .none
    }
    
    public var board: [[Token]] {
        return _board
    }
    
    
    // ------------------------------
    // MARK: - Moves
    // ------------------------------
    public func takeMove(col: Int, row: Int) {
        if (_board[col][row] == .none) {
            _board[col][row] = currentPlayerIsX ? .x : .o
        }
        
    }
    
    
    
}
