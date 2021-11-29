//
//  ViewController.swift
//  Xand0
//
//  Created by vatran robert on 2021-11-23.
//

import UIKit

class ViewController: UIViewController {
    
    var activePlayer = 1
    var gameState = [0,0,0,0,0,0,0,0,0]
    var winingCombinations = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
    var gameIsActive = true
    
    
    @IBOutlet var ImageView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        
        
    }
   
    @IBAction func TapSquare(_ sender: UITapGestureRecognizer) {
        print("tap")
        
        let tappedImage = sender.view as! UIImageView
        
        if (gameState[tappedImage.tag-1] == 0) && gameIsActive == true{
            gameState[tappedImage.tag-1] = activePlayer
            
            if activePlayer == 1  {
                if let image = UIImage(named: "imageX"){
                    tappedImage.image = image
                    print("image")
                }
                
                activePlayer = 2
            }else{
                if let image = UIImage(named: "image0"){
                    tappedImage.image = image
                    print("image")
                }
                activePlayer = 1
            }
            
      }
        checkWinner()
       }
    func checkWinner(){
        for combination in winingCombinations {
            if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]]{
                gameIsActive = false
            
            if gameState[combination[0]] == 1 {
                print("X has won")
            }
            else{
                print("cercle has won")
            }
        }
       
     }
        
  }
        
}

    



