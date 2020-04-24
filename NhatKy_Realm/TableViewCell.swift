//
//  TableViewCell.swift
//  NhatKy_Realm
//
//  Created by Thien Tung on 4/24/20.
//  Copyright © 2020 Thien Tung. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    } ()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        return label
    } ()
    
    let hourLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        return label
    } ()
    
    let minLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        return label
    } ()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        
        self.addSubview(containerView)
        containerView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        containerView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
        containerView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0).isActive = true
        containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        
        containerView.addSubview(nameLabel)
        nameLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 0).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 28).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: containerView.centerXAnchor, constant: -16).isActive = true
        nameLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 0).isActive = true
        
        containerView.addSubview(hourLabel)
        hourLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 0).isActive = true
        hourLabel.leftAnchor.constraint(equalTo: containerView.centerXAnchor, constant: 18).isActive = true
        hourLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 0).isActive = true
        
        containerView.addSubview(minLabel)
        minLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 0).isActive = true
        minLabel.leftAnchor.constraint(equalTo: hourLabel.rightAnchor, constant: 18).isActive = true
        minLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 0).isActive = true
        
    }
}
