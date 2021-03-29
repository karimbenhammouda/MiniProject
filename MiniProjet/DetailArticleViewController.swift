//
//  DetailArticleViewController.swift
//  MiniProjet
//
//  Created by Karim BEN-HAMMOUDA on 27/03/2021.
//

import UIKit

class DetailArticleViewController: UIViewController {
    var viewModel: DetailArticleViewModel?
    var safeArea: UILayoutGuide!
    let photoImageView: UIImageView = UIImageView()
    let scrollView: UIScrollView = UIScrollView()
    let contentedView: UIView = UIView()
    let isUrgentView: UIView = UIView()
    let isUrgentLabel: UILabel = UILabel()
    let titleLabel: UILabel = UILabel()
    let priceLabel: UILabel = UILabel()
    let categorieLabel: UILabel = UILabel()
    let dateLabel: UILabel = UILabel()
    let detailView: UIView = UIView()
    let descriptionLabel: UILabel = UILabel()
    
    required init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        view.backgroundColor = Constants.contentColor.detailsviewColor
        safeArea = view.layoutMarginsGuide
        setupAllCompoonents()
      }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

extension DetailArticleViewController {
    func setupAllCompoonents() {
        guard let viewModel = viewModel else { return }
        let heightDetailsView = viewModel.getHeight(viewModel.getDescription(), .boldSystemFont(ofSize: 18.0), width: viewModel.getDescriptionAvailableWidth()) + (2 * Constants.contentSize.detailArticleTitleTopMargin)
        let heightTitleLabel = viewModel.getHeight(viewModel.getTitleArticle(), .boldSystemFont(ofSize: 18.0), width: viewModel.getAvailableWidth())
        let heightScrollView: CGFloat = heightDetailsView + heightTitleLabel + Constants.contentSize.articleScrollView
        setupScrollView()
        setupContentView(heightScrollView)
        setupPhotoArticleView()
        setupIsUrgentView(viewModel.getIsUrgentArticle())
        setupTitleLabel(viewModel.getTitleArticle())
        setupPriceLabel(viewModel.getPriceArticle())
        setupCategorieLabel(viewModel.getNameCategorie())
        setupDateLabel(viewModel.getCreationDate())
        setupDetailsView(heightDetailsView)
        setupDescriptionLabel(viewModel.getDescription())
    }
    
    func setupScrollView() {
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
        scrollView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        scrollView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
    }
    
    func setupContentView(_ height: CGFloat) {
        contentedView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(contentedView)
        contentedView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        contentedView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        contentedView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        contentedView.heightAnchor.constraint(equalToConstant: height).isActive = true
        contentedView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
    }
    
    func setupPhotoArticleView() {
        view.addSubview(photoImageView)
        photoImageView.translatesAutoresizingMaskIntoConstraints = false
        photoImageView.topAnchor.constraint(equalTo: contentedView.topAnchor).isActive = true
        photoImageView.leadingAnchor.constraint(equalTo: contentedView.leadingAnchor).isActive = true
        photoImageView.trailingAnchor.constraint(equalTo: contentedView.trailingAnchor).isActive = true
        photoImageView.heightAnchor.constraint(equalToConstant: Constants.contentSize.detailsPhotoImageViewHeight).isActive = true
        guard let viewModel = viewModel else { return }
        if let urlString = viewModel.article?.images_url?.thumb, let url = URL(string: urlString) {
            self.photoImageView.downloadImage(url, self.photoImageView)
            self.photoImageView.contentMode = .scaleToFill
        }
    }
    
    func setupIsUrgentView(_ ishideen: Bool) {
        photoImageView.addSubview(self.isUrgentView)
        self.isUrgentView.backgroundColor = .orange
        isUrgentView.isHidden = !ishideen
        isUrgentView.translatesAutoresizingMaskIntoConstraints = false
        isUrgentView.trailingAnchor.constraint(equalTo: photoImageView.trailingAnchor).isActive = true
        isUrgentView.bottomAnchor.constraint(equalTo: photoImageView.bottomAnchor).isActive = true
        isUrgentView.heightAnchor.constraint(equalToConstant: Constants.contentSize.isUrgentHeight).isActive = true
        isUrgentView.widthAnchor.constraint(equalToConstant: Constants.contentSize.isUrgentWidth).isActive = true
        photoImageView.widthAnchor.constraint(equalToConstant: Constants.contentSize.photoArticleWidth).isActive = true
        setupIsUrgentLabel()
    }
    
    func setupIsUrgentLabel() {
        isUrgentView.addSubview(self.isUrgentLabel)
        isUrgentLabel.textAlignment = .center
        isUrgentLabel.attributedText = viewModel?.getText(NSLocalizedString("urgent_Title", comment: ""), .boldSystemFont(ofSize: 12.0))
        isUrgentLabel.translatesAutoresizingMaskIntoConstraints = false
        isUrgentLabel.trailingAnchor.constraint(equalTo: isUrgentView.trailingAnchor).isActive = true
        isUrgentLabel.bottomAnchor.constraint(equalTo: isUrgentView.bottomAnchor).isActive = true
        isUrgentLabel.topAnchor.constraint(equalTo: isUrgentView.topAnchor).isActive = true
        isUrgentLabel.leadingAnchor.constraint(equalTo: isUrgentView.leadingAnchor).isActive = true
    }
    
    func setupTitleLabel(_ title: String) {
        contentedView.addSubview(self.titleLabel)
        titleLabel.attributedText = viewModel?.getText(title, .boldSystemFont(ofSize: 18.0))
        titleLabel.numberOfLines = 0
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.trailingAnchor.constraint(equalTo: contentedView.trailingAnchor, constant: Constants.contentSize.detailArticleTrailingMargin).isActive = true
        titleLabel.topAnchor.constraint(equalTo: photoImageView.bottomAnchor, constant: Constants.contentSize.detailArticleTitleTopMargin).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: contentedView.leadingAnchor, constant: Constants.contentSize.detailArticleLeadingMargin).isActive = true
    }
    
    func setupPriceLabel(_ price: String) {
        contentedView.addSubview(self.priceLabel)
        priceLabel.attributedText = viewModel?.getText(price, .boldSystemFont(ofSize: 18.0))
        priceLabel.numberOfLines = 0
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.trailingAnchor.constraint(equalTo: contentedView.trailingAnchor, constant: Constants.contentSize.detailArticleTrailingMargin).isActive = true
        priceLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor).isActive = true
        priceLabel.leadingAnchor.constraint(equalTo: contentedView.leadingAnchor, constant: Constants.contentSize.detailArticleLeadingMargin).isActive = true
    }
    
    func setupCategorieLabel(_ categorie: String) {
        contentedView.addSubview(self.categorieLabel)
        categorieLabel.attributedText = viewModel?.getText(categorie, .boldSystemFont(ofSize: 14.0))
        categorieLabel.numberOfLines = 0
        categorieLabel.translatesAutoresizingMaskIntoConstraints = false
        categorieLabel.trailingAnchor.constraint(equalTo: contentedView.trailingAnchor, constant: Constants.contentSize.detailArticleTrailingMargin).isActive = true
        categorieLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor).isActive = true
        categorieLabel.leadingAnchor.constraint(equalTo: contentedView.leadingAnchor, constant: Constants.contentSize.detailArticleLeadingMargin).isActive = true
    }
    
    func setupDateLabel(_ date: String) {
        contentedView.addSubview(dateLabel)
        dateLabel.text = date
        dateLabel.attributedText = viewModel?.getText(date, .boldSystemFont(ofSize: 14.0))
        dateLabel.numberOfLines = 0
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.trailingAnchor.constraint(equalTo: contentedView.trailingAnchor, constant: Constants.contentSize.detailArticleTrailingMargin).isActive = true
        dateLabel.topAnchor.constraint(equalTo: categorieLabel.bottomAnchor).isActive = true
        dateLabel.leadingAnchor.constraint(equalTo: contentedView.leadingAnchor, constant: Constants.contentSize.detailArticleLeadingMargin).isActive = true
    }
    
    func setupDetailsView(_ height: CGFloat) {
        contentedView.addSubview(detailView)
        detailView.setRadius(Constants.radius.articleContentView)
        detailView.backgroundColor = Constants.contentColor.datailArticleBackgroundColor
        detailView.translatesAutoresizingMaskIntoConstraints = false
        detailView.trailingAnchor.constraint(equalTo: contentedView.trailingAnchor, constant: Constants.contentSize.detailArticleTrailingMargin).isActive = true
        detailView.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: Constants.contentSize.detailArticleTitleTopMargin).isActive = true
        detailView.leadingAnchor.constraint(equalTo: contentedView.leadingAnchor, constant: Constants.contentSize.detailArticleLeadingMargin).isActive = true
        detailView.heightAnchor.constraint(equalToConstant: height).isActive = true
    }
    
    func setupDescriptionLabel(_ description: String) {
        detailView.addSubview(descriptionLabel)
        descriptionLabel.attributedText = viewModel?.getText(description, .boldSystemFont(ofSize: 18.0))
        descriptionLabel.numberOfLines = 0
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.trailingAnchor.constraint(equalTo: detailView.trailingAnchor, constant: -Constants.contentSize.descriptionLabelDefeaulLeadingMargin).isActive = true
        descriptionLabel.topAnchor.constraint(equalTo: detailView.topAnchor, constant: Constants.contentSize.descriptionLabelDefeaulTopMargin).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: detailView.leadingAnchor, constant: Constants.contentSize.descriptionLabelDefeaulLeadingMargin).isActive = true
        descriptionLabel.bottomAnchor.constraint(equalTo: detailView.bottomAnchor, constant: -Constants.contentSize.descriptionLabelDefeaulTopMargin).isActive = true
    }
}

