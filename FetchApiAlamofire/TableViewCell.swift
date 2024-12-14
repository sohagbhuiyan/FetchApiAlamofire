//
//  TableViewCell.swift
//  FetchApiAlamofire
//
//  Created by macmini on 8/29/24.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var labelTitle: UILabel!
    
    @IBOutlet weak var labelID: UILabel!
    
    @IBOutlet weak var labelBody: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
