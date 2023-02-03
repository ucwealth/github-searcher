import UIKit

class SearchController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchTextField: UITextField!

    var resultViewModel = ResultViewModel()
    var networkManager = NetworkManager()
    var user: User?
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Search github users"
        tableView.delegate = self
        tableView.dataSource = self
        networkManager.delegate = self
        searchTextField.delegate = self
        tableView.register(
                    ResultCell.nib,
                    forCellReuseIdentifier: ResultCell.identifier)
        tableView.isHidden = true
    }

}

// pagination
// style table row properly
// sort alphabetically by login

extension SearchController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return user?.totalCount ?? 10
        let resultArray = user?.items
        return resultArray?.count ?? 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ResultCell.identifier, for: indexPath) as? ResultCell else {
            return UITableViewCell()
        }
        let resultArray = user?.items
        if let result = resultArray?[indexPath.row] {
            cell.configure(result)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let detailsVC = DetailViewController()
        var resultArray = user?.items
        detailsVC.result = resultArray?[indexPath.row]
        navigationController?.pushViewController(detailsVC, animated: true)

//        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailsController {
//            vc.result = resultViewModel.dummyResults[indexPath.row]
//            navigationController?.pushViewController(vc, animated: true)
//        }
        
    }
    
}
// MARK: - NetworkManagerDelegate

extension SearchController: NetworkManagerDelegate {
    
    func didUpdateUser(_ networkManager: NetworkManager, user:  User) {
        DispatchQueue.main.async {[weak self] in
            self?.user = user
            self?.tableView.reloadData()
            self?.tableView.isHidden = false
        }
    }
    
    func didFailWithError(error: Error) {
        print("Error: ",error)
    }
    
//    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel) {
//        DispatchQueue.main.async {
//            self.temperatureLabel.text = weather.tempString
//            self.conditionImageView.image = UIImage(systemName: weather.conditionName)
//            self.cityLabel.text = weather.cityName
//        }
//    }
    
}
// MARK: - TextFieldDelegate

extension SearchController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(true)
        return true
    }

    @IBAction func searchButtonPressed(_ sender: UIButton) {
        searchTextField.endEditing(true)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let input = searchTextField.text {
            networkManager.fetchUser(searchQuery: input)
        }
        textField.text = ""
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        } else {
            textField.placeholder = "Type Something"
            return false
        }
    }
}
