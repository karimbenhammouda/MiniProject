//
//  ArticleTableViewCell.swift
//  MiniProjet
//
//  Created by Karim BEN-HAMMOUDA on 27/03/2021.
//

import UIKit

protocol ArticleTableViewCellDelegate {
    func showDetailsArticle(_ index: Int)
}

class ArticleTableViewCell: UITableViewCell {
    var viewModel: ArticleCellViewModel?
    var delegate: ArticleTableViewCellDelegate?
    let contentedView = UIView()
    let photoImageView = UIImageView()
    let isUrgentView = UIView()
    let isUrgentLabel = UILabel()
    var isConfigured: Bool = false
    let titleLabel = UILabel()
    let priceLabel = UILabel()
    let categorieLabel = UILabel()
    let buttonDetails = UIButton()
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
    }
    
    func configureCell() {
        guard let viewModel = viewModel else { return }
        self.setupContentedView()
        self.setupPhoto()
        self.setupIsUrgentView(viewModel.getIsUrgentArticle())
        self.setupTitleLabel(viewModel.getTitleArticle())
        self.setupPriceLabel(viewModel.getPriceArticle())
        self.setupCategorieLabel(viewModel.getNameCategorie())
        self.setupButtonDetails()
    }
}

extension ArticleTableViewCell {
    func setupContentedView() {
        self.contentView.addSubview(self.contentedView)
        self.contentedView.setRadius(Constants.radius.articleContentView)
        self.contentedView.backgroundColor = Constants.contentColor.articleBackgroundColor
        self.contentedView.translatesAutoresizingMaskIntoConstraints = false
        self.contentedView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: Constants.contentSize.articleTopMargin).isActive = true
        self.contentedView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: Constants.contentSize.articleLeadingMargin).isActive = true
        self.contentedView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: Constants.contentSize.articleTrailingMargin).isActive = true
        self.contentedView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: Constants.contentSize.articleBottomMargin).isActive = true
    }
    
    func setupPhoto() {
        photoImageView.image = nil
        self.contentedView.addSubview(self.photoImageView)
        self.photoImageView.translatesAutoresizingMaskIntoConstraints = false
        self.photoImageView.topAnchor.constraint(equalTo: self.contentedView.topAnchor).isActive = true
        self.photoImageView.leadingAnchor.constraint(equalTo: self.contentedView.leadingAnchor).isActive = true
        self.photoImageView.bottomAnchor.constraint(equalTo: self.contentedView.bottomAnchor).isActive = true
        self.photoImageView.widthAnchor.constraint(equalToConstant: Constants.contentSize.photoArticleWidth).isActive = true
        guard let viewModel = viewModel else { return }
        if let urlString = viewModel.article?.images_url?.small, let url = URL(string: urlString) {
            self.photoImageView.downloadImage(url, self.photoImageView)
        }
    }
    
    func setupIsUrgentView(_ ishideen: Bool) {
        self.photoImageView.addSubview(self.isUrgentView)
        self.isUrgentView.backgroundColor = .orange
        isUrgentView.isHidden = !ishideen
        self.isUrgentView.translatesAutoresizingMaskIntoConstraints = false
        self.isUrgentView.trailingAnchor.constraint(equalTo: self.photoImageView.trailingAnchor).isActive = true
        self.isUrgentView.bottomAnchor.constraint(equalTo: self.photoImageView.bottomAnchor).isActive = true
        self.isUrgentView.heightAnchor.constraint(equalToConstant: Constants.contentSize.isUrgentHeight).isActive = true
        self.isUrgentView.widthAnchor.constraint(equalToConstant: Constants.contentSize.isUrgentWidth).isActive = true
        self.photoImageView.widthAnchor.constraint(equalToConstant: Constants.contentSize.photoArticleWidth).isActive = true
        setupIsUrgentLabel()
    }
    
    func setupIsUrgentLabel() {
        self.isUrgentView.addSubview(self.isUrgentLabel)
        self.isUrgentLabel.textAlignment = .center
        self.isUrgentLabel.text = NSLocalizedString("urgent_Title", comment: "")
        self.isUrgentLabel.font = .boldSystemFont(ofSize: 12.0)
        self.isUrgentLabel.translatesAutoresizingMaskIntoConstraints = false
        self.isUrgentLabel.trailingAnchor.constraint(equalTo: self.isUrgentView.trailingAnchor).isActive = true
        self.isUrgentLabel.bottomAnchor.constraint(equalTo: self.isUrgentView.bottomAnchor).isActive = true
        self.isUrgentLabel.topAnchor.constraint(equalTo: self.isUrgentView.topAnchor).isActive = true
        self.isUrgentLabel.leadingAnchor.constraint(equalTo: self.isUrgentView.leadingAnchor).isActive = true
    }
    
    func setupTitleLabel(_ title: String) {
        self.contentedView.addSubview(self.titleLabel)
        self.titleLabel.text = title
        self.titleLabel.font = UIFont(name:"FontAwesome",size: 15.0)
        self.titleLabel.numberOfLines = 0
        self.titleLabel.sizeToFit()
        self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.titleLabel.topAnchor.constraint(equalTo: self.contentedView.topAnchor, constant: Constants.contentSize.homeTitleArticleMargin).isActive = true
        self.titleLabel.trailingAnchor.constraint(equalTo: self.contentedView.trailingAnchor, constant: -Constants.contentSize.homeTitleArticleMargin).isActive = true
        self.titleLabel.leadingAnchor.constraint(equalTo: self.photoImageView.trailingAnchor, constant: Constants.contentSize.homeTitleArticleMargin).isActive = true
    }
    
    func setupPriceLabel(_ price: String) {
        self.contentedView.addSubview(self.priceLabel)
        self.priceLabel.text = price
        self.priceLabel.font = UIFont(name:"FontAwesome",size: 15.0)
        self.priceLabel.numberOfLines = 0
        self.priceLabel.sizeToFit()
        self.priceLabel.translatesAutoresizingMaskIntoConstraints = false
        self.priceLabel.bottomAnchor.constraint(equalTo: self.contentedView.bottomAnchor, constant: Constants.contentSize.homePriceArticleMargin).isActive = true
        self.priceLabel.trailingAnchor.constraint(equalTo: self.contentedView.trailingAnchor, constant: Constants.contentSize.homePriceArticleMargin).isActive = true
    }
    
    func setupCategorieLabel(_ nameCategorie: String) {
        self.contentedView.addSubview(self.categorieLabel)
        self.categorieLabel.text = nameCategorie
        self.categorieLabel.font = .systemFont(ofSize: 12.0)
        self.categorieLabel.textColor = Constants.contentColor.articleCategorieTextColor
        self.categorieLabel.numberOfLines = 0
        self.categorieLabel.sizeToFit()
        self.categorieLabel.translatesAutoresizingMaskIntoConstraints = false
        self.categorieLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: Constants.contentSize.homeCategorieArticleTopMargin).isActive = true
        self.categorieLabel.trailingAnchor.constraint(equalTo: self.contentedView.trailingAnchor, constant: -Constants.contentSize.homeTitleArticleMargin).isActive = true
        self.categorieLabel.leadingAnchor.constraint(equalTo: self.photoImageView.trailingAnchor, constant: Constants.contentSize.homeTitleArticleMargin).isActive = true
    }
    
    func setupButtonDetails() {
        self.contentedView.addSubview(self.buttonDetails)
        self.buttonDetails.translatesAutoresizingMaskIntoConstraints = false
        self.buttonDetails.addTarget(self, action: #selector(buttonDetailsTapped), for: .touchUpInside)
        self.buttonDetails.topAnchor.constraint(equalTo: self.contentedView.topAnchor).isActive = true
        self.buttonDetails.leadingAnchor.constraint(equalTo: self.contentedView.leadingAnchor).isActive = true
        self.buttonDetails.trailingAnchor.constraint(equalTo: self.contentedView.trailingAnchor).isActive = true
        self.buttonDetails.bottomAnchor.constraint(equalTo: self.contentedView.bottomAnchor).isActive = true
    }
}

extension ArticleTableViewCell {
    @objc func buttonDetailsTapped() {
        guard let viewModel = viewModel else { return }
        delegate?.showDetailsArticle(viewModel.index)
    }
}


