

import Foundation
struct Cancellation_charges : Codable {
    let adults : Adults?
    let child : Child?
    let infant : Infant?

    enum CodingKeys: String, CodingKey {

        case adults = "Adults"
        case child = "Child"
        case infant = "Infant"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        adults = try values.decodeIfPresent(Adults.self, forKey: .adults)
        child = try values.decodeIfPresent(Child.self, forKey: .child)
        infant = try values.decodeIfPresent(Infant.self, forKey: .infant)
    }

}
