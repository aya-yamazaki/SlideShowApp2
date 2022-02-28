//
//  ViewController.swift
//  slideshowApp
//
//  Created by ay-yamazaki on 2022/02/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    var nowIndex:Int = 0
    var timer: Timer!
    
    var imageArray:[UIImage] = [
        UIImage(named: "sample1")!,
        UIImage(named: "sample2")!,
        UIImage(named: "sample3")!
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        let image = UIImage(named: "sample1")
        imageView.image = image
    }
        



    @IBAction func startButton(_ sender: Any) {
    if (timer == nil) {
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(changeImage), userInfo: nil, repeats: true)
        } else {
            timer.invalidate()
            timer = nil
        }
    }
    @objc func changeImage() {
        nowIndex += 1
        if (nowIndex == imageArray.count) {
            nowIndex = 0
        }
        imageView.image = imageArray[nowIndex]
    }
    @IBAction func onPrev(_ sender: Any) {
        dispImageNo += 1
        displayImage()
        
    }
    @IBAction func onNext(_ sender: Any) {
        dispImageNo -= 1
        displayImage()
    }
    var dispImageNo = 0
    func displayImage() {
        let imageNameArray = [
        "sample1",
        "sample2",
        "sample3",
        ]
        if dispImageNo < 0 {
            dispImageNo = 2
        }
        if dispImageNo > 2 {
            dispImageNo = 0
        }
        let name = imageNameArray[dispImageNo]
        let image = UIImage(named: name)
        imageView.image = image
        
    }
        


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    
    }


}

