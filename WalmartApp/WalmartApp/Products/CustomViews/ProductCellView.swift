//
//  ProductCellView.swift
//  WalmartApp
//
//  Created by Luis R on 08/09/23.
//

import Foundation
import UIKit

class ProductCellView : UITableViewCell {
    
    var data : ProductElement?
    
     let productImageView: UIImageView = {
         let imageView = UIImageView()
         imageView.translatesAutoresizingMaskIntoConstraints = false
         imageView.contentMode = .scaleAspectFit
         return imageView
     }()
     
     let titleLabel: UILabel = {
         let label = UILabel()
         label.translatesAutoresizingMaskIntoConstraints = false
         label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
         label.numberOfLines = 2
         return label
     }()
     
     let priceLabel: UILabel = {
         let label = UILabel()
         label.translatesAutoresizingMaskIntoConstraints = false
         label.font = UIFont.systemFont(ofSize: 14)
         label.textColor = .red
         return label
     }()
    
    
    static let identifier = String(describing: ProductCellView.self)    
    
    // MARK: - init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
          super.init(style: style, reuseIdentifier: reuseIdentifier)
          
          // Add subviews to the cell's content view
          contentView.addSubview(productImageView)
          contentView.addSubview(titleLabel)
          contentView.addSubview(priceLabel)
          
          // Define layout constraints
          NSLayoutConstraint.activate([
              productImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
              productImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
              productImageView.widthAnchor.constraint(equalToConstant: 80),
              productImageView.heightAnchor.constraint(equalToConstant: 80),
              
              titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
              titleLabel.leadingAnchor.constraint(equalTo: productImageView.trailingAnchor, constant: 16),
              titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
              
              priceLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
              priceLabel.leadingAnchor.constraint(equalTo: productImageView.trailingAnchor, constant: 16),
              priceLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
              priceLabel.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -16)
          ])
      }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupData(product: ProductElement) {
        self.data = product
        self.titleLabel.text = data?.title
        self.priceLabel.text = "99"
        if let url = URL(string: data?.image ?? "") {
            downloadImage(from: url) { image in
                
                // Use the downloaded image here
                if  let image = image as? UIImage {
                    // Update your UI or perform any necessary actions with the image
                    DispatchQueue.main.async {
                        self.productImageView.image = image
                    }
                }
            }
        }
    }
}
