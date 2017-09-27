//
//  PixabayPhotoCell.swift
//  InterviewSample
//
//  Created by Eugen Fedchenko on 9/27/17.
//  Copyright © 2017 wirex. All rights reserved.
//

import UIKit

class PixabayPhotoCell: UITableViewCell {
    
    static let id = "PixabayPhotoCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBOutlet weak var thumb: UIImageView!
    @IBOutlet weak var user: UILabel!
    @IBOutlet weak var tags: UILabel!
    
}
