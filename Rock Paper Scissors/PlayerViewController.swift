//
//  PlayerViewController.swift
//  Rock Paper Scissors
//
//  Created by fsjguest on 2024-11-26.
//

import UIKit

class PlayerViewController: UIViewController {
    
    var playerWins: Int?
    var computerWins: Int?
    var playerChoice: Int? // Store the player's choice

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func pressedRock(_ sender: UIButton) {
        
        // Store the selected option using the button's tag
        playerChoice = sender.tag
        
        // Perform the segue to the results view
        performSegue(withIdentifier: "showResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showResult" {
            if let destinationVC = segue.destination as? ResultViewController {
                destinationVC.playerChoice = playerChoice
                destinationVC.playerWins = playerWins
                destinationVC.computerWins = computerWins
            }
        }
    }
    
   
    
    
}
