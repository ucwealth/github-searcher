import UIKit

// MARK: - NetworkManagerDelegate

extension SearchController: NetworkManagerDelegate {
    
    func didUpdateUser(_ networkManager: NetworkManager, user:  User) {
        DispatchQueue.main.async {[weak self] in
            self?.userList.append(contentsOf: user.items)
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
            networkManager.fetchUser(searchQuery: input, pageNum: 1)
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

