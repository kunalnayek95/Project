//
//  ViewController.swift
//  Animation
//
//  Created by Kunal's Macbook on 12/08/21.
//

import UIKit

class ViewController: UIViewController {

    var imageView: UIImageView!
    var currentAnimation = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView = UIImageView(image: UIImage(named: "download"))
        imageView.center = CGPoint(x: 220, y: 400)
        view.addSubview(imageView)
        
        
    }
    @IBAction func tabBtn(_ sender: UIButton){
        sender.isHidden = true
        
      //  UIView.animate(withDuration: 1, delay: 0, options: []) {
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: []){
            switch self.currentAnimation {
            case 0:
                self.imageView.transform = CGAffineTransform(scaleX: 2, y: 2)
                break
            case 1:
                self.imageView.transform = .identity
                break
            case 2:
                self.imageView.transform = CGAffineTransform(translationX: -150, y:-300 )
                break
            case 3:
                self.imageView.transform = .identity
                break
            case 4:
                self.imageView.transform = CGAffineTransform(rotationAngle: .pi)
                break
            case 5:
                self.imageView.transform = .identity
                break
            case 6:
                self.imageView.alpha = 0.1
                self.imageView.backgroundColor = .red
                break
            case 7:
                self.imageView.alpha = 1
                self.imageView.backgroundColor = .clear
            default:
                break
            }
            
        } completion: { finished in
            sender.isHidden = false
        }

        
        currentAnimation += 1
        if currentAnimation > 7{
            currentAnimation = 0
        }
    }

}

