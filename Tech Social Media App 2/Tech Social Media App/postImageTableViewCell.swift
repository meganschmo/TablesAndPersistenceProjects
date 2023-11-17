//
//  postImageTableViewCell.swift
//  Tech Social Media App
//
//  Created by Megan Schmoyer on 11/13/23.
//

import UIKit

class postImageTableViewCell: UITableViewCell {

    @IBOutlet weak var postImage: UIImageView!
    
    func update(with post: Posts) {
        postImage.image = UIImage(named: post.postPic)
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
