//
//  CamoTests.swift
//  CamoTests
//
//  Created by Sam Soffes on 12/5/15.
//  Copyright © 2015 Sam Soffes. All rights reserved.
//

import XCTest
import Camo

class CamoTests: XCTestCase {

	let camo = Camo(secret: "something-secret", baseURL: NSURL(string: "https://camo.example.com/")!)

	func testSigning() {
		let URL = NSURL(string: "http://soffes-assets.s3.amazonaws.com/images/Sam-Soffes.jpg")!
		XCTAssertEqual(NSURL(string: "https://camo.example.com/c426621ed24dd05c47d766e5372de822c5601789?url=http://soffes-assets.s3.amazonaws.com/images/Sam-Soffes.jpg")!, camo.sign(URL: URL))
	}
}
