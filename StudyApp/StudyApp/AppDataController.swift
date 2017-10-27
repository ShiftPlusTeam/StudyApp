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
    private init() {
    }
    
    //問題一覧
    static var results: List<Question>?
    //資格ID
    static var id: String = "資格ID"
    //資格名
    static var name: String = "資格名"
    //ジャンル
    static var genre: [String] = []
    //問題数(5 10 20 100)
    static var count: Int = 5
    //問題の種別(全問 未回答 不正解)
    static var kind: String = "全問"
    //ランダムか否か
    static var random: Bool = true
    //選択したAnswer
    static var selectAnswer: String = " "
    
    //現在の解いている問題数(現在何問目か)
    //0から始めること(インデックスに使うため)
    static var currentCount: Int = 0
    
    //所定の条件のもとで問題を作成する
    //各種フィールド値をセットしたら、このメソッドを実行する想定
    //てかこれを動かさず他のメソッドを動かすとやばい
    static func createQuestion() -> () {
        
        //RealmControllerQuestionのインスタンス生成
        let realmControllerQuestion = RealmControllerQuestion(id)
        
        if kind == "全問" {
            results = realmControllerQuestion.getRandomResult(count)
            
        } else if kind == "未回答" {
            results = realmControllerQuestion.getRandomResultNotDone(count)
            
        } else if kind == "未正解" {
            results = realmControllerQuestion.getRandomResultNotCorrect(count)
            
        } else {
            
        }
        
    }
    
    //現在の問題に該当する問題インスタンスを取得
    static func getCurrentQuestionData() -> (Question) {
        
        //現在の問題を取得する
        //強制的なアンラップ
        let result = results![currentCount]
        
        return result
    }
    
    
    //currentCountをインクリメント
    //問題が次に遷移するときなどに使う想定
    static func incrementCurrentCount() -> () {
        currentCount = currentCount + 1
    }
    
    
    //資格IDに対する正解数を取得するメソッド
    static func getCorrectCount() -> (Int) {
        
        //カウント数
        var count: Int = 0
        
        //RealmControllerQuestionのインスタンス作成
        let realmControllerQuestion = RealmControllerQuestion(id)
        let results = realmControllerQuestion.getResult()
        
        for result in results {
            
            if result.correct {
                count = count + 1
            } else {
                
            }
        }
        return count
    }
    
    
    //資格IDに対する不正解数を取得するメソッド
    static func getIncorrectCount() -> (Int) {
        
        //カウント数
        var count: Int = 0
        
        //RealmControllerQuestionのインスタンス作成
        let realmControllerQuestion = RealmControllerQuestion(id)
        let results = realmControllerQuestion.getResult()
        
        for result in results {
            
            if !(result.correct) {
                count = count + 1
            } else {
                
            }
        }
        return count
    }
    
}
