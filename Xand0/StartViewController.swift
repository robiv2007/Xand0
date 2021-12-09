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

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onePlayerButton(_ sender: Any) {
        onePlayer = true
        performSegue(withIdentifier: segueToGame, sender: self)
    }
    
    
    @IBAction func twoPlayersButton(_ sender: Any) {
        onePlayer = false
        performSegue(withIdentifier: segueToGame, sender: self)
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueToGame{
            if let destVC = segue.destination as? ViewController{
                destVC.singlePlayer = onePlayer
            }
        }
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}
