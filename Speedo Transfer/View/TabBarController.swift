//
//  TabBarController.swift
//  Speedo Transfer
//
//  Created by Ahmed Nasser on 09/09/2024.
//


import UIKit

class TabBarController: UITabBarController {

    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTabs()
        configureTabBarAppearance()
    }
    
    // MARK: - Tab Setup
    private func setupTabs() {
        let home = self.createNav(title: "Home", image: UIImage(named: "Home.png"), vc: HomeVC())
        let transfer = self.createNav(title: "Transfer", image: UIImage(named: "Transfer.png"), vc: TransferVC())
        let transactions = self.createNav(title: "Transactions", image: UIImage(named: "Transactions.png"), vc: TransactionsVC())
        let myCards = self.createNav(title: "My Cards", image: UIImage(named: "Cards.png"), vc: MyCardsVC())
        let more = self.createNav(title: "More", image: UIImage(named: "More.png"), vc: MoreVC())
        
        self.setViewControllers([home, transfer, transactions, myCards, more], animated: true)
    }
    
    // MARK: - Tab Bar Appearance Configuration
    private func configureTabBarAppearance() {
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .white
        
        self.tabBar.standardAppearance = appearance
        
        if #available(iOS 15.0, *) {
            self.tabBar.scrollEdgeAppearance = appearance
        }
        
        self.tabBar.tintColor = UIColor(hex: "871E35")
    }
    
    private func createNav(title: String, image: UIImage?, vc: UIViewController) -> UINavigationController {
        let nav = UINavigationController(rootViewController: vc)
        nav.tabBarItem.title = title
        nav.tabBarItem.image = image
        nav.viewControllers.first?.navigationItem.title = title + " Controller"
        
        return nav
    }
}
