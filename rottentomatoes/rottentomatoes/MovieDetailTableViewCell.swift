//
//  MovieDetailTableViewCell.swift
//  rottentomatoes
//
//  Created by Kushagra Kumar Tiwary on 9/14/14.
//  Copyright (c) 2014 myorg. All rights reserved.
//

import UIKit

class MovieDetailTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var syopsisLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
