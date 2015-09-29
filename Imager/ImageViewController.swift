//
//  ViewController.swift
//  Imager
//
//  Created by Ray Tso on 9/25/15.
//  Copyright © 2015 Ray Tso. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController, UIScrollViewDelegate {
    
    var imageURL: NSURL? {
        didSet {
//            image = nil
            if infoImage != nil {
                getImage()
            }
        }
    }
    
    private func getImage() {
        if let url = imageURL {
            if let imageData = NSData(contentsOfURL: url) {
                image = UIImage(data: imageData)
            }
        }
    }
    
    private var image: UIImage? {
        get {
            return infoImage.image
        }
        set {
            infoImage.image = newValue
            infoImage.sizeToFit()
            scrollView?.contentSize = infoImage.frame.size
        }
    }
    
    @IBOutlet weak var infoImage: UIImageView!
    
    @IBOutlet weak var contentView: UIView!
    
    @IBOutlet weak var scrollView: UIScrollView! {
        didSet {
            scrollView.contentSize = infoImage.frame.size
            scrollView.delegate = self
            scrollView.maximumZoomScale = 1
            scrollView.minimumZoomScale = 0.3
        }
    }
    
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return infoImage
    }
    
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        if image == nil {
            getImage()
        }
    }
    
    
}

