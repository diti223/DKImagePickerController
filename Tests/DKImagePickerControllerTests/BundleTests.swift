//
//  File.swift
//  
//
//  Created by Adrian Bilescu on 2/25/21.
//

import XCTest
@testable import DKImagePickerController

class BundleTests: XCTestCase {
    func testAccessingLocalizedStringFromBundle_AppDoesntCrash() {
//        Bundle.imagePickerControllerBundle()
        let localizedString = DKImagePickerControllerResource.localizedStringWithKey("picker.albums")
    }
    
    func testAccessingUIImageFromBundle_AppDoesntCrash() {
        let image = DKImagePickerControllerResource.checkedImage()
    }
}
