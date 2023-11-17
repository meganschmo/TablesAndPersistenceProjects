//
//  NewsFeedTableViewController.swift
//  Tech Social Media App
//
//  Created by Megan Schmoyer on 11/12/23.
//

import UIKit

class NewsFeedTableViewController: UITableViewController {
    var posts: [Posts] = [Posts(profilePic: "profile", username: "G000se", postdescription: "I really still do not know how to code.", postDate: "Oct 4, 2023 9:45am", postPic: "IMG_3728", numberOflikes: 50, comments: "Wow \nWe aren't your therapist"), Posts(profilePic: "profilepic1", username: "Bearrr", postdescription: "idk", postDate: "Nov 13, 2023 9:11am", postPic: "postpic1", numberOflikes: 63, comments: "comments"), Posts(profilePic: "profilepic2", username: "FlyingCrane", postdescription: "This cake is the best treat to eat when your'e coding", postDate: "Sept 19, 2023 12:07am", postPic: "postpic2", numberOflikes: 5, comments: "I love cake"), Posts(profilePic: "profilepic3", username: "SadToad", postdescription: "BIIIIIGGGG STREEEEETCHHH", postDate: "Jan 30, 2023 4:01am", postPic: "postpic3", numberOflikes: 208, comments: "Cool \nSo cuuuute"), Posts(profilePic: "profilepic4", username: "dripdripLogan", postdescription: "Started my internship in Tokyo, Japan", postDate: "Aug 8, 2023 4:42pm", postPic: "postpic4", numberOflikes: 0, comments: "Way to brag"), Posts(profilePic: "profilpic5", username: "BillyJayJooel", postdescription: "Launching my new app on the app store!", postDate: "Mar 31, 2023 8:09am", postPic: "postpic5", numberOflikes: 782, comments: "I literally cannot"), Posts(profilePic: "profilepic6", username: "dojaCat", postdescription: "Career Change, I'm a google queen now.", postDate: "Dec 6, 2023 9:05am", postPic: "postpic6", numberOflikes: 8, comments: "That's cool I guess"), Posts(profilePic: "profilepic7", username: "BerryMary", postdescription: "Why do work, when you can eat sushi", postDate: "Jan 10, 2023 7:57pm", postPic: "postpic7", numberOflikes: 9, comments: "I love sushi!!!"), Posts(profilePic: "profilepic8", username: "TedBundyFan", postdescription: "Love that I now get to work from home, here's my new setup", postDate: "April", postPic: "postpic8", numberOflikes: 3, comments: "This is your mom henry, I love that you are doing so well. Make sure you take me on a cruise"), Posts(profilePic: "profilepic9", username: "ILuvUrMom", postdescription: "For some reason my app isn't working", postDate: "July 4, 2023 7:42pm", postPic: "postpic9", numberOflikes: 240, comments: "You have to work on the 4th of July? \nSomebody get this man a raise!")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100
       

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return posts.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let post = posts[indexPath.section]

        switch indexPath.row {
        case 0:
            if let profileCell = tableView.dequeueReusableCell(withIdentifier: "ProfileIdentifier", for: indexPath) as? ProfileTableViewCell {
                profileCell.update(with: post)
                return profileCell
            }
        case 1:
            if let postImageCell = tableView.dequeueReusableCell(withIdentifier: "PostImageIdentifier", for: indexPath) as? postImageTableViewCell {
                // Configure the postImageCell...
                postImageCell.update(with: post)
                return postImageCell
            }
        case 2:
            if let commentsCell = tableView.dequeueReusableCell(withIdentifier: "CommentsIdentifier", for: indexPath) as? commentsTableViewCell {
                // Configure the commentsCell...
                commentsCell.update(with: post)
                return commentsCell
            }
        default:
            break
        }
              // Handle other cases if needed
              return UITableViewCell()
          
      }
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
           let post = posts[indexPath.section]

           switch indexPath.row {
           case 0:
            
               let profileCellHeight: CGFloat = 60
               return profileCellHeight

           case 1:
          
               let imageCellHeight: CGFloat = 250
               return imageCellHeight

           case 2:
              
               let buttonsCellHeight: CGFloat = 150
               return buttonsCellHeight

           default:
            
               return 44
           }
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

}
