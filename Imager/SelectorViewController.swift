//
//  SelectorViewController.swift
//  Imager
//
//  Created by Ray Tso on 9/25/15.
//  Copyright © 2015 Ray Tso. All rights reserved.
//

import UIKit

class SelectorViewController: UIViewController {
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let ivc = segue.destinationViewController as? ImageViewController {
            if let segueIdentifier = segue.identifier {
                switch segueIdentifier {
                case "Suits":
                    ivc.imageURL = DemoURL.Suits
                case "BBT":
                    ivc.imageURL = DemoURL.BBT
                case "NewGirl":
                    ivc.imageURL = DemoURL.NewGirl
                default:
                    break
                }
            }
        }
    }

}
