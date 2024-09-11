//
//  CountryTableView.swift
//  Speedo Transfer
//
//  Created by Ahmed Nasser on 11/09/2024.
//

import UIKit

protocol CountrySelectionDelegate: AnyObject {
    func didSelectCountry(_ country: String)
}

class CountryTableView: UITableViewController {
    
    var countries = [("Egypt", "Egypt"), ("Palestine", "Palestine"), ("Syrian", "Syrian")]
    var delegate: CountrySelectionDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "CountryCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "CountryCell")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountryCell", for: indexPath) as! CountryCell
        let country = countries[indexPath.row]
        
        cell.flagNameLabel.text = country.0
        cell.flagImageView.image = UIImage(named: country.1)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCountry = countries[indexPath.row].0
        delegate?.didSelectCountry(selectedCountry)
        self.dismiss(animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}
