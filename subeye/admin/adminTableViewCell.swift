//
//  adminTableViewCell.swift
//  subeye
//
//  Created by 고준혁 on 2021/10/20.
//

import UIKit

class adminTableViewCell: UITableViewCell {

    static let identifier = "adminTableviewCellidentifeir"
    
    let adminnumber: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.textColor = UIColor(red: 123/255, green: 180/255, blue: 72/255, alpha: 1)
//        label.layer.borderWidth = 2
//        label.layer.borderColor = UIColor(red: 123/255, green: 180/255, blue: 72/255, alpha: 1).cgColor
//        label.layer.cornerRadius = 5
        label.text = "30"
        label.textAlignment = .center
        
        label.font = UIFont.boldSystemFont(ofSize: 30)
        
        
        return label
    }()
    
    let admintitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.textColor = .black
        label.text = "NULL"
        
        label.font = UIFont.boldSystemFont(ofSize: 30)
        
        
        return label
    }()
    
     
    func addviews() {
        
        contentView.addSubview(adminnumber)
        contentView.addSubview(admintitle)
        
        
    }
    
    func autolayout() {
        NSLayoutConstraint.activate([
            
            adminnumber.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            adminnumber.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            adminnumber.widthAnchor.constraint(equalToConstant: contentView.frame.width / 2),
            adminnumber.heightAnchor.constraint(equalToConstant: 50),
            
            admintitle.leadingAnchor.constraint(equalTo: adminnumber.trailingAnchor, constant: 10),
            admintitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            admintitle.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
          
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
