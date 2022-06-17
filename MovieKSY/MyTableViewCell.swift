//
//  MyTableViewCell.swift
//  MovieKSY
//
//  Created by 소프트웨어컴퓨터 on 2022/05/24.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    @IBOutlet weak var movieName: UILabel!
    @IBOutlet weak var audiCount: UILabel!
    @IBOutlet weak var audiAccumulate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
