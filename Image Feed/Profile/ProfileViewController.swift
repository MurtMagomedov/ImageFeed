//
//  ProfileViewController.swift
//  Image Feed
//
//  Created by Муртазали Магомедов on 09.06.2024.
//

import UIKit

final class ProfileViewController: UIViewController {
    
    private var avatarImage: UIImageView?
    private var exitButton: UIButton?
    private var descriptionLabel: UILabel?
    private var userLabel: UILabel?
    private var nameLabel: UILabel?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        avatar()
        name()
        user()
        description()
        exit()
    }
    
    @objc private func exitButtonAction() {
        
    }
    
    private func avatar() {
        let avatar = UIImageView()
        avatar.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(avatar)
        avatar.image = UIImage(named: "Avatar")
        
        avatar.heightAnchor.constraint(equalToConstant: 70).isActive = true
        avatar.widthAnchor.constraint(equalToConstant: 70).isActive = true
        avatar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16).isActive = true
        avatar.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
        self.avatarImage = avatar
    }
    
    private func name() {
        let name = UILabel()
        name.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(name)
        name.textColor = .white
        
        guard let avatar = avatarImage else {return}
        name.text = "Суворов Александр"
        name.font = UIFont.boldSystemFont(ofSize: 23)
        name.topAnchor.constraint(equalTo: avatar.safeAreaLayoutGuide.bottomAnchor, constant: 8).isActive = true
        name.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
        self.nameLabel = name
    }
    
    private func user() {
        let user = UILabel()
        user.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(user)
        user.textColor = .gray
        
        user.text = "@aleksandr-su"
        user.font = user.font.withSize(13)
        guard let name = nameLabel else {return}
        user.topAnchor.constraint(equalTo: name.safeAreaLayoutGuide.bottomAnchor, constant: 8).isActive = true
        user.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
        self.userLabel = user
    }
    
    private func description () {
        let description = UILabel()
        description.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(description)
        description.textColor = .white
        
        
        description.text = "Hello World"
        description.font = description.font.withSize(13)
        guard let user = userLabel else {return}
        description.topAnchor.constraint(equalTo: user.safeAreaLayoutGuide.bottomAnchor, constant: 8).isActive = true
        description.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
        self.descriptionLabel = description
    }
    
    private func exit() {
        let image = UIImage(named: "Exit_Button")
        guard let image = image else {return}
        
        let exit = UIButton.systemButton(
            with: image,
            target: self,
            action: #selector(exitButtonAction)
        )
        exit.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(exit)
        exit.tintColor = UIColor(named: "YPRedColor")
        
        exit.heightAnchor.constraint(equalToConstant: 40).isActive = true
        exit.widthAnchor.constraint(equalToConstant: 40).isActive = true
        exit.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16).isActive = true
        exit.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16).isActive = true
        self.exitButton = exit
    }
}
