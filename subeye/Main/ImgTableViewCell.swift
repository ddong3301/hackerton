//
//  ImgTableViewCell.swift
//  subeye
//
//  Created by 고준혁 on 2021/09/27.
//

import UIKit

class ImgTableViewCell: UITableViewCell {
    
    var finishReload:Bool = false

    
    static let identifer = "cellidentifier"
    
    let images: UIImageView = {
        let image = UIImageView()
        
        image.translatesAutoresizingMaskIntoConstraints = false
        
        image.backgroundColor = .systemGray4
        
        return image
    }()
    
    let imgTime: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "시간 : "
        label.textColor = .black
        
        
        
        return label
    }()
    
    var timelabel: UILabel = {
        var label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = ""
        label.textColor = .black
        
        
        return label
    }()
    
    
    
    
    func addviews() {
        
        contentView.addSubview(images)
        contentView.addSubview(imgTime)
        contentView.addSubview(timelabel)
        
        
    }
    
    func autolayout() {
        NSLayoutConstraint.activate([
 
            images.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            images.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            images.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            images.widthAnchor.constraint(equalToConstant: 100),
            
            imgTime.leadingAnchor.constraint(equalTo: images.trailingAnchor, constant: 10),
            imgTime.topAnchor.constraint(equalTo: timelabel.topAnchor, constant: 0),
            imgTime.widthAnchor.constraint(equalToConstant: 40),
            
            
            
            timelabel.leadingAnchor.constraint(equalTo: imgTime.trailingAnchor, constant: 5),
            timelabel.centerYAnchor.constraint(equalTo: images.centerYAnchor),
            timelabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10)
        
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
