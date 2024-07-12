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
            guard isViewLoaded, let image else {return}
            imageView.image = image
            imageView.frame.size = image.size
            rescaleAndCenterImageInScrollView(image: image)
        }
    }
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        guard let image else {return}

        imageView.image = image
        imageView.frame.size = image.size
        
        scrollView.minimumZoomScale = 0.1
        scrollView.maximumZoomScale = 1.25
        
        rescaleAndCenterImageInScrollView(image: image)
        
    }
    
    private func rescaleAndCenterImageInScrollView(image: UIImage) {
        let minZoomScale = scrollView.minimumZoomScale
        let maxZoomScale = scrollView.maximumZoomScale
        view.layoutIfNeeded()
        let visibleRectSize = scrollView.bounds.size
        let imageSize = image.size
        let hScale = visibleRectSize.width / imageSize.width // вычисление скейла для ширины
        let vScale = visibleRectSize.height / imageSize.height // вычисление скейла для высоты
        let scale = min(maxZoomScale, max(minZoomScale, min(hScale, vScale))) // Чтобы изображение растянулось до границ экрана c сохранением пропорций, минимальный скейл должен равняться минимальному из двух
        scrollView.setZoomScale(scale, animated: false)
        scrollView.layoutIfNeeded()
        
        updateContentInSet()
    }
    
    private func updateContentInSet() {
        let visibleRectSize = scrollView.bounds.size
        let contentSize = scrollView.contentSize
                
        let horizontalInset = max(0, (visibleRectSize.width - contentSize.width) / 2)
        let verticalInset = max(0, (visibleRectSize.height - contentSize.height) / 2)
                
        scrollView.contentInset = UIEdgeInsets(top: verticalInset, left: horizontalInset, bottom: verticalInset, right: horizontalInset)
    }
    
    @IBAction func didTapShareButton(_ sender: Any) {
        guard let image else {return}
        let share = UIActivityViewController(
            activityItems: [image],
            applicationActivities: nil)
        present(share, animated: true)
    }
    
    @IBAction func didTapBackButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

extension SingleImageViewController: UIScrollViewDelegate {
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        imageView
    }
    
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        updateContentInSet()
    }
}
