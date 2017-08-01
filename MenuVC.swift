//
//  MenuVC.swift
//  PlayGround2
//
//  Created by Kevin on 7/19/17.
//  Copyright © 2017 Kevin. All rights reserved.
//

import Foundation
import UIKit

enum gameType {
    case Beginner
    case Intermediate
    case Expert
    case player2
}

class MenuVC: UIViewController {
    
    
    @IBAction func Player2(_ sender: Any) {
        moveToGame(game: .player2)
    }
    
    @IBAction func Beginner(_ sender: Any) {
        moveToGame(game: .Beginner)
    }
    
    @IBAction func Intermediate(_ sender: Any) {
        moveToGame(game: .Intermediate)
    }
    
    @IBAction func Expert(_ sender: Any) {
        moveToGame(game: .Expert)
    }
    
    
    func moveToGame(game : gameType) {
        let gameVC = self.storyboard?.instantiateViewController(withIdentifier: "gameVC") as! GameViewController
        
        currentGameType = game
        
        self.navigationController?.pushViewController(gameVC, animated: true)
        
    }
    
    
    
    
    
}

