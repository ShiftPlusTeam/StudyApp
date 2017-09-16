//
//  RealmController.swift
//  testRealm
//
//  Created by 正之 on 2017/09/01.
//  Copyright © 2017年 kasa. All rights reserved.
//

import Foundation
import RealmSwift

class License: Object  {
    //資格一覧DB   
    //Id:資格ID
    //Name:資格名
    //Rate:正答率
    //Purshase:購入済みであるかどうか
    dynamic var Id :Int16 = 0
    dynamic var Name :String = ""
    dynamic var Rate :Int8 = 0
    dynamic var Purshase :Bool = false
    
}

class Question :Object{
    //問題一覧
    //No:問題番号
    //LicenseId:資格ID
    //Genre:ジャンル
    //Problem:問題文
    //Comment:解説文
    //OptionA:選択肢
    //OptionB:選択肢
    //OptionC:選択肢
    //OptionD:選択肢
    //Answer:正解の選択肢
    //Correct:過去に正解したかどうか
    //Done:過去に回答したかどうか

    dynamic var No :Int8 = 0
    dynamic var LicenseId :Int8 = 0
    dynamic var Genre :String = ""
    dynamic var Problem :String = ""
    dynamic var Comment :String = ""
    dynamic var OptionA :String = ""
    dynamic var OptionB :String = ""
    dynamic var OptionC :String = ""
    dynamic var OptionD :String = ""
    dynamic var Answer :String = ""
    dynamic var Correct :Bool = false
    dynamic var Done :Bool = false
    
}

class RealmControllerLicense{
    
    let realm = try! Realm()
    let result = try! Realm().objects(License.self).sorted(byKeyPath: "Id")
    
    //全資格を返す
    func getResult() -> List<License>{
        return List<License>(result)
    }
    
    //条件に合致した資格を返す
    func getResult(_ query :String) -> List<License> {
        let searchResult = try! Realm().objects(License.self).filter(query)
        return List<License>(searchResult)
    }
    
    //レコード追加
    func addLicense(_ licenseName :String) {
        let myLisence = License()
        
        myLisence.Name = licenseName
        myLisence.Id = (result.last?.Id)! + 1
        myLisence.Rate = 0
        myLisence.Purshase = false
        
        try! realm.write {
            realm.add(myLisence)
        }
    }
    
    //レコードの全削除
    func allDelete(){
        try! realm.write {
            realm.delete(result)
        }
    }
}

class RealmControllerQuestion{
    let realm = try! Realm()
    let result :Results<Question>
    
    //RealmControllerQuestionのイニシャライザ　引数は資格ID
    init(_ LicenseId :String) {
        result = try! Realm().objects(Question.self).filter("LisenceId = \(LicenseId)").sorted(byKeyPath: "No")
    }

    //全問題をリスト型で返す
    func getResult() -> List<Question> {
        return List<Question>(result)
    }
    
    //条件に合致した問題をリスト型で返す
    func getResult(_ query :String) -> List<Question> {
        let searchResult = result.filter(query)
        return List<Question>(searchResult)
    }
    
    //未回答問題を指定された個数ランダムで返す
    func getRandomResultNotDone(_ number :Int) -> List<Question> {
        let searchResult = getRandomResult("Done = false", number)
        return searchResult
    }
    
    //未正解問題を指定された個数ランダムで返す
    func getRandomResultNotCorrect(_ number :Int) -> List<Question>{
        let searchResult = getRandomResult("Correct = false", number)
        return searchResult
    }
 
    //全問題から指定した個数分ランダムソートで返す
    func getRandomResult(_ number :Int) -> List<Question> {
        let searchResult = result
        let randomResult = List<Question>()
        let count = searchResult.count - 1
        var numbList :[Int] = []
        
        //0~resultCount-1までの数値の配列を作る
        for i in 0..<(count){
            numbList.append(i)
        }
        
        //numblistをランダムに並べ替え
        for i in 0..<(count) {
            let ranI = Int(arc4random_uniform(UInt32(count - i)) + UInt32(i))
            if i != ranI {
                swap(&numbList[i] , &numbList[ranI])
            }
        }
        
        //randomResultにsearchResultを書き写す(countを超えた場合はそこまで返す)
        for i in 0..<(number) {
            if i > count {
                break
            }
            randomResult.append(searchResult[numbList[i]])
        }
        
        return randomResult
    }
    
    //条件に合致した全問題を指定した個数分ランダムソートで返す
    func getRandomResult(_ query :String , _ number :Int) -> List<Question> {
        let searchResult = result.filter(query)
        let randomResult = List<Question>()
        let count = searchResult.count - 1
        var numbList :[Int] = []
        
        //0~resultCount-1までの数値の配列を作る
        for i in 0..<(count){
            numbList.append(i)
        }
        
        //numblistをランダムに並べ替え
        for i in 0..<(count) {
            let ranI = Int(arc4random_uniform(UInt32(count - i)) + UInt32(i))
            if i != ranI {
                swap(&numbList[i] , &numbList[ranI])
            }
        }
        
        //randomResultにsearchResultを書き写す(countを超えた場合はそこまで返す)
        for i in 0..<(number) {
            if i > count {
                break
            }
            randomResult.append(searchResult[numbList[i]])
        }
        
        return randomResult
    }
    
    //※データベースのオブジェクト群を加工するメソッドはこちらで提供する
    
    func addQestion(_ newQesCsvSent :String) {
        let myQes = Question()
        let ally = newQesCsvSent.components(separatedBy: ",")
        
        //ダウンキャストがうまくいかないとエラーが起こるので、場合分け必須
        myQes.No = ally[0] as! Int8
        myQes.LicenseId = ally[1] as! Int8
        myQes.Genre = ally[2]
        myQes.Problem = ally[3]
        myQes.Comment = ally[4]
        myQes.OptionA = ally[5]
        myQes.OptionB = ally[6]
        myQes.OptionC = ally[7]
        myQes.OptionD = ally[8]
        myQes.Answer = ally[9]
        myQes.Correct = false
        myQes.Done = false
        try! realm.write {
            realm.add(myQes)
        }
    }
}
