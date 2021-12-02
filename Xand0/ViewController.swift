//
//  ViewController.swift
//  Xand0
//
//  Created by vatran robert on 2021-11-23.
//

import UIKit

class ViewController: UIViewController {
    
    var activePlayer = 1 //apple logo
    var defaultSquares = [0,0,0,0,0,0,0,0,0]
    var winingCombinations = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
    var gameIsActive = true
    var count = 0
    
    
    @IBOutlet weak var winnerLabel: UILabel!
    @IBOutlet var ImageView: UIView!
    @IBOutlet weak var imageViewSquare: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
        
    }
   
    @IBAction func TapSquare(_ sender: UITapGestureRecognizer)
    {
        print("tap")
        
        let tappedImage = sender.view as! UIImageView
        
        if (defaultSquares[tappedImage.tag-1] == 0) && gameIsActive == true
        {
            defaultSquares[tappedImage.tag-1] = activePlayer
            
            if activePlayer == 1
            {
                if let image = UIImage(named: "ios")
                {
                    tappedImage.image = image
                    print("image")
                    count += 1
                }
                
                activePlayer = 2
            }
            else
            {
                if let image = UIImage(named: "android")
                {
                    tappedImage.image = image
                    print("image")
                    count += 1
                }
                activePlayer = 1
            }
           
       }
        checkWinner()
    }

        
        
    func checkWinner()
    {
        for combination in winingCombinations
        {
            if defaultSquares[combination[0]] != 0 && defaultSquares[combination[0]] == defaultSquares[combination[1]] && defaultSquares[combination[1]] == defaultSquares[combination[2]]
            {
                gameIsActive = false
            
            if defaultSquares[combination[0]] == 1
                {
                winnerLabel.text = "APPLE WON!"
                
                }
            else{
                winnerLabel.text = "ANDROID WON!!"
                
                }
                
            }
            
           
        }
        
        if gameIsActive == true
        {
            if count == 9
                
            {
                winnerLabel.text = "IT'S A DRAW"
            }
        }
        
        
    }
           
    
    @IBAction func restartGameButton(_ sender: UIButton)
    {
        defaultSquares = [0,0,0,0,0,0,0,0,0]
        gameIsActive = true
        activePlayer = 1
        winnerLabel.text = nil
        count = 0
        
        for squares in 1...9
        {
            let square = view.viewWithTag(squares) as! UIImageView
            square.image = nil
        }
        
    }


}


