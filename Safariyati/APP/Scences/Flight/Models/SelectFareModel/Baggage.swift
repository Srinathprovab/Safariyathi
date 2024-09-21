

import Foundation
struct Baggage : Codable {
    let adults : String?
    let child : String?
    let infant : String?
    
    enum CodingKeys: String, CodingKey {
        
        case adults = "Adults"
        case child = "Childs"
        case infant = "Infants"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        adults = try values.decodeIfPresent(String.self, forKey: .adults)
        child = try values.decodeIfPresent(String.self, forKey: .child)
        infant = try values.decodeIfPresent(String.self, forKey: .infant)
    }
    
}
