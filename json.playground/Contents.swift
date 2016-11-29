if let path = NSBundle.mainBundle().pathForResource("chap4_card9", ofType: "json")
{
	if let jsonData = NSData(contentsOfFile: path, options: .DataReadingMappedIfSafe, error: nil)
	{
		if let jsonResult: NSDictionary = NSJSONSerialization.JSONObjectWithData(jsonData, options: NSJSONReadingOptions.MutableContainers, error: nil) as? NSDictionary
		{
			if let persons : NSArray = jsonResult["person"] as? NSArray
			{
				// Do stuff
			}
		}
	}
}