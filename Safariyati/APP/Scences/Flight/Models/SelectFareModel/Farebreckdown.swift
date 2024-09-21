/* 
Copyright (c) 2024 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Farebreckdown : Codable {
	let chd_base_price : String?
	let inf_tax : String?
	let chd_no : Int?
	let adt_price : String?
	let inf_base_price : String?
	let adt_base_price : String?
	let adt_no : Int?
	let chd_price : String?
	let chd_tax : String?
	let inf_no : Int?
	let inf_total : String?
	let adt_total : String?
	let inf_price : String?
	let chd_total : String?
	let adt_tax : String?

	enum CodingKeys: String, CodingKey {

		case chd_base_price = "chd_base_price"
		case inf_tax = "inf_tax"
		case chd_no = "chd_no"
		case adt_price = "adt_price"
		case inf_base_price = "inf_base_price"
		case adt_base_price = "adt_base_price"
		case adt_no = "adt_no"
		case chd_price = "chd_price"
		case chd_tax = "chd_tax"
		case inf_no = "inf_no"
		case inf_total = "inf_total"
		case adt_total = "adt_total"
		case inf_price = "inf_price"
		case chd_total = "chd_total"
		case adt_tax = "adt_tax"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		chd_base_price = try values.decodeIfPresent(String.self, forKey: .chd_base_price)
		inf_tax = try values.decodeIfPresent(String.self, forKey: .inf_tax)
		chd_no = try values.decodeIfPresent(Int.self, forKey: .chd_no)
		adt_price = try values.decodeIfPresent(String.self, forKey: .adt_price)
		inf_base_price = try values.decodeIfPresent(String.self, forKey: .inf_base_price)
		adt_base_price = try values.decodeIfPresent(String.self, forKey: .adt_base_price)
		adt_no = try values.decodeIfPresent(Int.self, forKey: .adt_no)
		chd_price = try values.decodeIfPresent(String.self, forKey: .chd_price)
		chd_tax = try values.decodeIfPresent(String.self, forKey: .chd_tax)
		inf_no = try values.decodeIfPresent(Int.self, forKey: .inf_no)
		inf_total = try values.decodeIfPresent(String.self, forKey: .inf_total)
		adt_total = try values.decodeIfPresent(String.self, forKey: .adt_total)
		inf_price = try values.decodeIfPresent(String.self, forKey: .inf_price)
		chd_total = try values.decodeIfPresent(String.self, forKey: .chd_total)
		adt_tax = try values.decodeIfPresent(String.self, forKey: .adt_tax)
	}

}