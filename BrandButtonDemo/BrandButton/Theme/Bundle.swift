//
//  Bundle.swift
//  BrandButtonDemo
//
//  Created by Abhishek Srivastava on 11/02/24.
//

import Foundation

public extension Bundle {
    static var current: Bundle? {
        let bundlePath = Bundle(for: ColorAsset.self)
        guard let resourcesBundleUrl = bundlePath.resourceURL?.appendingPathComponent("BrandButtonDemo.bundle") else {
            return nil
        }
        let bundle = Bundle(url: resourcesBundleUrl)
        return bundle
    }
}
