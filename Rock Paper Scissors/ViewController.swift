//
//  ViewController.swift
//  Rock Paper Scissors
//
//  Created by fsjguest on 2024-11-21.
//

import UIKit

class ViewController: UIViewController {
    
    var playerWins = 0
    var computerWins = 0
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func gotoHelp(_ sender: UIButton) {
        performSegue(withIdentifier: "goToHelp", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToHelp" {
            if let destinationVC = segue.destination as? SecondViewController {
                destinationVC.modalPresentationStyle = .fullScreen
            }
        }
        
        if segue.identifier == "showPlayer" {
            if let destinationVC = segue.destination as? PlayerViewController {
                destinationVC.playerWins = playerWins
                destinationVC.computerWins = computerWins
            }
        }
    }
    
    
    
    
    
}

