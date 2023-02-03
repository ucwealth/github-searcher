import Foundation
class ResultViewModel {
    var dummyResults: User = User(totalCount: 3, items: [
            Item(login: "first", avatarURL: "profile", type: "User"),
            Item(login: "second", avatarURL: "man", type: "Admin"),
            Item(login: "third", avatarURL: "profile", type: "User")
        ])

}
