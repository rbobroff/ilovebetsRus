//
//  newTableViewCell.swift
//  
//
//  Created by Roman Bobrov on 26.04.2020.
//

import UIKit

class newTableViewCell: UITableViewCell {

   
    
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelSubtitle: UILabel!
    @IBOutlet weak var labelDot: UILabel!
    
    func initCell(article: Article) {
        labelTitle.text = article.title
        labelSubtitle.text = article.publishedAt
        labelDot.text = article.dot
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
