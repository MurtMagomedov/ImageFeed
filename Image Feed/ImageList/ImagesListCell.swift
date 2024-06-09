//
//  ImagesListCell.swift
//  Image Feed
//
//  Created by Муртазали Магомедов on 07.06.2024.
//

import Foundation
import UIKit

final class ImagesListCell: UITableViewCell {
    @IBOutlet var likeButton: UIButton!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var imageCell: UIImageView!
    static let reuseIdentifier = "ImagesListCell"
    

}
