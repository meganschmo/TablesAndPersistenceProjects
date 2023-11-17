//
//  commentsTableViewCell.swift
//  Tech Social Media App
//
//  Created by Megan Schmoyer on 11/13/23.
//

import UIKit

class commentsTableViewCell: UITableViewCell {

    @IBOutlet weak var commentsButton: UIButton!
    @IBOutlet weak var likesButton: UIButton!
    @IBOutlet weak var shareButton: UIButton!
    
    @IBOutlet weak var likesAmountLabel: UILabel!
    
    @IBOutlet weak var commentsLabel: UILabel!
    
    
    
    func update(with post: Posts) {
        likesAmountLabel.text = String(post.numberOflikes)
        commentsLabel.text = post.comments
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func commentsButtonPressed(_ sender: UIButton) {
        
    }
    
    

}
