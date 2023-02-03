import UIKit
import SDWebImage

// MARK: - NetworkManagerDelegate
extension SearchController: NetworkManagerDelegate {
    
    func didUpdateUser(_ networkManager: NetworkManager, user:  User) {
        DispatchQueue.main.async {[weak self] in
            self?.userList.append(
                contentsOf: user.items
                    .sorted { $0.login.lowercased() < $1.login.lowercased() })
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
        userList = []
        // clear cached images from previous search result
        SDImageCache.shared.clearMemory()
        SDImageCache.shared.clearDisk()
        tableView.reloadData()
        searchTextField.endEditing(true)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let input = searchTextField.text {
            self.inputText = input
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
