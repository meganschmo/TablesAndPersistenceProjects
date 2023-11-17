//
//  AddPlayerViewController.swift
//  Score Keeper
//
//  Created by Megan Schmoyer on 11/15/23.
//

import UIKit

import UIKit

class AddPlayerViewController: UIViewController {
    
    @IBOutlet weak var newPlayerScore: UITextField!
    @IBOutlet weak var newPlayerName: UITextField!
    var newPlayer: Player?
    override func viewDidLoad() {
            super.viewDidLoad()
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        
        // Define the colors for the gradient
        let color1 = UIColor.red.cgColor
        let color2 = UIColor.blue.cgColor
        gradientLayer.colors = [color1, color2]
        
        // Set the direction of the gradient
        gradientLayer.startPoint = CGPoint(x: 1, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0, y: 1)
        
        // Add the gradient layer to your view's layer
        view.layer.insertSublayer(gradientLayer, at: 0)
        
        let animation = CABasicAnimation(keyPath: "colors")
        animation.fromValue = [color1, color2]
        animation.toValue = [color2, color1]
        animation.autoreverses = true
        animation.duration = 1.5
        animation.repeatCount = Float.infinity
        
        // Add the animation to the gradient layer
        gradientLayer.add(animation, forKey: "gradientAnimation")
        
        
        }
        

    
    @IBAction func addButtonTapped(_ sender: Any) {
        
        if let text = newPlayerScore.text, let intValue = Int(text) {
            
            newPlayer = Player(playerName: newPlayerName.text ?? " ", playerScore: intValue)
        } else { return }
        performSegue(withIdentifier: "unwind", sender: self)
        
    }
}
