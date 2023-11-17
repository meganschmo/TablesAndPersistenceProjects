//
//  FamilyMembersTableViewController.swift
//  IntroduceMyFamily
//
//  Created by Megan Schmoyer on 11/8/23.
//

import UIKit

class FamilyMembersTableViewController: UITableViewController {
 
    var familyMember: [FamilyMember] = [FamilyMember(familyMemberName: "Brayden", familyMemberImage: "brayden", familyMemberDescription: "Brayden is my husband. He likes Magic: The Gathering. He plays guitar and really likes coffee cake."),
                                     FamilyMember(familyMemberName: "Inosuke", familyMemberImage: "Ino", familyMemberDescription: "Inosuke is trouble, we named her after a anime character from 'Demon Slayer'. She is banned from hairties."),
                                     FamilyMember(familyMemberName: "Nezuko", familyMemberImage: "Nezzy", familyMemberDescription: "Nezuko can be very shy. She doesn't like to be picked up and usually gets jealous if another cat is getting attention. She likes to eat bread."),
                                     FamilyMember(familyMemberName: "Zenitsu", familyMemberImage: "Zenni", familyMemberDescription: "Zenitsu is the best behaved but also a scaredy cat, hence his name. He likes to meow very loudly when it is bedtime."),
                                    FamilyMember(familyMemberName: "Megan", familyMemberImage: "me", familyMemberDescription: "I like to read, create art, bake, and go hunting.")]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return familyMember.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "familyName", for: indexPath)

        let familyName = familyMember[indexPath.row]
        cell.textLabel?.text = "Family Member"
        cell.detailTextLabel?.text = familyName.familyMemberName

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBSegueAction func toDetailFamView(_ coder: NSCoder, sender: Any?) -> UINavigationController? {
        let navigationController = UINavigationController(coder: coder)
        let detailController = navigationController?.viewControllers.first as? FamViewController
        guard let detailController = detailController else {
          return UINavigationController(coder: coder)
        }
        guard let cell = sender as? UITableViewCell,
           let indexPath = tableView.indexPath(for: cell) else {
          return navigationController
        }
        tableView.deselectRow(at: indexPath, animated: true)
        let family = familyMember[indexPath.row]
        detailController.familyMember = family
        
        return navigationController
    }
}
