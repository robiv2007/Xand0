//
//  ViewController.swift
//  Xand0
//
//  Created by vatran robert on 2021-11-23.
//

import UIKit

class ViewController: UIViewController {
    
    var activePlayer = 1
    
    
    @IBOutlet var ImageView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        
        
    }
   
    @IBAction func TapSquare(_ sender: UITapGestureRecognizer) {
        print("tap")
        let tappedImage = sender.view as! UIImageView
        if activePlayer == 1{
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
        
        
    }

    



