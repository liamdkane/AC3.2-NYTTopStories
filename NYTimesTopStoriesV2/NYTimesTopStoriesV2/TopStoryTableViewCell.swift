//
//  TopStoryTableViewCell.swift
//  NYTimesTopStoriesV2
//
//  Created by C4Q on 11/20/16.
//  Copyright © 2016 C4Q. All rights reserved.
//

import UIKit

class TopStoryTableViewCell: UITableViewCell {
    
    var article: Article? {
        didSet {
            guard let art = self.article else {return}
            self.titleLabel.text = art.title
            self.abstractLabel.text = art.abstract
            self.bylineLabel.text = art.byline
            self.dateLabel.text = art.publishedDate
        }
    }

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var abstractLabel: UILabel!
    @IBOutlet weak var bylineLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
}
