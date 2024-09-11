//
//  SignUpAdditionalInfoVC.swift
//  Speedo Transfer
//
//  Created by Ahmed Nasser on 09/09/2024.
//


import UIKit

class SignUpAdditionalInfoVC: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var innerView: UIView!
    @IBOutlet weak var countryTextField: UITextField!
    @IBOutlet weak var dateOfBirthTextField: UITextField!
    
    // MARK: - Properties
    var datePicker = UIDatePicker()
    
    private var presenter: SignUpPresenterProtocol!

    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        presenter = AuthenticationPresenter(view: self)

        setupNavigationBar()
        setupViews()
        setupDatePicker()
        setupCountryTextField()
    }

    // MARK: - Action Methods
    @IBAction func continueBtnTapped(_ sender: UIButton) {
        self.presenter.tryRegister?(country: countryTextField.text, dateOfBirth: dateOfBirthTextField.text)
    }

    @IBAction func signInBtnTapped(_ sender: UIButton) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window?.rootViewController = SignInVC()
    }

    // MARK: - Setup Methods
    private func setupNavigationBar() {
        self.navigationController?.navigationBar.tintColor = UIColor.black
        self.navigationController?.isNavigationBarHidden = false
    }

    private func setupViews() {
        UIColor.setupBackgroundColor(for: self.view, bottomColor: UIColor(hex: "FFC1C7"))
        UIColor.setupBackgroundColor(for: self.innerView, bottomColor: UIColor(hex: "FFC1C7"))
    }

    private func setupCountryTextField() {
        let arrowImageView = UIImageView(image: UIImage(systemName: "chevron.down"))
        arrowImageView.tintColor = .gray
        arrowImageView.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        countryTextField.rightView = arrowImageView
        countryTextField.rightViewMode = .always
        
        countryTextField.addTarget(self, action: #selector(showCountriesList), for: .editingDidBegin)
    }

    private func setupDatePicker() {
        datePicker.backgroundColor = .white
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.maximumDate = Calendar.current.date(byAdding: .year, value: -18, to: Date())
        
        dateOfBirthTextField.inputView = datePicker
        
        datePicker.addTarget(self, action: #selector(handleDateSelection), for: .valueChanged)
        
        let calendarIconView = UIImageView(image: UIImage(systemName: "calendar"))
        calendarIconView.tintColor = .gray
        calendarIconView.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        dateOfBirthTextField.rightView = calendarIconView
        dateOfBirthTextField.rightViewMode = .always
    }

    @objc private func showCountriesList() {
        let countriesVC = CountriesListVC()
        countriesVC.delegate = self
        present(countriesVC, animated: true, completion: nil)
    }

    @objc private func handleDateSelection() {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        dateOfBirthTextField.text = formatter.string(from: datePicker.date)
    }
}

// MARK: - CountriesListDelegate
extension SignUpAdditionalInfoVC: CounteryListDelegate {
    func didSelectCountry(name: String) {
        countryTextField.text = name
    }
}

// MARK: - SignUpAdditionalInfoVC Extension for Protocol
extension SignUpAdditionalInfoVC: AuthenticationProtocol {
    func showMessage(title: String?, message: String?) {
        self.showAlert(title: title, message: message)
    }
    
    func goToNextStep() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window?.rootViewController = SignInVC()
    }
}
