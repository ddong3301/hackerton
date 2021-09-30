//
//  SideViewTableViewCell.swift
//  subeye
//
//  Created by 고준혁 on 2021/09/30.
//

import UIKit

class SideViewTableViewCell: UITableViewCell {

    static let identifer = "Sideviewcell"
    
    
    func addviews() {
        
       
        
        
    }
    
    func autolayout() {
        NSLayoutConstraint.activate([
            
            
            
        
        ] )
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        addviews()
        autolayout()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }

}
