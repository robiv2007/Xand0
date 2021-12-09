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
    var singlePlayer = false
    
    
    @IBOutlet weak var tap1: UIImageView!
    @IBOutlet weak var tap2: UIImageView!
    @IBOutlet weak var tap3: UIImageView!
    @IBOutlet weak var tap4: UIImageView!
    @IBOutlet weak var tap5: UIImageView!
    @IBOutlet weak var tap6: UIImageView!
    @IBOutlet weak var tap7: UIImageView!
    @IBOutlet weak var tap8: UIImageView!
    @IBOutlet weak var tap9: UIImageView!
    
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
        if singlePlayer == true
        {
            AIPlayer()
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
        
        if gameIsActive == true && count == 9
        {
                winnerLabel.text = "IT'S A DRAW"
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
    
    func AIPlayer() {
        checkWinner()
        
           var randomPick = Int.random(in: 0...8)
           while (defaultSquares[randomPick] != 0 && count <= 8 && gameIsActive == true)
           {
               //randomPick = Int.random(in: 0...8)
               for square in defaultSquares {
                   if square == 0 && square != 1{
                       
                     randomPick = Int.random(in: 0...8)
                   }
               }
               
           }
           
           activePlayer = 1
           defaultSquares[randomPick] = 2
           
           if count <= 8  {
               count += 1}
           
        if count <= 8 && gameIsActive == true{
            
            switch randomPick
            {
            case 0:
                tap1.image = UIImage(named: "android")
//                DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute:{self.tap1.image = UIImage(named: "android")} )
                
            case 1:
                tap2.image = UIImage(named: "android")
//                DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute:{self.tap2.image = UIImage(named: "android")} )

            case 2:
                tap3.image = UIImage(named: "android")
//                DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute:{self.tap3.image = UIImage(named: "android")} )

            case 3:
                tap4.image = UIImage(named: "android")
//                DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute:{self.tap4.image = UIImage(named: "android")} )

            case 4:
                tap5.image = UIImage(named: "android")
//                DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute:{self.tap5.image = UIImage(named: "android")} )

            case 5:
                tap6.image = UIImage(named: "android")
//                DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute:{self.tap6.image = UIImage(named: "android")} )
                

            case 6:
                tap7.image = UIImage(named: "android")
//                DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute:{self.tap7.image = UIImage(named: "android")} )

            case 7:
                tap8.image = UIImage(named: "android")
//                DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute:{self.tap8.image = UIImage(named: "android")} )

            case 8:
                tap9.image = UIImage(named: "android")
//                DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute:{self.tap9.image = UIImage(named: "android")} )

                
            default:
                break
                
            }
            
        }
        
          
           print("Bot")
           print(defaultSquares)
           print(count)
           print(gameIsActive)
           
           
       }

}


