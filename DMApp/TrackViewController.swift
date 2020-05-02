//
//  TrackViewController.swift
//  DMApp
//
//  Created by SWUCOMPUTER on 2020/04/29.
//  Copyright © 2020 SWUCOMPUTER. All rights reserved.
//

import UIKit

class TrackViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var userName: UITextField!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var trackLabel: UILabel!
    @IBOutlet var exTrack: UILabel!
    @IBOutlet var programSlider: UISlider!
    @IBOutlet var interactionSlider: UISlider!
    @IBOutlet var designSlider: UISlider!
    var trackDim: [String: String]!=[
        "미디어시스템기술트랙":"미디어시스템기술 트랙은 소프트웨어 중심의 C++/Java 등의 프로그래밍 언어와, 하드웨어 중심의 VR/AR/MR 디바이스/시스템 구조, 시스템 개발 및 운영에 필요한 자료구조/미디어운영시스템/데이터베이스 등 미디어 시스템의 기반이 되는 주제를 다루는 트랙입니다.",
        "인터랙션기술트랙":"인터랙션기술 트랙은 디지털 미디어 기기 상호간의 인터넷 통신, 앱 혹은 웹 클라이언트와 서버간의 통신, 사용자와 주변환경과의 다양한 인터랙션 처리 및 인간과 기기의 인공지능을 통한 인터랙션 등 다양한 정보교환 및 인터랙션에 대한 주제를 다루는 트랙입니다.",
        "인터랙션디자인트랙":"인터렉션 디자인 트랙은 인간과 스마트 미디어 간의 상호작용에 따른 인터렉션 방식을 학습하고, 다양한 인터렉션 디자인을 설계하고, 구현합니다. 정보 설계와 상호작용 설계 중심의 개념적 설계와 시각와 청각 중심의 인터페이스 디자인에 전반을 다루는 트랙입니다.",
        "스마트콘텐츠제작트랙":"스마트 콘텐츠 제작 세부 트랙은 미디어 기획과 스토리텔링, 다양한 미디어 기반의 2D, 3D 그래픽과 모션디자인 그리고 VR/AR/MR과 웹 콘텐츠의 시각적 구현을 통한 스마트콘텐츠 제작 전반에 대한 주제를 다루는 세부트랙입니다.",
        "모든트랙":"당신은 다재다능한 슈니!",
        "??":"다양한 경험을 통해 좋아하는 것을 찾아보세요"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        let nameString:String!
        nameString=userName.text
        nameLabel.text=nameString+"에게 어울리는 트랙은"
        return true
    }
    func inputTrack(track: String){
        if track=="모든트랙" {
            trackLabel.text="모든 트랙"
            exTrack.text=trackDim[track]
        }
        else if track=="미디어시스템기술트랙"{
            trackLabel.text="미디어시스템기술 트랙"
            exTrack.text=trackDim[track]
        }
        else if track=="스마트콘텐츠제작트랙"{
            trackLabel.text="스마트콘텐츠제작 트랙"
            exTrack.text=trackDim[track]
        }
        else if track=="미디어시스템기술트랙 인터랙션기술트랙"{
            trackLabel.text="미디어시스템기술 트랙\n인터랙션기술 트랙"
            exTrack.text=trackDim["미디어시스템기술트랙"]! + "\n"+trackDim["인터랙션기술트랙"]!
        }
        else if track=="미디어시스템기술트랙 스마트콘텐츠제작트랙"{
            trackLabel.text="미디어시스템기술트랙\n스마트콘텐츠제작트랙"
            exTrack.text=trackDim["미디어시스템기술트랙"]! + "\n"+trackDim["스마트콘텐츠제작트랙"]!
        }
        else if track=="인터랙션디자인트랙 스마트콘텐츠제작트랙"{
            trackLabel.text="인터랙션디자인트랙\n스마트콘텐츠제작트랙"
            exTrack.text=trackDim["인터랙션디자인트랙"]! + "\n"+trackDim["스마트콘텐츠제작트랙"]!
        }
        else if track=="미디어시스템기술트랙 인터랙션기수트랙"{
            trackLabel.text="미디어시스템기술트랙\n인터랙션기술트랙"
            exTrack.text=trackDim["미디어시스템기술트랙"]! + "\n"+trackDim["인터랙션기술트랙"]!
        }
        else if track=="인터랙션기술트랙 인터랙션디자인트랙"{
            trackLabel.text="인터랙션기술트랙\n인터랙션디자인트랙"
            exTrack.text=trackDim["인터랙션기술트랙"]!+"\n"+trackDim["인터랙션디자인트랙"]!
        }
        else if track=="인터랙션디자인트랙 스마트콘텐츠제작트랙"{
            trackLabel.text="인터랙션디자인트랙\n스마트콘텐츠제작트랙"
            exTrack.text=trackDim["인터랙션디자인트랙"]!+"\n"+trackDim["스마트콘텐츠제작트랙"]!
        }
        else if track=="미디어시스템기술트랙 스마트콘텐츠제작트랙"{
            trackLabel.text="미디어시스템기술트랙\n스마트콘텐츠제작트랙"
            exTrack.text=trackDim["미디어시스템기술트랙"]!+"\n"+trackDim["스마트콘텐츠제작트랙"]!
        }
        else if track=="??"{
            trackLabel.text="??"
            exTrack.text=trackDim["??"]
        }
        
    }
    
    @IBAction func trackSlider(_ sender: UISlider) {
        var programScore: Float!
        var interactionScore: Float!
        var designScore: Float!
        programScore=self.programSlider.value
        interactionScore=self.interactionSlider.value
        designScore=self.designSlider.value
        if programScore==interactionScore&&programScore==designScore&&programScore>0.5 {
            inputTrack(track: "모든트랙")
        }
        else if programScore>=interactionScore&&programScore>=designScore&&programScore>0.5{
            if designScore>=0.5&&interactionScore>=0.5{
                inputTrack(track: "모든트랙")
            }
            else if interactionScore>=0.5 && designScore<0.5{
                inputTrack(track: "미디어시스템기술트랙 인터랙션기술트랙")
            }
            else if designScore>=0.5 && interactionScore<0.5{
                inputTrack(track: "미디어시스템기술트랙 스마트콘텐츠제작트랙")
            }
            else{
                inputTrack(track: "미디어시스템기술트랙")
            }
            
        }
        else if interactionScore>=programScore&&interactionScore>=designScore&&interactionScore>0.5{
            if programScore>=0.5&&designScore>=0.5{
                inputTrack(track: "모든트랙")
            }
            else if designScore>=0.5 && programScore<0.5{
                inputTrack(track: "인터랙션디자인트랙 스마트콘텐츠제작트랙")
            }
            else if programScore>=0.5 && designScore<0.5{
                inputTrack(track: "미디어시스템기술트랙 인터랙션기술트랙")
            }
            else{
                inputTrack(track: "인터랙션기술트랙 인터랙션디자인트랙")
            }
        }
        else if designScore>=interactionScore&&designScore>=programScore&&designScore>0.5{
            if programScore>=0.5&&interactionScore>=0.5{
                inputTrack(track: "모든트랙")
            }
            else if interactionScore>=0.5 && programScore<0.5{
                inputTrack(track: "인터랙션디자인트랙 스마트콘텐츠제작트랙")
            }
            else if programScore>=0.5 && interactionScore<0.5{
                inputTrack(track: "미디어시스템기술트랙 스마트콘텐츠제작트랙")
            }
            else{
                inputTrack(track: "스마트콘텐츠제작트랙")
            }
        }
        else if designScore<0.5&&interactionScore<0.5&&programScore<0.5{
            inputTrack(track: "??")
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
