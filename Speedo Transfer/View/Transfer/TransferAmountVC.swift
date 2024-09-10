//
//  TransferVC.swift
//  Speedo Transfer
//
//  Created by Ahmed Nasser on 09/09/2024.
//

import UIKit

class TransferAmountVC: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var innerView: UIView!
    @IBOutlet weak var amountTextField: UITextField!
    @IBOutlet weak var recipientNameTextField: UITextField!
    @IBOutlet weak var recipientAccountTextField: UITextField!
    
    // MARK: - Properties
    let favoriteRecipients = [
        ("John Doe", "1234567890"),
        ("Jane Smith", "0987654321"),
        ("Mike Johnson", "1122334455")
    ]
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setUpBackground(innerView: innerView)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    // MARK: - Actions
    @IBAction func backBtnTapped(_ sender: UIButton) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window?.rootViewController = UINavigationController(rootViewController: TabBarController())
    }
    
    @IBAction func continueBtnTapped(_ sender: UIButton) {
        self.navigationController?.pushViewController(TransferConfirmationVC(), animated: true)
    }
    
    @IBAction func favoriteBtnTapped(_ sender: UIButton) {
        let favoritesVC = FavoritesListVC()
        favoritesVC.favoriteRecipients = favoriteRecipients
        favoritesVC.delegate = self
        
        if let sheet = favoritesVC.sheetPresentationController {
            sheet.detents = [.medium(), .large()]
        }
        present(favoritesVC, animated: true, completion: nil)
    }
}

// MARK: - FavoritesListDelegate
extension TransferAmountVC: FavoritesListDelegate {
    func didSelectFavoriteRecipient(name: String, account: String) {
        recipientNameTextField.text = name
        recipientAccountTextField.text = account
    }
}

// MARK: - FavoriteList VC
class FavoritesListVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var favoriteRecipients: [(String, String)] = []
    var delegate: FavoritesListDelegate?
    
    private var tableView: UITableView!
    private var grabberView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupGrabberView()
        setupTableView()
    }
    
    private func setupGrabberView() {
        grabberView = UIView(frame: CGRect(x: (self.view.bounds.width - 60) / 2, y: 8, width: 60, height: 6))
        grabberView.backgroundColor = UIColor.lightGray
        grabberView.layer.cornerRadius = 3
        view.addSubview(grabberView)
    }

    private func setupTableView() {
        tableView = UITableView(frame: CGRect(x: 0, y: 20, width: self.view.bounds.width, height: self.view.bounds.height - 20))
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "favoriteCell")
        view.addSubview(tableView)
    }

    // MARK: - TableView DataSource and Delegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoriteRecipients.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "favoriteCell", for: indexPath)
        let recipient = favoriteRecipients[indexPath.row]
        
        for subview in cell.contentView.subviews {
            subview.removeFromSuperview()
        }
        
        let bankImageView = UIImageView(image: UIImage(named: "Bank"))
        bankImageView.frame = CGRect(x: 10, y: 5, width: 30, height: 30)
        bankImageView.contentMode = .scaleAspectFit
        cell.contentView.addSubview(bankImageView)
        
        let label = UILabel()
        label.text = "\(recipient.0) (\(recipient.1))"
        label.frame = CGRect(x: 50, y: 5, width: tableView.bounds.width - 60, height: 40)
        label.font = UIFont.systemFont(ofSize: 16)
        cell.contentView.addSubview(label)
        
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedRecipient = favoriteRecipients[indexPath.row]
        delegate?.didSelectFavoriteRecipient(name: selectedRecipient.0, account: selectedRecipient.1)
        dismiss(animated: true, completion: nil)
    }
}


// MARK: - FavoritesListDelegate Protocol
protocol FavoritesListDelegate {
    func didSelectFavoriteRecipient(name: String, account: String)
}
