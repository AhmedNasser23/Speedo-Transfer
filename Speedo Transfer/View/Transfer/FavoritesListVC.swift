//
//  FavoritesListVC.swift
//  Speedo Transfer
//
//  Created by Ahmed Nasser on 11/09/2024.
//

import UIKit

protocol FavoritesListDelegate {
    func didSelectFavoriteRecipient(name: String, account: String)
}

class FavoritesListVC: UIViewController {

    // MARK: - Porperties
    var favoriteRecipients: [(String, String)] = [
        ("John Doe", "123456789"),
        ("Jane Smith", "987654321"),
        ("Alice Johnson", "123123123")
    ]
    
    var delegate: FavoritesListDelegate?

    private var tableView: UITableView!
    private var titleLabel: UILabel!
    private var grabber: UIView!
    private var containerStack: UIStackView!

    // MARK: - Lifecycle Methodds
    override func viewDidLoad() {
        super.viewDidLoad()

        setupGrabber()
        setupTitleLabel()
        setupTableView()
        setupContainerStack()
    }

    // MARK: - Private Methods
    private func setupGrabber() {
        grabber = UIView()
        grabber.backgroundColor = UIColor.lightGray.withAlphaComponent(0.5)
        grabber.layer.cornerRadius = 2.5
        grabber.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            grabber.heightAnchor.constraint(equalToConstant: 5),
            grabber.widthAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func setupTitleLabel() {
        titleLabel = UILabel()
        titleLabel.text = "Favourite List"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 18)
        titleLabel.textColor = UIColor(red: 122/255, green: 0, blue: 0, alpha: 1)
        titleLabel.textAlignment = .center
        titleLabel.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(titleLabel)

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

    private func setupTableView() {
        tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        
        let nib = UINib(nibName: "FavoriteRecipientCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "FavoriteRecipientCell")
        
        tableView.separatorStyle = .none
        tableView.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
    }

    private func setupContainerStack() {
        containerStack = UIStackView(arrangedSubviews: [grabber, titleLabel, tableView])
        containerStack.backgroundColor = .white
        containerStack.axis = .vertical
        containerStack.alignment = .fill
        containerStack.spacing = 10
        containerStack.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(containerStack)
        
        NSLayoutConstraint.activate([
            containerStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            containerStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            containerStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            containerStack.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

        NSLayoutConstraint.activate([
            grabber.heightAnchor.constraint(equalToConstant: 5),
            grabber.widthAnchor.constraint(equalToConstant: 50),
            grabber.centerXAnchor.constraint(equalTo: containerStack.centerXAnchor)
        ])
    }
}
// MARK: - TableView DataSource and Delegate
extension FavoritesListVC: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoriteRecipients.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavoriteRecipientCell", for: indexPath) as! FavoriteRecipientCell
        let recipient = favoriteRecipients[indexPath.row]
        cell.configure(with: recipient)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedRecipient = favoriteRecipients[indexPath.row]
        delegate?.didSelectFavoriteRecipient(name: selectedRecipient.0, account: selectedRecipient.1)
        dismiss(animated: true, completion: nil)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let padding: CGFloat = 10
        let backgroundView = UIView(frame: CGRect(x: 0, y: padding / 2, width: tableView.bounds.width, height: cell.bounds.height - padding))
        backgroundView.layer.cornerRadius = 10
        backgroundView.layer.masksToBounds = true
        backgroundView.backgroundColor = .white
        cell.backgroundView = backgroundView

        cell.contentView.backgroundColor = .clear
        cell.layer.masksToBounds = false
        cell.contentView.layer.masksToBounds = false
    }
}
