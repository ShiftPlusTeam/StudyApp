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
    public private(set) var genre: [String] = []
    
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
    
    
    
    // Method
    
    
    
    
    
}
