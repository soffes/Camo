//
//  Camo.swift
//  Camo
//
//  Created by Sam Soffes on 12/5/15.
//  Copyright © 2015 Sam Soffes. All rights reserved.
//

import Foundation
import Crypto

public struct Camo {

	// MARK: - Properties

	public let secret: String
	public let baseURL: NSURL
	public let HMACAlgorithm: HMAC.Algorithm


	// MARK: - Initializers

	public init(secret: String, baseURL: NSURL, HMACAlgorithm: HMAC.Algorithm = .SHA1) {
		self.secret = secret
		self.baseURL = baseURL
		self.HMACAlgorithm = HMACAlgorithm
	}


	// MARK: - URL Signing

	public func sign(URL URL: NSURL) -> NSURL? {
		guard let signature = HMAC.sign(message: URL.absoluteString, algorithm: HMACAlgorithm, key: secret),
			components = NSURLComponents(URL: baseURL, resolvingAgainstBaseURL: true)
		else { return nil }

		components.path = "/\(signature)"
		components.queryItems = [
			NSURLQueryItem(name: "url", value: URL.absoluteString)
		]

		return components.URL
	}
}
