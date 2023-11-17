//
//  ProfileTableViewCell.swift
//  Tech Social Media App
//
//  Created by Megan Schmoyer on 11/13/23.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {
    
    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var usernamelabel: UILabel!
    
    @IBOutlet weak var postdescriptionlabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    func update(with post: Posts) {
        profileImage.image = UIImage(named: post.profilePic)
        usernamelabel.text = post.username
        postdescriptionlabel.text = post.postdescription
        dateLabel.text = post.postDate
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
