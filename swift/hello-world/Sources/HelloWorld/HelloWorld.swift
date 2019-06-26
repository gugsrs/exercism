func hello(_ name: String? = nil) -> String {
	var txt = "World"
	if name != nil {
		txt = name!
	}	
	return "Hello, \(txt)!"
}
