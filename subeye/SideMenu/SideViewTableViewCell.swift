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
    
    let menuLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 20)
        
        
        return label
    }()
    
    
    
    
    
    
    func addviews() {
        contentView.addSubview(cellview)
        cellview.addSubview(menuicons)
        cellview.addSubview(menuLabel)
        
        
    }
    
    func autolayout() {
        NSLayoutConstraint.activate([
            cellview.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 3),
            cellview.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -3),
            cellview.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            cellview.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            
            menuicons.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            menuicons.leadingAnchor.constraint(equalTo: cellview.leadingAnchor, constant: 20),
            menuicons.topAnchor.constraint(equalTo: cellview.topAnchor, constant: 10),
            menuicons.bottomAnchor.constraint(equalTo: cellview.bottomAnchor, constant: -10),
            menuicons.widthAnchor.constraint(equalToConstant: 50),
         
            menuLabel.leadingAnchor.constraint(equalTo: menuicons.trailingAnchor, constant: 30),
            menuLabel.centerYAnchor.constraint(equalTo: menuicons.centerYAnchor)
            
        
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
