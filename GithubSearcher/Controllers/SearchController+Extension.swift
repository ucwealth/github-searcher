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
        // clear table data
        tableView.dr
        if let input = searchTextField.text {
            self.inputText = input
            networkManager.fetchUser(searchQuery: input, pageNum: 1, pagination: false)
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
