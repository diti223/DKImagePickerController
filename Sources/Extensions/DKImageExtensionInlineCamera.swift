//
//  DKImageExtensionInlineCamera.swift
//  DKImagePickerController
//
//  Created by ZhangAo on 16/12/2017.
//  Copyright © 2017 ZhangAo. All rights reserved.
//

import UIKit
import DKCamera

open class DKImageExtensionInlineCamera: DKImageBaseExtension {
    
    override class func extensionType() -> DKImageExtensionType {
        return .inlineCamera
    }
        
    override open func perform(with extraInfo: [AnyHashable: Any]) {
        guard let didFinishCapturingImage = extraInfo["didFinishCapturingImage"] as? ((UIImage, [AnyHashable : Any]?) -> Void)
            , let didCancel = extraInfo["didCancel"] as? (() -> Void) else { return }
        
        let containsGPSInMetadata = extraInfo["containsGPSInMetadata"] as? Bool ?? false
        
        let camera = DKCamera()
        camera.didFinishCapturingImage = didFinishCapturingImage
        camera.containsGPSInMetadata = containsGPSInMetadata
        camera.didCancel = didCancel
        
        self.checkCameraPermission(camera)
        
        if (camera as UIViewController) is UINavigationController {
            self.context.imagePickerController.present(camera, animated: true)
            self.context.imagePickerController.setViewControllers([], animated: false)
        } else {
            self.context.imagePickerController.setViewControllers([camera], animated: false)
        }
    }

    override open func finish() {
        self.context.imagePickerController.dismiss(animated: true)
    }
    
    open func checkCameraPermission(_ camera: DKCamera) {
        func cameraDenied() {
            DispatchQueue.main.async {
                let permissionView = DKPermissionView.permissionView(.camera)
                camera.cameraOverlayView = permissionView
            }
        }
        
        func setup() {
            camera.cameraOverlayView = nil
        }
        
        DKCamera.checkCameraPermission { granted in
            granted ? setup() : cameraDenied()
        }
    }
    
}
