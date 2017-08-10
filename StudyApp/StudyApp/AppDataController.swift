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
    
    
    // Propties
    //フィールド値を隠蔽
    
    static let shared = AppDataController()
    
    // イニシャライザ
    private init() {
        
    }
    
    // 資格名
    // ex) CCNA LPIC
    private var name: String = "資格名"
    
    public func setName(a: String) {
        name = a
    }
    
    public func getName() -> (String) {
        return name
    }
    
    
    // ジャンル
    // ex) Network Database
    private var genre: [String] = []
    
    public func setGenre(a: [String]) {
        genre = a
    }
    
    public func getGenre() -> ([String]) {
        return genre
    }
    
    
    // 問題数
    // ex) 5 10 All
    private var count: String = "5"
    
    public func setCount(a: String) {
        count = a
    }
    
    public func getCount() -> (String) {
        return count
    }
    
    
    // 問題の種別
    // 全問 未回答 不正解
    private var kind: String = "全問"
    
    public func setKind(a: String) {
        kind = a
    }
    
    public func getKind() -> (String) {
        return kind
    }
    
    // 現在の解いている問題数
    // 1 2 3
    private var currentCount: Int = 0
    
    public func setCurrentCount(a: Int) {
        currentCount = a
    }
    
    //現在何問目か取得
    public func setCurrentCount() -> (Int) {
        return currentCount
    }
    
    
    
    // Method
    
    //QuestionDataのインスタンスを生成するメソッド
    //引数で指定した数のインスタンスを生成
    public func createQuestionDataInstance(count: Int) -> () {
        var questionData: [QuestionData] = []
        
        var i: Int = 0
        
        while i > count {
            i = i + 1
            questionData.append(QuestionData())
        }
        i=0
        
    }
    
    //currentCountをインクリメント
    public func incrementCurrentCount() -> () {
        currentCount = currentCount + 1
    }
    
    
    //正解数と不正解数を返却するメソッド
    public func getCorrectCount() -> () {
        
    }
    
    
    
    
    
    
}
