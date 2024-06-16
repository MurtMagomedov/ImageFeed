//
//  ProfileViewController.swift
//  Image Feed
//
//  Created by Муртазали Магомедов on 09.06.2024.
//

import UIKit

final class ProfileViewController: UIViewController {
    
    @IBOutlet private var avatarImage: UIImageView!
    @IBOutlet private var exitButton: UIButton!
    @IBOutlet private var descriptionLabel: UILabel!
    @IBOutlet private var userLabel: UILabel!
    @IBOutlet private var nameLabel: UILabel!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
    }
    
    @IBAction func exitButtonAction(_ sender: Any) {
        
    }
    
}
