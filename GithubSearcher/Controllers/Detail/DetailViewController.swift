import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var avatar: UIImageView!
    
    @IBOutlet weak var login: UILabel!
    
    @IBOutlet weak var type: UILabel!
    
    var result: Item?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let res = result {
            setup(with: res)
        }
    }
    
    private func setup(with model: Item) {
        avatar.sd_setImage(with: URL(string: model.avatarURL))
        login.text = model.login
        type.text = model.type // lat
    }

}
