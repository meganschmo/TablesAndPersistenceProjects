//
//  DetailViewController.swift
//  FavoriteAthlete
//
//  Created by Megan Schmoyer on 10/11/23.
//

import UIKit

class DetailViewController: UIViewController {
    
    init?(coder: NSCoder, favoriteAthlete: Athlete?) {
        super.init(coder: coder)
    }
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    var favAthlete: Athlete?
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var ageTextField: UITextField!
    
    @IBOutlet weak var leagueTextField: UITextField!
    
    @IBOutlet weak var teamTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let favAthlete {
            nameTextField.text = favAthlete.name
            ageTextField.text = favAthlete.age
            leagueTextField.text = favAthlete.league
            teamTextField.text = favAthlete.team
        }

        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        let favAthlete = Athlete(name: nameTextField.text!, age: ageTextField.text!, league: leagueTextField.text!, team: teamTextField.text!)
        
        self.favAthlete = favAthlete
        
        performSegue(withIdentifier: "unwind", sender: self)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
