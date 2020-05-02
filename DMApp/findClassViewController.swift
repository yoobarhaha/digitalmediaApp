//
//  findClassViewController.swift
//  DMApp
//
//  Created by SWUCOMPUTER on 2020/05/01.
//  Copyright © 2020 SWUCOMPUTER. All rights reserved.
//

import UIKit

class findClassViewController: UIViewController {

    @IBOutlet var semesterSeg: UISegmentedControl!
    @IBOutlet var classTypeSeg: UISegmentedControl!
    @IBOutlet var classCreditSeg: UISegmentedControl!
    @IBOutlet var gradeSeg: UISegmentedControl!
    @IBOutlet var classLabel: UILabel!
    @IBOutlet var searchIndicator: UIActivityIndicatorView!
    var indicatorNotHidden:Bool=false
    
    let all:String="디지털미디어세미나1 디지털미디어세미나2 소프트웨어역량인증 소프트웨어개발실무영어1 소프트웨어개발실무영어2 디지털미디어학개론 C++프로그래밍기초 미디어디자인기초 고급C++프로그래밍 고급미디어디자인 컴퓨터시스템및미디어구조 디지털미디어입문실습 자바프로그래밍 GUI디자인 모션그래픽제작 미디어기획 CG프로그래밍 휴먼미디어인터랙션 인터랙션프로그래밍 자료구조 3D모델링 인터랙션디자인 미디어통신 VR/AR/MR프로그래밍 미디어스토리텔링 미디어운영시스템 3D미디어구현 모바일앱프로그래밍 모바일인터랙션디자인 VR/AR/MR콘텐츠제작 캡스톤디자인설계1 데이터베이스 웹프로그래밍 실감미디어제작 VR/AR/MR디자인 캡스톤디자인설계2 웹콘텐츠제작 인공지능 미디어빅데이터 포트폴리오특론"
    var creditDic: [String:String]=[
        "0학점":"디지털미디어세미나1 디지털미디어세미나2 소프트웨어역량인증",
        "1학점":"소프트웨어개발실무영어1 소프트웨어개발실무영어2",
        "3학점":"디지털미디어학개론 C++프로그래밍기초 미디어디자인기초 고급C++프로그래밍 고급미디어디자인 컴퓨터시스템및미디어구조 디지털미디어입문실습 자바프로그래밍 GUI디자인 모션그래픽제작 미디어기획 CG프로그래밍 휴먼미디어인터랙션 인터랙션프로그래밍 자료구조 3D모델링 인터랙션디자인 미디어통신 VR/AR/MR프로그래밍 미디어스토리텔링 미디어운영시스템 3D미디어구현 모바일앱프로그래밍 모바일인터랙션디자인 VR/AR/MR콘텐츠제작 캡스톤디자인설계1 데이터베이스 웹프로그래밍 실감미디어제작 VR/AR/MR디자인 캡스톤디자인설계2 웹콘텐츠제작 인공지능 미디어빅데이터 포트폴리오특론"]
    var creditSet: Set<String>=[]
    var typeDic: [String:String]=[
        "전공필수":"디지털미디어학개론 C++프로그래밍기초 디지털미디어세미나1 자료구조 디지털미디어세미나2 캡스톤디자인설계1 캡스톤디자인설계2 소프트웨어역량인증",
        "전공선택":" 소프트웨어개발실무영어1 소프트웨어개발실무영어2 미디어디자인기초 고급C++프로그래밍 고급미디어디자인 컴퓨터시스템및미디어구조 디지털미디어입문실습 자바프로그래밍 GUI디자인 모션그래픽제작 미디어기획 CG프로그래밍 휴먼미디어인터랙션 인터랙션프로그래밍 3D모델링 인터랙션디자인 미디어통신 VR/AR/MR프로그래밍 미디어스토리텔링 미디어운영시스템 3D미디어구현 모바일앱프로그래밍 모바일인터랙션디자인 VR/AR/MR콘텐츠제작 데이터베이스 웹프로그래밍 실감미디어제작 VR/AR/MR디자인 웹콘텐츠제작 인공지능 미디어빅데이터 포트폴리오특론"]
    var typeSet: Set<String>=[]
    var gradeDic:[String:String]=[
        "1학년":"디지털미디어학개론 C++프로그래밍기초 미디어디자인기초 소프트웨어개발실무영어1 고급C++프로그래밍 고급미디어디자인 디지털미디어세미나1 컴퓨터시스템및미디어구조 디지털미디어입문실습",
        "2학년":"자바프로그래밍 GUI디자인 모션그래픽제작 미디어기획 CG프로그래밍 휴먼미디어인터랙션 인터랙션프로그래밍 자료구조 3D모델링 인터랙션디자인 미디어통신 VR/AR/MR프로그래밍 미디어스토리텔링",
        "3학년":"디지털미디어세미나2 미디어운영시스템 3D미디어구현 모바일앱프로그래밍 모바일인터랙션디자인 VR/AR/MR콘텐츠제작 캡스톤디자인설계1 데이터베이스 웹프로그래밍 실감미디어제작 VR/AR/MR디자인 소프트웨어개발실무영어2",
        "4학년":"캡스톤디자인설계2 웹콘텐츠제작 인공지능 소프트웨어역량인증 미디어빅데이터 포트폴리오특론"]
    var gradeSet: Set<String>=[]
    var semesterDic:[String:String]=[
        "1학기":"디지털미디어학개론 C++프로그래밍기초 미디어디자인기초 소프트웨어개발실무영어1 자바프로그래밍 GUI디자인 모션그래픽제작 미디어기획 CG프로그래밍 휴먼미디어인터랙션 인터랙션프로그래밍 디지털미디어세미나2 미디어운영시스템 3D미디어구현 모바일앱프로그래밍 모바일인터랙션디자인 VR/AR/MR콘텐츠제작 캡스톤디자인설계1 캡스톤디자인설계2 웹콘텐츠제작 인공지능 소프트웨어역량인증",
        "2학기":"고급C++프로그래밍 고급미디어디자인 디지털미디어세미나1 컴퓨터시스템및미디어구조 디지털미디어입문실습 자료구조 3D모델링 인터랙션디자인 미디어통신 VR/AR/MR프로그래밍 미디어스토리텔링 캡스톤디자인설계1 데이터베이스 웹프로그래밍 실감미디어제작 VR/AR/MR디자인 소프트웨어개발실무영어2 소프트웨어역량인증 미디어빅데이터 포트폴리오특론"]
    var semesterSet:Set<String>=[]
    var resultSet:Set<String>=[]
    var allClassString:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        classLabel.textAlignment=NSTextAlignment.init(rawValue: 0)!
        for allClass in all.components(separatedBy: " "){
            allClassString+=allClass+"\n"
        }
        classLabel.text=allClassString
        semesterSeg.selectedSegmentIndex=0
        semesterClass(semesterSeg)
        classTypeSeg.selectedSegmentIndex=0
        typeClass(classTypeSeg)
        classCreditSeg.selectedSegmentIndex=0
        creditClass(classCreditSeg)
        gradeSeg.selectedSegmentIndex=0
        gradeClass(gradeSeg)
        searchIndicator.color=UIColor.blue
    }
    
    @IBAction func semesterClass(_ sender: UISegmentedControl) {
        searchIndicator.isHidden=indicatorNotHidden
        searchIndicator.startAnimating()
        semesterSet=[]
        let selected:String!=semesterSeg!.titleForSegment(at: semesterSeg.selectedSegmentIndex)
        if selected=="전체"{
            for semesterStringtoSet in all.components(separatedBy: " "){
                semesterSet.insert(semesterStringtoSet)
            }
        }
        else{
            let semesterString:String=semesterDic[selected]!
            for semesterStringtoSet in semesterString.components(separatedBy: " "){
                semesterSet.insert(semesterStringtoSet)
            }
        }
         
        }
            
    @IBAction func typeClass(_ sender: UISegmentedControl) {
        searchIndicator.isHidden=indicatorNotHidden
        searchIndicator.startAnimating()
        typeSet=[]
        let selected:String!=classTypeSeg!.titleForSegment(at: classTypeSeg.selectedSegmentIndex)
        if selected=="전체"{
            for typeStringtoSet in all.components(separatedBy: " "){
                typeSet.insert(typeStringtoSet)
            }
        }
        else{
            let typeString:String=typeDic[selected]!
            for typeStringtoSet in typeString.components(separatedBy: " "){
                typeSet.insert(typeStringtoSet)
            }
        }
    }
    
    @IBAction func creditClass(_ sender: UISegmentedControl) {
        searchIndicator.isHidden=indicatorNotHidden
        searchIndicator.startAnimating()
        creditSet=[]
        let selected:String!=classCreditSeg!.titleForSegment(at: classCreditSeg.selectedSegmentIndex)
        if selected=="전체"{
            for creditStringtoSet in all.components(separatedBy: " "){
                creditSet.insert(creditStringtoSet)
            }
        }
        else{
            let creditString:String=creditDic[selected]!
            for creditStringtoSet in creditString.components(separatedBy: " "){
                creditSet.insert(creditStringtoSet)
            }
        }
    }
    @IBAction func gradeClass(_ sender: UISegmentedControl) {
        searchIndicator.isHidden=indicatorNotHidden
        searchIndicator.startAnimating()
        gradeSet=[]
        let selected:String!=gradeSeg!.titleForSegment(at: gradeSeg.selectedSegmentIndex)
        if selected=="전체"{
            for gradeStringtoSet in all.components(separatedBy: " "){
                gradeSet.insert(gradeStringtoSet)
            }
        }
        else{
            let gradeString:String=gradeDic[selected]!
            for gradeStringtoSet in gradeString.components(separatedBy: " "){
                gradeSet.insert(gradeStringtoSet)
            }
        }
    }
    
    @IBAction func searchResult(_ sender: UIButton) {
        searchIndicator.stopAnimating()
        searchIndicator.isHidden = !indicatorNotHidden
        resultSet=[]
        classLabel.text=""
        resultSet=creditSet.intersection(typeSet)
        resultSet=resultSet.intersection(gradeSet)
        resultSet=resultSet.intersection(semesterSet)
        for index in resultSet{
            classLabel.text!+=index+"\n"
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
