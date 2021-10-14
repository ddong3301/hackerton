//
//  noticeTableViewCell.swift
//  subeye
//
//  Created by 고준혁 on 2021/10/10.
//

import UIKit

class noticeTableViewCell: UITableViewCell {

    static let identifier = "noticeTableviewCellidentifeir"
    
    let noticenumber: UILabel = {
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
    
    let noticetitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.textColor = .black
        label.text = "NULL"
        
        label.font = UIFont.boldSystemFont(ofSize: 30)
        
        
        return label
    }()
    
     
    func addviews() {
        
        contentView.addSubview(noticenumber)
        contentView.addSubview(noticetitle)
        
        
    }
    
    func autolayout() {
        NSLayoutConstraint.activate([
            
            noticenumber.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            noticenumber.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            noticenumber.widthAnchor.constraint(equalToConstant: 50),
            noticenumber.heightAnchor.constraint(equalToConstant: 50),
            
            noticetitle.leadingAnchor.constraint(equalTo: noticenumber.trailingAnchor, constant: 10),
            noticetitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            noticetitle.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
          
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
