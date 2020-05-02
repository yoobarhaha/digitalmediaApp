//
//  graduationViewController.swift
//  DMApp
//
//  Created by SWUCOMPUTER on 2020/04/30.
//  Copyright © 2020 SWUCOMPUTER. All rights reserved.
//

import UIKit

class graduationViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet var admissionYear: UIPickerView!
    let yearArray: Array<String>=["2016","2017","2018","2019","2020"]
    var adYear:String!
    var majorTypeString:String!
    @IBOutlet var majorType: UISegmentedControl!
    @IBOutlet var englishScore: UILabel!
    @IBOutlet var generalReq: UILabel!
    @IBOutlet var generalElec: UILabel!
    @IBOutlet var firstMajor: UILabel!
    @IBOutlet var secondMajor: UILabel!
    @IBOutlet var subView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int)->Int{
        return yearArray.count
    }
    //func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> //String? {//왜 private?
        //return yearArray[row]
        
    //}
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let myTitle = NSAttributedString(string: yearArray[row], attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        return myTitle
    }
    
    @IBAction func toggleSubView(_ sender: UISwitch) {
        self.subView.isHidden = !sender.isOn
    }
    @IBAction func getYearValue(_ sender: UIButton) {
        adYear=yearArray[self.admissionYear.selectedRow(inComponent: 0)]
        majorTypeString=majorType.titleForSegment(at: majorType.selectedSegmentIndex)
        //let adYearInt=Int(adYear)
        inputEngData(year: adYear)
        inputGeneralReq(year: adYear)
        inputGeneralElec(year: adYear)
        getMajorValue(majorType)
    }
    
    @IBAction func getMajorValue(_ sender: UISegmentedControl) {
        let majorString:String=majorType.titleForSegment(at: majorType.selectedSegmentIndex)!
        inputMajorData(major: majorString)
    }
    func inputEngData(year:String){
        if year=="2016" || year=="2017" || year=="2018"{
            englishScore.text="1. 공익토익성적 750점 이상\n그에 준하는 성적 제출 \n 2.<대학영어(읽기쓰기)>(3학점) 이수"
        }
        else{
            englishScore.text="해당사항 없음"
        }
    }
    func inputGeneralReq(year:String){
        if year=="2016"{
            generalReq.text="10학점(기독교개론,바롬인성교육1,2,3,대학영어(듣말),소프트웨어와창의적사고)"
        }
        else if year=="2017" || year=="2018" || year=="2019"{
            generalReq.text="10학점(기독교개론,바롬인성교육1,2,3,대학영어(듣말),소프트웨어와창의적사고)"
        }
        else{
            generalReq.text="기독교개론,바롬인성교육,바롬종합설계프로젝트,대학영어(듣말),소프트웨어와창의적사고"
        }
    }
    func inputGeneralElec(year:String){
        if year=="2016"{
            generalElec.text="30학점 이상"
        }
        else{
            generalElec.text="27학점 이상"
        }
    }
    func inputMajorData(major:String){
        
        if major=="심화전공"||major=="부전공"{
            if adYear=="2016"{
                firstMajor.text="54학점 이상"
                if major=="부전공"{
                    secondMajor.text="21학점 이상"
                }
                else{
                    secondMajor.text=" "
                }
            }
            else{
                firstMajor.text="69학점 이상"
                if major=="부전공"{
                    secondMajor.text="21학점 이상"
                }
                else{
                    secondMajor.text=" "
                }
            }
        }
        else{
            firstMajor.text="42학점 이상"
            if major=="일반복전"{
                secondMajor.text="42학점 이상"
            }
            else if major=="연계복전"{
                secondMajor.text="36학점 이상"
            }
        }
    }
    //func inputMajorData(major:String){
        
    //}
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
