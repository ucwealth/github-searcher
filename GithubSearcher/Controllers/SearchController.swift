import UIKit

class SearchController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchTextField: UITextField!
    
    var resultViewModel = ResultViewModel()
    var networkManager = NetworkManager()
    var userList = [Item]()
    
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
// add sdwebimage
// 
extension SearchController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        userList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ResultCell.identifier, for: indexPath) as? ResultCell else {
            return UITableViewCell()
        }
        cell.configure(userList[indexPath.row])
        return cell
    }
}

extension SearchController: UITableViewDelegate, UIScrollViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let detailsVC = DetailViewController()
        detailsVC.result = userList[indexPath.row]
        navigationController?.pushViewController(detailsVC, animated: true)

//        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailsController {
//            vc.result = resultViewModel.dummyResults[indexPath.row]
//            navigationController?.pushViewController(vc, animated: true)
//        }
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let position = scrollView.contentOffset.y
        if position > (tableView.contentSize.height-100-scrollView.frame.size.height) {
            // fetch more data

        }
//        if position > scrollView.frame.size.height {
//            print("fetch pageinate")
//        }
    }
}
