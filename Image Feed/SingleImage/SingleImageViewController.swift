//
//  SingleImageViewController.swift
//  Image Feed
//
//  Created by Муртазали Магомедов on 11.06.2024.
//

import UIKit

final class SingleImageViewController: UIViewController {
    var image: UIImage? {
        didSet {
            guard isViewLoaded else {return}
            imageView.image = image
        }
    }
    
    @IBOutlet var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = image
    }
}
