//
//  StartViewController.swift
//  Xand0
//
//  Created by vatran robert on 2021-12-09.
//

import UIKit

class StartViewController: UIViewController {
    
    var segueToGame = "segueToGame"
    var onePlayer = false
    @IBOutlet weak var playerOneText: UITextField!
    @IBOutlet weak var playerTwoText: UITextField!
    var p1 = "APPLE"
    var p2 = "ANDROID"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onePlayerButton(_ sender: Any) {
        onePlayer = true
        playerOneText.text = p1
        playerTwoText.text = p2
    
        performSegue(withIdentifier: segueToGame, sender: self)
    }
    
    
    @IBAction func twoPlayersButton(_ sender: Any) {
        onePlayer = false
        let playerOneName = playerOneText.text
        let playerTwoName = playerTwoText.text
        if playerOneName != nil && playerTwoName != nil {
            performSegue(withIdentifier: segueToGame, sender: self)
        }
            
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueToGame{
            if let destVC = segue.destination as? ViewController{
                destVC.singlePlayer = onePlayer
                destVC.playerOneName = playerOneText.text ?? "Apple"
                destVC.playerTwoName = playerTwoText.text ?? "Android"
                
                
                
                
        }
            
        
        
        }
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}
