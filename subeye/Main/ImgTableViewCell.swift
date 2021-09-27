//
//  ImgTableViewCell.swift
//  subeye
//
//  Created by 고준혁 on 2021/09/27.
//

import UIKit

class ImgTableViewCell: UITableViewCell {

    
    static let identifer = "cellidentifier"
    
    let images: UIImageView = {
        let image = UIImageView()
        
        image.translatesAutoresizingMaskIntoConstraints = false
        
        image.backgroundColor = .systemGray4
        
        return image
    }()
    
    
    let timelabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "09-24 19:53"
        label.textColor = .black
        
        
        return label
    }()
    
    
    
    
    func addviews() {
        
        contentView.addSubview(images)
        contentView.addSubview(timelabel)
        
        
    }
    
    func autolayout() {
        NSLayoutConstraint.activate([
 
            images.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            images.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30),
            images.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -30),
            images.widthAnchor.constraint(equalToConstant: 100),
            
            
            timelabel.leadingAnchor.constraint(equalTo: images.trailingAnchor, constant: 30),
            timelabel.centerYAnchor.constraint(equalTo: images.centerYAnchor),
        
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
