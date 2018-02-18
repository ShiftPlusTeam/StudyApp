//
//  RecordViewController.swift
//  StudyApp
//
//  Created by Sasakura Hirofumi on 2017/10/28.
//  Copyright © 2017年 ShiftPlus+. All rights reserved.
//

import UIKit

//セグメント
struct Segment {
    //セグメントの背景色
    var color: UIColor
    //セグメントの割合を設定する変数
    var value: CGFloat
}

//パイチャート表示用クラス
//実際に動作させないと挙動がわからない部分がありテストの後に細かい点を修正予定
class PieChartView: UIView {
    
    var segments = [Segment]() {
        didSet {
            setNeedsDisplay()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        isOpaque = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func draw(_ rect: CGRect) {
        //CGContextの初期化
        let ctx = UIGraphicsGetCurrentContext()
        
        //円形にするためにradiusを設定
        let radius = min(frame.size.width, frame.size.height)/2
        
        //中心点を取得
        let viewCenter = CGPoint(x: bounds.size.width/2, y: bounds.size.height/2)
        
        //セグメント毎の比率に応じてグラフを変形するための変数
        let valueCount = segments.reduce(0) {$0 + $1.value}
        
        //円グラフの起点を設定
        var startAngle = -CGFloat(M_PI*0.5)
        
        //初期化された全てのセグメントをレンダリング
        for segment in segments {
            ctx?.setFillColor(segment.color.cgColor)
            let endAngle = startAngle + CGFloat(M_PI*2)*(segment.value/valueCount)
            ctx?.move(to: CGPoint(x: viewCenter.x, y: viewCenter.y))
            ctx?.addArc(center: CGPoint(x: viewCenter.x, y: viewCenter.y), radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: false)
            ctx?.fillPath()
            startAngle = endAngle
            
        }
        
    }
    
}

class RecordViewController: UIViewController {
    
    //結果出力用のラベル
    @IBOutlet weak var recordLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //成績を表示
        let record: String = String(AppDataController.currentCorrect)+" / " + String(AppDataController.count)+" 問"
        recordLabel.text = record
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        //成績グラフのレンダリング
        let pieChartView = PieChartView()
        pieChartView.frame = CGRect(x:0, y:100, width: view.frame.size.width, height: 200)
        
        //以下は現状は固定値となっているが書き換えの必要があるし
        //書き換え可能に実装を変更する必要がある
        var correctRate: CGFloat
        var incorrectRate: CGFloat
        
        //正解数が0だった場合にはDivision0で予期せぬエラーになるためif文追加
        if AppDataController.currentCorrect == 0 {
            correctRate = 0
            incorrectRate = 100
        } else {
            correctRate = CGFloat(AppDataController.currentCorrect / AppDataController.count * 100)
            incorrectRate = 100 - correctRate
        }
        
        pieChartView.segments = [
            Segment(color: UIColor.green, value: CGFloat(correctRate)),
            Segment(color: UIColor.lightGray, value: CGFloat(incorrectRate))
        ]
        view.addSubview(pieChartView)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func backHome(_ sender: Any) {
        
        //AppDataControllerの初期化を実行する
        AppDataController.resetAppDataController()
    }
    
    
}


