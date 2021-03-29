//
//  ListsArticlesViewController.swift
//  MiniProjet
//
//  Created by Karim BEN-HAMMOUDA on 27/03/2021.
//

import UIKit

    class ListsArticlesViewController: UIViewController {
    var viewModel: ListsArticlesViewModel?
    var nameCategorie: String = NSLocalizedString("all_Categories", comment: "")
    var idCategorie: Int?
    var safeArea: UILayoutGuide!
    let logoView: UIView = UIView()
    let logoImageView: UIImageView = UIImageView()
    let contentView = UIView()
    let categorieView = UIView()
    let categorieLabel = UILabel()
    let categorieButton = UIButton()
    let tableView = UITableView()
    let picker = UIPickerView()
    var toolBar = UIToolbar()
    
    required init(_ viewModel: ListsArticlesViewModel?) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    override func loadView() {
        super.loadView()
        view.backgroundColor = Constants.contentColor.homeViewColor
        safeArea = view.layoutMarginsGuide
        setupAllCompoonents()
        }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        guard let viewModel = viewModel else { return }
        self.title = NSLocalizedString("title", comment: "")
        viewModel.fetchListArticle()
        viewModel.fetchListCategories()
        viewModel.delegate = self
        logoImageView.image = UIImage(named: "logo")
        logoImageView.contentMode = .scaleAspectFill
        registreCell()
    }
        
    func registreCell() {
        tableView.register(ArticleTableViewCell.self, forCellReuseIdentifier: Constants.cellIdendifier.articleTableViewCell)
    }
        
    @objc func buttonCategoriesTapped() {
        picker.dataSource = self
        picker.delegate = self
        picker.backgroundColor = UIColor.white
        picker.setValue(UIColor.black, forKey: "textColor")
        picker.autoresizingMask = .flexibleWidth
        picker.contentMode = .center
        setupPickerView()
        toolBar = UIToolbar.init(frame: CGRect.init(x: 0.0, y: UIScreen.main.bounds.size.height - Constants.contentSize.UIPickerDefeaultHeight, width: UIScreen.main.bounds.size.width, height: Constants.contentSize.UIToolbarDefeaultHeight))
        toolBar.barStyle = .blackTranslucent
        let done = UIBarButtonItem.init(title: NSLocalizedString("done_Title", comment: ""), style: .done, target: self, action: #selector(onDoneButtonTapped))
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolBar.setItems([flexibleSpace, done], animated: false)
        self.view.addSubview(toolBar)
    }
        
    @objc func onDoneButtonTapped() {
        toolBar.removeFromSuperview()
        picker.removeFromSuperview()
        guard let viewModel = viewModel else { return }
        categorieButton.setTitle(nameCategorie, for: .normal)
        viewModel.filteredArticle(idCategorie)
    }
}

extension ListsArticlesViewController {
    func setupAllCompoonents() {
        setupLogoView()
        setupImageView()
        setupCategorieView()
        setupCategorieButton()
        setupCategorieLabel()
        setupTableView()
    }
        
    func setupLogoView() {
        view.addSubview(logoView)
        logoView.translatesAutoresizingMaskIntoConstraints = false
        logoView.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
        logoView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        logoView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        logoView.heightAnchor.constraint(equalToConstant: Constants.contentSize.logoViewHeight).isActive = true
    }
        
    func setupImageView() {
        logoView.addSubview(logoImageView)
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.centerXAnchor.constraint(equalTo: logoView.centerXAnchor).isActive = true
        logoImageView.centerYAnchor.constraint(equalTo: logoView.centerYAnchor).isActive = true
        logoImageView.heightAnchor.constraint(equalTo: logoView.heightAnchor).isActive = true
        logoImageView.widthAnchor.constraint(equalTo: logoView.widthAnchor).isActive = true
    }
    
    func setupCategorieView() {
        view.addSubview(categorieView)
        categorieView.translatesAutoresizingMaskIntoConstraints = false
        categorieView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.contentSize.articleLeadingMargin).isActive = true
        categorieView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: Constants.contentSize.articleTrailingMargin).isActive = true
        categorieView.topAnchor.constraint(equalTo: logoView.bottomAnchor).isActive = true
        categorieView.heightAnchor.constraint(equalToConstant: Constants.contentSize.allCategoriesViewHeight).isActive = true
    }
        
    func setupCategorieButton() {
        categorieView.addSubview(categorieButton)
        categorieButton.setTitle(NSLocalizedString("all_Categories", comment: ""), for: .normal)
        categorieButton.backgroundColor = .orange
        categorieButton.addTarget(self, action: #selector(buttonCategoriesTapped), for: .touchUpInside)
        categorieButton.translatesAutoresizingMaskIntoConstraints = false
        categorieButton.trailingAnchor.constraint(equalTo: categorieView.trailingAnchor).isActive = true
        categorieButton.centerYAnchor.constraint(equalTo: categorieView.centerYAnchor).isActive = true
        categorieButton.widthAnchor.constraint(equalToConstant: Constants.contentSize.categorieButtonWidth).isActive = true
        categorieButton.heightAnchor.constraint(equalToConstant: Constants.contentSize.allCategoriesViewHeight / 2).isActive = true
    }
        
    func setupCategorieLabel() {
        categorieView.addSubview(categorieLabel)
        categorieLabel.text = NSLocalizedString("select_Categories", comment: "")
        categorieLabel.font = .systemFont(ofSize: 16.0)
        categorieLabel.numberOfLines = 0
        categorieLabel.textColor = .orange
        categorieLabel.translatesAutoresizingMaskIntoConstraints = false
        categorieLabel.leadingAnchor.constraint(equalTo: categorieView.leadingAnchor).isActive = true
        categorieLabel.centerYAnchor.constraint(equalTo: categorieView.centerYAnchor).isActive = true
        categorieLabel.trailingAnchor.constraint(equalTo: categorieButton.leadingAnchor).isActive = true
    }
        
    func setupTableView() {
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: categorieView.bottomAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
        
    func setupPickerView() {
        picker.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(picker)
        picker.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        picker.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        picker.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}

extension ListsArticlesViewController: UITableViewDelegate {
        
}

extension ListsArticlesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let viewModel = viewModel else { return 0 }
            return viewModel.getCountData()
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            return articleTableViewCell(tableView, cellForRowAt: indexPath)
    }
        
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return Constants.contentSize.articleViewHeight
    }
    }

extension ListsArticlesViewController {
    func articleTableViewCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let viewModel = viewModel else { return UITableViewCell() }
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdendifier.articleTableViewCell, for: indexPath) as! ArticleTableViewCell
        cell.selectionStyle = .none
        cell.delegate = self
        cell.viewModel = ArticleCellViewModel(viewModel.listArticle[indexPath.item], indexPath.item, viewModel.getCategoriesArticle(indexPath.item))
        cell.configureCell()
        return cell
    }
}

extension ListsArticlesViewController: ListsArticlesViewModelDelegate {
    func getDataCompleted() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
        
    func dataFiltered() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

extension ListsArticlesViewController: ArticleTableViewCellDelegate {
    func showDetailsArticle(_ index: Int) {
        guard let viewModel = viewModel else { return }
        let detailArticleViewController = DetailArticleViewController()
        let detailArticleViewModel = DetailArticleViewModel(viewModel.listArticle[index], viewModel.getCategoriesArticle(index))
        detailArticleViewController.viewModel = detailArticleViewModel
        self.navigationController?.pushViewController(detailArticleViewController, animated: true)
            
    }
}

extension ListsArticlesViewController: UIPickerViewDelegate {
        
}

extension ListsArticlesViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
        
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        guard let viewModel = viewModel else { return 0 }
        return viewModel.getCountCategories() 
    }
        
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        guard let viewModel = viewModel else { return nil }
        if row == 0 {
            return NSLocalizedString("all_Categories", comment: "")
        } else {
            return viewModel.listCategorie[row - 1].name
        }
    }
            
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        guard let viewModel = viewModel else { return }
        if row == 0 {
            nameCategorie = NSLocalizedString("all_Categories", comment: "")
            idCategorie = nil
        } else {
            nameCategorie = viewModel.listCategorie[row - 1].name ?? ""
            idCategorie = viewModel.listCategorie[row - 1].id
        }
    }
}

