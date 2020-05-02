//
//  stressViewController.swift
//  DMApp
//
//  Created by SWUCOMPUTER on 2020/04/29.
//  Copyright © 2020 SWUCOMPUTER. All rights reserved.
//

import UIKit

class stressViewController: UIViewController {

    @IBOutlet var kindSeg: UISegmentedControl!
    @IBOutlet var hwImageView: UIImageView!
    var count:Int!=0
    var countString:String!
    @IBOutlet var exSeg: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        kindSeg.backgroundColor=UIColor.gray
        // Do any additional setup after loading the view.
    }
    
    @IBAction func changeSeg(_ sender: UISegmentedControl) {
        if kindSeg.titleForSegment(at: kindSeg.selectedSegmentIndex)=="과제타파"{
            hwImageView.image=UIImage(named:"과제0.jpg")
            exSeg.text="아래 버튼을 눌러 과제를 타파하세요!"
        }
        else{
            hwImageView.image=UIImage(named:"심신안정0.jpg")
            exSeg.text="아래 버튼을 눌러 다른 심신안정이 되는 사진을 보세요!"
        }
    }
    @IBAction func stressOut(_ sender: UIButton) {
        count+=1
        if kindSeg.titleForSegment(at: kindSeg.selectedSegmentIndex) == "과제타파" {
            countString="과제"+String(count)+".jpg"
            if count==25{
                count = -1
                exSeg.text="축하드립니다! 과제타파하셨습니다!"
                hwImageView.image = UIImage(named: countString)
            }
            else{
                exSeg.text="아래 버튼을 눌러 과제를 타파하세요!"
                 hwImageView.image = UIImage(named: countString)
            }
        }
        else{
            countString="심신안정"+String(count)+".jpg"
            if count==4{
                count = -1
                hwImageView.image = UIImage(named: countString)
            }
            else{
                 hwImageView.image = UIImage(named: countString)
            }
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
