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
	public let baseURL: URL
	public let hmacAlgorithm: HMAC.Algorithm


	// MARK: - Initializers

	public init(secret: String, baseURL: URL, hmacAlgorithm: HMAC.Algorithm = .sha1) {
		self.secret = secret
		self.baseURL = baseURL
		self.hmacAlgorithm = hmacAlgorithm
	}


	// MARK: - URL Signing

	public func sign(URL: Foundation.URL) -> Foundation.URL? {
		guard let signature = HMAC.sign(message: URL.absoluteString, algorithm: hmacAlgorithm, key: secret),
			var components = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)
		else { return nil }

		components.path = "/\(signature)"
		components.queryItems = [
			URLQueryItem(name: "url", value: URL.absoluteString)
		]

		return components.url
	}
}
