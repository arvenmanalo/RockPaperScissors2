//
//  ResultViewController.swift
//  Rock Paper Scissors
//
//  Created by fsjguest on 2024-11-26.
//

import UIKit

class ResultViewController: UIViewController {

    var playerChoice: Int? // Player's choice passed from the first view controller
    var computerChoice: Int? // Randomly generated computer choice
    
    var playerWins: Int?
    var computerWins: Int?
    
    @IBOutlet weak var playerImageView: UIImageView!
    @IBOutlet weak var computerImageView: UIImageView!
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var resultImageView: UIImageView!
    
    @IBOutlet weak var computerScore: UILabel!
    @IBOutlet weak var playerScore: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Generate the computer's random choice
        computerChoice = Int.random(in: 0...2)

        // Update the UI with the player's and computer's choices
        updateChoices()
        
        // Determine and display the result
        determineResult()
    }

    func updateChoices() {
        guard let playerChoice = playerChoice, let computerChoice = computerChoice else { return }
        
        let images = [
            UIImage(named: "rock"),   // Add images named "rock", "paper", "scissors" to your assets
            UIImage(named: "paper"),
            UIImage(named: "scissors")
        ]

        // Set the images for the player and computer
        playerImageView.image = images[playerChoice]
        computerImageView.image = images[computerChoice]
    }

    func determineResult() {
        guard let playerChoice = playerChoice, let computerChoice = computerChoice else { return }
        
        // Initialize scores if nil
        playerWins = playerWins ?? 0
        computerWins = computerWins ?? 0
        
        /*if computerWins == nil {
            playerWins = 0
        }
        
        if computerWins == nil {
            playerWins = 0
        }*/

        let imagesResult = [
            UIImage(named: "draw"),   // Add images named "draw", "victory", "defeat" to your assets
            UIImage(named: "victory"),
            UIImage(named: "defeat")
        ]
        
        // Determine the result
        if playerChoice == computerChoice {
            resultLabel.text = "It's a Draw!"
            resultImageView.image = imagesResult[0]
        } else if (playerChoice == 0 && computerChoice == 2) || // Rock beats Scissors
                  (playerChoice == 1 && computerChoice == 0) || // Paper beats Rock
                  (playerChoice == 2 && computerChoice == 1) {  // Scissors beats Paper
            resultLabel.text = "You Win!"
            resultImageView.image = imagesResult[1]
            playerWins! += 1
        } else {
            resultLabel.text = "You Lose!"
            resultImageView.image = imagesResult[2]
            computerWins! += 1
        }
        
        playerScore.text = "\(playerWins!)" // Update player score label
        computerScore.text = "\(computerWins!)" // Update computer score label
        
        // Check for a winning score and perform appropriate segue
            if playerWins == 3 {
                playerWins = 0;
                computerWins = 0;
                DispatchQueue.main.async {
                    self.performSegue(withIdentifier: "showWin", sender: self)
                }
            } else if computerWins == 3 {
                playerWins = 0;
                computerWins = 0;
                DispatchQueue.main.async {
                    self.performSegue(withIdentifier: "showLose", sender: self)
                }
            }
    }
    
    @IBAction func pressedNextRound(_ sender: UIButton) {
        performSegue(withIdentifier: "nextRound", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "nextRound" {
            if let destinationVC = segue.destination as? PlayerViewController {
                destinationVC.playerWins = playerWins
                destinationVC.computerWins = computerWins
            }
        }
    }
    
}
