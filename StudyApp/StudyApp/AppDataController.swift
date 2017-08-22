//
//  AppDataController.swift
//  StudyApp
//
//  Created by Sasakura Hirofumi on 2017/08/07.
//  Copyright © 2017年 ShiftPlus+. All rights reserved.
//

import Foundation

//各画面で必要となるデータを扱うクラス


class  AppDataController {
    
    //Singleton
    static let sharedInstance = AppDataController()
    
    //イニシャライザ
    init() {
        
    }
    
    //問題
    var questionData: [QuestionData] = []
    
    //資格名
    //ex) CCNA LPIC
    private var name: String = "資格名"
    
    //setter
    public func setName(a: String) {
        name = a
    }
    
    //getter
    public func getName() -> (String) {
        return name
    }
    
    
    //ジャンル
    //ex) Network Database
    private var genre: [String] = []
    
    //setter
    public func setGenre(a: [String]) {
        genre = a
    }
    
    //getter
    public func getGenre() -> ([String]) {
        return genre
    }
    
    
    //問題数
    //ex) 5 10 All
    private var count: String = "5"
    
    //setter
    public func setCount(a: String) {
        count = a
    }
    
    //getter
    public func getCount() -> (String) {
        return count
    }
    
    
    //問題の種別
    //全問 未回答 不正解
    private var kind: String = "全問"
    
    //setter
    public func setKind(a: String) {
        kind = a
    }
    
    //getter
    public func getKind() -> (String) {
        return kind
    }
    
    //現在の解いている問題数
    //0から始めること(配列のインデックスに用いるため)
    //0 1 2
    private var currentCount: Int = 0
    
    //setter
    public func setCurrentCount(a: Int) {
        currentCount = a
    }
    
    //getter
    //現在何問目か取得
    public func getCurrentCount() -> (Int) {
        return currentCount
    }
    
    
    
    // Method
    
    //QuestionDataのインスタンスを生成するメソッド
    //引数で指定した数のインスタンスを生成
    public func createQuestionDataInstance(count: Int) -> () {
        var i: Int = 0
        
        while i > count {
            i = i + 1
            questionData.append(QuestionData())
        }
    }
    
    //QuestionDataのインスタンスに値をセットするメソッド
    //全インスタンスに対して乱数の問題番号の問題をセットする
    public func setQuestionDataInstance() -> () {
        //ここは現状実装不可
        
        for question in questionData {
            
            //ここの処理はrealmの実装待ち
            //realmの値をQuestionDataのインスタンスに入れる必要あり？？
        }
    }
    
    //現在の問題数に対応するQuestionDataのインスタンスを取得するメソッド
    public func getCurrentQuestionData() -> (QuestionData) {
        let question: QuestionData = questionData[currentCount]
        
        return question
    }
    
    
    //currentCountをインクリメント
    public func incrementCurrentCount() -> () {
        currentCount = currentCount + 1
    }
    
    
    //正解数を取得するメソッド
    public func getCorrectCount() -> (Int) {
        
        //カウント数
        var count: Int = 0
        
        for question in questionData {
            
            if question.isCorrect() {
                count = count + 1
            } else {
                
            }
        }
        return count
    }
    
    
    //不正解数を取得するメソッド
    public func getIncorrectCount() -> (Int) {
        
        //カウント数
        var count: Int = 0
        
        for question in questionData {
            
            if !(question.isCorrect()) {
                count = count + 1
            } else {
                
            }
        }
        return count
    }
    
    
    
    
    
}
