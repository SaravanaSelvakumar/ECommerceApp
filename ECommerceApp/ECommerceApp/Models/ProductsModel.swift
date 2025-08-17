

import Foundation

struct Product: Decodable, Identifiable, Hashable {
    let id: Int
    let title: String
    let price: Double
    let description: String
    let category: String
    let image: String
    let rating: Rating
    
    var formattedPrice: String {
        "₹ \(String(format: "%.2f", price))"
    }
    
    var formattedRating: String {
        String(format: "%.1f", rating.rate)
    }
    
    var formattedRatingCount: String {
        "(\(rating.count))"
    }
    
    var RatingWithReviews: String {
        "(\(rating.count) reviews)"
    }
    
    var imageURL: URL? {
        URL(string: image)
    }
}

struct Rating: Decodable, Hashable {
    let rate: Double
    let count: Int
}

