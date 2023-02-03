import Foundation
protocol NetworkManagerDelegate {
    func didUpdateUser(_ networkManager: NetworkManager, user: User)
    func didFailWithError(error: Error)
}
struct NetworkManager {
    var delegate: NetworkManagerDelegate?
    func fetchUser(searchQuery: String, pageNum: Int = 1) {
        let urlString = "\(Constants.baseUrl)\(searchQuery)\(Constants.midUrl)\(pageNum)"
        performRequest(with: urlString)
    }
    
    func performRequest(with urlString: String) {
        guard let url = URL(string: urlString) else {
            return
        }
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            if let data = data {
                do {
                    let result = try JSONDecoder().decode(User.self, from: data)
                    delegate?.didUpdateUser(self, user: result)
                } catch {
                    print(error.localizedDescription)
                    delegate?.didFailWithError(error: error)
                }
            }
        }
        task.resume()
    }
 
}
