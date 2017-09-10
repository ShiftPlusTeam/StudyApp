//
//  AppDataController.swift
//  StudyApp
//
//  Created by Sasakura Hirofumi on 2017/08/07.
//  Copyright © 2017年 ShiftPlus+. All rights reserved.
//

import Foundation
import RealmSwift



//各画面で必要となるデータを扱うクラス
class AppDataController {
    
    //イニシャライザ
    init() {
        
    }
    
    //問題一覧
    var results: List<Question>?
    
    //資格ID
    public var name: String = "資格ID"
    
    //ジャンル
    public var genre: [String] = []
    
    //問題数(5 10 20 100)
    public var count: Int = 5
    
    //問題の種別(全問 未回答 不正解)
    public var kind: String = "全問"
    
    //ランダムか否か
    public var random: Bool = true
    
    //現在の解いている問題数(現在何問目か)
    //0から始めること(インデックスに使うため)
    public var currentCount: Int = 0
    
    
    
    //所定の条件のもとで問題を作成する
    //各種フィールド値をセットしたら、このメソッドを実行する想定
    //てかこれを動かさず他のメソッドを動かすとやばい
    public func createQuestion() -> () {
        
        //RealmControllerQuestionのインスタンス生成
        //とりあえずの実装なので改修予定 20170911
        let realmControllerQuestion = RealmControllerQuestion(name)
        results = realmControllerQuestion.getRandomResult(count)
        
    }
    
    //現在の問題に該当する問題インスタンスを取得
    public func getCurrentQuestionData() -> (Question) {
        
        //現在の問題を取得する
        //強制的なアンラップ
        let result = results![currentCount]
        
        return result
    }
    
    
    //currentCountをインクリメント
    //問題が次に遷移するときなどに使う想定
    public func incrementCurrentCount() -> () {
        currentCount = currentCount + 1
    }
    
    
    //資格IDに対する正解数を取得するメソッド
    public func getCorrectCount() -> (Int) {
        
        //カウント数
        var count: Int = 0
        
        //RealmControllerQuestionのインスタンス作成
        let realmControllerQuestion = RealmControllerQuestion(name)
        let results = realmControllerQuestion.getResult()
        
        for result in results {
            
            if result.Correct {
                count = count + 1
            } else {
                
            }
        }
        return count
    }
    
    
    //資格IDに対する不正解数を取得するメソッド
    public func getIncorrectCount() -> (Int) {
        
        //カウント数
        var count: Int = 0
        
        //RealmControllerQuestionのインスタンス作成
        let realmControllerQuestion = RealmControllerQuestion(name)
        let results = realmControllerQuestion.getResult()
        
        for result in results {
            
            if !(result.Correct) {
                count = count + 1
            } else {
                
            }
        }
        return count
    }
    
}
