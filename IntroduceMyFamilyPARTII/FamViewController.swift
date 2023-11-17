//
//  FamViewController.swift
//  IntroduceMyFamily
//
//  Created by Megan Schmoyer on 9/26/23.
//

import UIKit

class FamViewController: UIViewController {
   
    var familyMember: FamilyMember?

    @IBOutlet weak var familyImage: UIImageView!
    @IBOutlet weak var familyName: UILabel!
    @IBOutlet weak var familyDescription: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()

        // Do any additional setup after loading the view.
    }
    func updateUI() {
        if let familyMember = familyMember {
            familyName.text = familyMember.familyMemberName
            familyImage.image = UIImage(named: familyMember.familyMemberImage)
            familyDescription.text = familyMember.familyMemberDescription
        }
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
