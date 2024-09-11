//
//  FavoriteTableView.swift
//  Speedo Transfer
//
//  Created by Ahmed Nasser on 11/09/2024.
//

import UIKit

protocol FavoriteSelectionDelegate {
    func didSelectFavoriteRecipient(name: String, account: String)
}

class FavoriteTableView: UITableViewController {
    
    var favoriteRecipients = [("Ahmed Nasser", "12345678"), ("Muhammad Ali", "22334455"), ("Mustafa Khalid", "44556677")]
    var delegate: FavoriteSelectionDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "FavoriteRecipientCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "FavoriteRecipientCell")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoriteRecipients.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavoriteRecipientCell", for: indexPath) as! FavoriteRecipientCell
        let recipient = favoriteRecipients[indexPath.row]
        cell.configure(with: recipient)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedRecipient = favoriteRecipients[indexPath.row]
        delegate?.didSelectFavoriteRecipient(name: selectedRecipient.0, account: selectedRecipient.1)
        dismiss(animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

}
