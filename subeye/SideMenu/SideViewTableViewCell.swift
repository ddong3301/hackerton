//
//  SideViewTableViewCell.swift
//  subeye
//
//  Created by 고준혁 on 2021/09/30.
//

import UIKit

class SideViewTableViewCell: UITableViewCell {

     static let identifer = "Sideviewcell"
    
    let cellview: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        view.layer.cornerRadius = 15
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor(red: 123/255, green: 180/255, blue: 72/255, alpha: 1).cgColor
        
        
        return view
    }()
    
    let menuicons : UIImageView = {
        let icon = UIImageView()
        
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.backgroundColor = .gray
        
        
        return icon
    }()
    
    
    
    
    
    
    func addviews() {
        contentView.addSubview(cellview)
        contentView.addSubview(menuicons)
       
        
        
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
