import UIKit

class ResultCell: UITableViewCell {
    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var login: UILabel!
    @IBOutlet weak var type: UILabel!
    
    static let identifier = Constants.resultID
    static var nib: UINib {
           return UINib(nibName: String(describing: self), bundle: nil)
    }
    
    func configure(_ model: Item) {
        avatar.image = UIImage(named: model.avatarURL)
        login.text = model.login
        type.text = model.type
    }
 
}
