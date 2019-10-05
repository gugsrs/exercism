import Foundation

struct Gigasecond {
	let description: String

	init?(from: String) {
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
		dateFormatter.timeZone = TimeZone(identifier: "UTC")
		var date = dateFormatter.date(from: from)
		date = date!.addingTimeInterval(1000000000)
		self.description = dateFormatter.string(from: date!)
	}
}
