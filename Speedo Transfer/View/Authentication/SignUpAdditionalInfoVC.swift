import UIKit

class SignUpAdditionalInfoVC: UIViewController {

    // MARK: - Outlets
    
    @IBOutlet var outerView: UIView!
    @IBOutlet weak var innerView: UIView!
    @IBOutlet weak var countryTextField: UITextField!
    @IBOutlet weak var dateOfBirthTextField: UITextField!
    
    // MARK: - Properties
    
    let countries = ["Egypt", "Palestine", "Syrian"]
    let countryFlags = ["eg", "pa", "sy"]
    
    var pickerView = UIPickerView()
    var toolbar = UIToolbar()
    var datePicker = UIDatePicker()
    
    private var presenter: SignUpPresenterProtocol!
    
    // MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter = AuthenticationPresenter(view: self)
        
        setupNavigationBar()
        setupViews()
        setupPickerView()
        setupToolbar()
        setupDatePicker()
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
        UIColor.setupBackgroundColor(for: self.outerView)
        UIColor.setupBackgroundColor(for: self.innerView)
    }
    
    private func setupPickerView() {
        pickerView.delegate = self
        pickerView.dataSource = self
        
        setupCountryTextField()
    }
    
    private func setupCountryTextField() {
        let arrowImageView = UIImageView(image: UIImage(systemName: "chevron.down"))
        arrowImageView.tintColor = .gray
        arrowImageView.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        countryTextField.rightView = arrowImageView
        countryTextField.rightViewMode = .always
        
        countryTextField.addTarget(self, action: #selector(showPickerView), for: .editingDidBegin)
    }
    
    private func setupToolbar() {
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissPickerView))
        toolbar.setItems([doneButton], animated: false)
    }
    
    private func setupDatePicker() {
        datePicker.backgroundColor = .white
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.maximumDate = Calendar.current.date(byAdding: .year, value: -18, to: Date())

        dateOfBirthTextField.inputView = datePicker
        dateOfBirthTextField.inputAccessoryView = toolbar
        
        datePicker.addTarget(self, action: #selector(handleDateSelection), for: .valueChanged)
        
        let calendarIconView = UIImageView(image: UIImage(systemName: "calendar"))
        calendarIconView.tintColor = .gray
        calendarIconView.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        dateOfBirthTextField.rightView = calendarIconView
        dateOfBirthTextField.rightViewMode = .always
    }
    
    // MARK: - PickerView Methods
    
    @objc private func showPickerView() {
        pickerView.backgroundColor = .white
        countryTextField.inputView = pickerView
        countryTextField.inputAccessoryView = toolbar
        countryTextField.becomeFirstResponder()
    }
    
    @objc private func dismissPickerView() {
        countryTextField.resignFirstResponder()
        dateOfBirthTextField.resignFirstResponder()
    }
    
    @objc private func handleDateSelection() {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        dateOfBirthTextField.text = formatter.string(from: datePicker.date)
    }
}

// MARK: - UIPickerView DataSource and Delegate

extension SignUpAdditionalInfoVC: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return countries.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return countries[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: pickerView.bounds.width, height: 40))
        
        let flagImageView = UIImageView(image: UIImage(named: countryFlags[row]))
        flagImageView.frame = CGRect(x: 10, y: 5, width: 30, height: 30)
        
        let label = UILabel(frame: CGRect(x: 50, y: 5, width: pickerView.bounds.width - 60, height: 30))
        label.text = countries[row]
        
        view.addSubview(flagImageView)
        view.addSubview(label)
        
        return view
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        countryTextField.text = countries[row]
    }
}

extension SignUpAdditionalInfoVC: AuthenticationProtocol {
    func showMessage(title: String?, message: String?) {
        self.showAlert(title: title, message: message)
    }
    
    func goToNextStep() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window?.rootViewController = SignInVC()
    }
}
