//
//  CustomCell.swift
//  CollectionViewProject
//
//  Created by Vijay Lal on 02/08/24.
//

import Foundation
import UIKit
class CustomCell: UICollectionViewCell {
    lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.layer.cornerRadius = 8
        image.layer.masksToBounds = true
        return image
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        initView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension CustomCell {
    func initView() {
        self.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        [imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
         imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
         imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
         imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0)
        ].forEach({ $0.isActive = true })
    }
}
