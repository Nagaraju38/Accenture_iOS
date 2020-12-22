//
//  TableViewCell.swift
//  Accenture_iOS
//
//  Created by XTGlobal on 21/12/20.
//  Copyright © 2020 Goutham. All rights reserved.
//

import UIKit

class FactTableCell: UITableViewCell {
    
    var titleTxt:UILabel = {
       let titlelab = UILabel()
        titlelab.textColor = UIColor.black
        titlelab.translatesAutoresizingMaskIntoConstraints = false
        titlelab.font = UIFont.boldSystemFont(ofSize: 19.0)
        return titlelab
    }()
    
    var descriptionTxt:UILabel = {
       let titlelab = UILabel()
        titlelab.textColor = UIColor.black
        titlelab.numberOfLines = 0
        titlelab.textAlignment = .left
        titlelab.font = UIFont.systemFont(ofSize: 17.0)
        titlelab.translatesAutoresizingMaskIntoConstraints = false
        return titlelab
    }()
    
    var img:UIImageView = {
       let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFit
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        addSubViewsAndlayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubViewsAndlayout() {
        
        
        contentView.addSubview(img) //will crash if not added
        
        img.widthAnchor.constraint(equalToConstant:150.0).isActive = true
       
        img.leadingAnchor.constraint(equalTo:self.contentView.leadingAnchor,constant: 10.0).isActive = true
        img.topAnchor.constraint(equalTo:self.contentView.topAnchor,constant: 10.0).isActive = true
        
        contentView.addSubview(titleTxt) //will crash if not added
        
        titleTxt.topAnchor.constraint(equalTo:self.contentView.topAnchor,constant: 10.0).isActive = true
        titleTxt.leadingAnchor.constraint(equalTo:self.img.trailingAnchor,constant: 10.0).isActive = true
        titleTxt.trailingAnchor.constraint(equalTo:self.contentView.trailingAnchor,constant: 10.0).isActive = true
        
        titleTxt.heightAnchor.constraint(equalToConstant: 26.0).isActive = true
        
        contentView.addSubview(descriptionTxt) //will crash if not added
        
        descriptionTxt.topAnchor.constraint(equalTo:self.titleTxt.bottomAnchor, constant: 0.0).isActive = true
        descriptionTxt.leadingAnchor.constraint(equalTo:self.titleTxt.leadingAnchor).isActive = true
        descriptionTxt.trailingAnchor.constraint(equalTo:self.titleTxt.trailingAnchor,constant: 16.0).isActive = true
        descriptionTxt.bottomAnchor.constraint(equalTo:self.contentView.bottomAnchor, constant: 5.0).isActive = true
        
        img.bottomAnchor.constraint(equalTo: self.descriptionTxt.bottomAnchor).isActive = true
        
    }
}
