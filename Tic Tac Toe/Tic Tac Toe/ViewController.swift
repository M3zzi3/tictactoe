//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by remy on 6/5/15.
//  Copyright (c) 2015 LiquidGroup. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // 1 = noughts and 2 = crosses

    var activePlayer = 1;
    
    var gameActive = true;
    
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0];
    
    var winningCombinations = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]];
    
    @IBOutlet var button: UIButton!
    
    @IBOutlet var resultLabel: UILabel!
    
    @IBOutlet var gameOverButton: UIButton!
    
    @IBAction func gameOver(sender: AnyObject) {
        
        activePlayer = 1;
        
        gameActive = true;
        
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0];
        
        var button : UIButton;
        
        for var i = 0; i < 9; i++ {
        
        button = view.viewWithTag(i) as! UIButton
        
        button.setImage(nil, forState: .Normal)
        
        }
        
        resultLabel.hidden = true
        
        gameOverButton.hidden = true
        
        resultLabel.center = CGPointMake(resultLabel.center.x - 400, resultLabel.center.y);
        
        gameOverButton.center = CGPointMake(gameOverButton.center.x - 400, gameOverButton.center.y);
    
    }
    
    @IBAction func buttonPressed(sender: AnyObject) {
        
        if gameState[sender.tag] == 0 && gameActive == true {
            
            gameState[sender.tag] = activePlayer
        
            var image = UIImage()
        
            if activePlayer == 1 {
            
                activePlayer = 2;
        
                image = UIImage(named: "nought.png")!
        
            } else {
            
                activePlayer = 1;
            
                image = UIImage(named: "cross.png")!;
            
            }
        
            sender.setImage(image, forState: .Normal)
            
            for combination in winningCombinations {
            
                if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]] {
                    
                    var labelText = "Noughts has won!";
                    
                    if gameState[combination[0]] == 2 {
                        
                        
                        labelText = "noughts has won";
                        
                    }
                    
                    resultLabel.text = labelText
                    
                    resultLabel.hidden = false
                    
                    gameOverButton.hidden = false
                    
                    UIView.animateWithDuration(0.5, animations: { () -> Void in
                        
                        self.resultLabel.center = CGPointMake(self.resultLabel.center.x + 400, self.resultLabel.center.y);
                        
                        self.gameOverButton.center = CGPointMake(self.gameOverButton.center.x + 400, self.gameOverButton.center.y);
                        
                    })
                    gameActive = false;
                
                }
                
            }
        
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        resultLabel.hidden = true
        
        gameOverButton.hidden = true
        
        resultLabel.center = CGPointMake(resultLabel.center.x - 400, resultLabel.center.y);
        
        gameOverButton.center = CGPointMake(gameOverButton.center.x - 400, gameOverButton.center.y);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLayoutSubviews() {
    
        
        
    
    }


}

