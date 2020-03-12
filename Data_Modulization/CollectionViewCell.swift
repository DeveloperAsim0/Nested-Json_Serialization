//
//  CollectionViewCell.swift
//  Data_Modulization
//
//  Created by Tarun Meena on 12/03/20.
//  Copyright © 2020 Mihir Vyas. All rights reserved.
//

import UIKit


class CollectionViewCell: UITableViewCell {
    
    @IBOutlet weak var user_Image: UIImageView!
    @IBOutlet weak var user_name: UILabel!
    @IBOutlet weak var user_status: UILabel!
    @IBOutlet weak var user_spicies: UILabel!
    @IBOutlet weak var user_type: UILabel!
    @IBOutlet weak var view: UIView!
    
    @IBOutlet weak var user_name_Details: UILabel!
    @IBOutlet weak var user_status_Details: UILabel!
    @IBOutlet weak var user_spicies_Details: UILabel!
    @IBOutlet weak var user_type_Details: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
}
