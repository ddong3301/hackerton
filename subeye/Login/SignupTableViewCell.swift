//
//  SignupTableViewCell.swift
//  subeye
//
//  Created by 고준혁 on 2021/09/20.
//

import UIKit

class SignupTableViewCell: UITableViewCell {
    
    

    let stationname: UILabel = {
        let label = UILabel()
       
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.text = "초기값"
        label.textColor  = .black
        label.font = UIFont.systemFont(ofSize: 15)
        label.textAlignment = .center
        
        
        return label
    }()
    
    func addviews() {
        
        contentView.addSubview(stationname)
        
        
        
    }
    
    func autolayout() {
        NSLayoutConstraint.activate([
        
        
        stationname.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
        stationname.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
        
        
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
