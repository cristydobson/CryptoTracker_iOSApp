//
//  CryptoCollectionCell.swift
//  CryptoTracker
//
//  Created by Cristina Dobson on 2/24/23.
//

import UIKit

class CryptoCollectionCell: UICollectionViewCell {
  
  
  // MARK: - Properties
  
  var imageView: UIImageView = {
    let newImageView = UIImageView()
    newImageView.contentMode = .scaleAspectFit
    newImageView.backgroundColor = .clear
    newImageView.translatesAutoresizingMaskIntoConstraints = false
    return newImageView
  }()
  
  var nameLabel: UILabel = {
    let newLabel = ViewHelper.createLabel(with: .white, text: "",
                                          alignment: .center,
                                          font: UIFont.systemFont(ofSize: 20,
                                                                  weight: .bold))
    
    return newLabel
  }()
  
  var priceLabel: UILabel = {
    let newLabel = ViewHelper.createLabel(with: .white, text: "",
                                          alignment: .center,
                                          font: UIFont.systemFont(ofSize: 16))
    newLabel.adjustsFontSizeToFitWidth = true
    return newLabel
  }()
  
  var changeLabel: UILabel = {
    let newLabel = ViewHelper.createLabel(with: .white, text: "",
                                          alignment: .center,
                                          font: UIFont.systemFont(ofSize: 16))
    return newLabel
  }()
  
  let labelStack: UIStackView = {
    let stackView = UIStackView()
    stackView.axis = .vertical
    stackView.alignment = .center
    stackView.spacing = 2
    stackView.translatesAutoresizingMaskIntoConstraints = false
    return stackView
  }()
  
  
  var cellViewModel: CryptoCellViewModel? {
    didSet {
      
      let cryptoName = cellViewModel?.getCryptoNameString()
      
      imageView.image = ImageHelper.getCryptoIcon(for: cryptoName)
      
      nameLabel.text = cryptoName

      priceLabel.text = cellViewModel?.getPriceString()
      
      let changePercentage = cellViewModel?.getPricePercentageChangeString()
      changeLabel.text = changePercentage
      changeLabel.textColor = ColorHelper.getPercentageLabelColor(for: changePercentage!)
      
    }
  }
  
  
  // MARK: - Init Methods
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    addViews()
    backgroundColor = UIColor(red: 0.1, green: 0.1, blue: 0.1, alpha: 0.7)
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
  }
  
  
  // MARK: - Startup Methods
  func addViews() {
    
    addSubview(imageView)
    
    let imageConstraints = [
      imageView.topAnchor.constraint(equalTo: topAnchor, constant: 24),
      imageView.widthAnchor.constraint(equalToConstant: frame.width/2.7),
      imageView.heightAnchor.constraint(equalToConstant: frame.width/2.7),
      imageView.centerXAnchor.constraint(equalTo: centerXAnchor)
    ]
    NSLayoutConstraint.activate(imageConstraints)
    
    // Stack View
    addSubview(nameLabel)
    addSubview(priceLabel)
    addSubview(changeLabel)
    addSubview(labelStack)

    labelStack.addArrangedSubview(nameLabel)
    labelStack.addArrangedSubview(priceLabel)
    labelStack.addArrangedSubview(changeLabel)
    
    let labelStackConstraints = [
      labelStack.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8),
      labelStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
      labelStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
      bottomAnchor.constraint(greaterThanOrEqualTo: labelStack.bottomAnchor, constant: 0)
    ]
    NSLayoutConstraint.activate(labelStackConstraints)

  }
  
  
}
