import Foundation

struct Constants {
    static let baseURL = "api.spoonacular.com"
//        static let apiToken = "961884e4a54a440693fc978235b835e2"
//        static let apiToken = "8c612b11d5b74a1b908fd6d65a886e50"
//        static let apiToken = "ec166d4297494de6980de93119696ed9"
//        static let apiToken = "bd24d1d058c4386b650f7ce1bbdce07"
//        static let apiToken = "823b69d6de03422398b29958e6cb178f"
//        static let apiToken = "59ece5a665f9455c92dad51057fd5100"
//    static let apiToken = "2970b49d7c754669aece7b55a25ef7b8"
    static let apiToken = "3ea21aa2dee34d8382cc0c92fa86348d"
//    static let apiToken = "3df4748a170f45ce9c519d7371a16480"
}

enum RequestTag {
    case trendingNow
    case popularCategory
    case general
    case cuisines
    case search
}
