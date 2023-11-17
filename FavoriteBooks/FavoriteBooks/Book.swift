import Foundation

struct Book: CustomStringConvertible {
    var title: String
    var author: String
    var genre: String
    var length: String
    
    var description: String {
        return "\(title) is written by \(author) in the \(genre) genre and is \(length) pages long"
    }
}
