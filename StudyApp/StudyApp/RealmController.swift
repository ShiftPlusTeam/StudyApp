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
    dynamic var id :Int16 = 0
    dynamic var name :String = ""
    dynamic var rate :Int8 = 0
    dynamic var purshase :Bool = false
    
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
    
    dynamic var no :Int8 = 0
    dynamic var licenseId :Int8 = 0
    dynamic var genre :String = ""
    dynamic var problem :String = ""
    dynamic var comment :String = ""
    dynamic var optionA :String = ""
    dynamic var optionB :String = ""
    dynamic var optionC :String = ""
    dynamic var optionD :String = ""
    dynamic var answer :String = ""
    dynamic var correct :Bool = false
    dynamic var done :Bool = false
    
    //回答が正解かどうかを返すメソッド
    func getAnswes(_ selectedOption :String) -> Bool {
        if selectedOption == answer {
            return true
        } else {
            return false
        }
    }
    
}




//  Realmデータベースの資格テーブルを直接操作するクラス
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
        
        myLisence.name = licenseName
        myLisence.id = (result.last?.id)! + 1
        myLisence.rate = 0
        myLisence.purshase = false
        
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

//  Realmデータベースの問題テーブルを直接操作するクラス
class RealmControllerQuestion{
    let realm = try! Realm()
    let result :Results<Question>
    
    //RealmControllerQuestionのイニシャライザ　引数は資格ID
    init(_ licenseId :String) {
        result = try! Realm().objects(Question.self).filter("lisenceId = \(licenseId)").sorted(byKeyPath: "no")
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
        let searchResult = getRandomResult("done = false", number)
        return searchResult
    }
    
    //未正解問題を指定された個数ランダムで返す
    func getRandomResultNotCorrect(_ number :Int) -> List<Question>{
        let searchResult = getRandomResult("correct = false", number)
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
    
    //問題番号と回答を引数にし、回答後、正解したかどうかを返す
    func answer(_ questionNo :Int8 , _ selectOption :String) -> String{
        let taegetQuestion = result.filter("No = \(questionNo)").first
        let answerResult = taegetQuestion?.getAnswes(selectOption)
        if answerResult == false {
            taegetQuestion?.done = true
            return "QuestuonNo:\(String(describing: taegetQuestion?.no)) Done:true Correct:false"
        } else {
            taegetQuestion?.done = true
            taegetQuestion?.correct = true
            return "QuestuonNo:\(String(describing: taegetQuestion?.no)) Done:true Correct:true"
        }
    }
    
    //※データベースのオブジェクト群を加工するメソッドはこちらで提供する
    
    //CSVの１センテンスをパーズしてDBにレコードをインサートする
    func addQestion(_ newQesCsvSent :String) {
        let myQes = Question()
        let ally = newQesCsvSent.components(separatedBy: ",")
        
        //ダウンキャストがうまくいかないとエラーが起こるので、場合分け必須
        myQes.no = ally[0] as! Int8
        myQes.licenseId = ally[1] as! Int8
        myQes.genre = ally[2]
        myQes.problem = ally[3]
        myQes.comment = ally[4]
        myQes.optionA = ally[5]
        myQes.optionB = ally[6]
        myQes.optionC = ally[7]
        myQes.optionD = ally[8]
        myQes.answer = ally[9]
        myQes.correct = false
        myQes.done = false
        try! realm.write {
            realm.add(myQes)
        }
    }
<<<<<<< HEAD
=======
    
    
    func csvToArray () {
        //csvのファイルパスを取得
        if let csvPath = Bundle.main.path(forResource: "question", ofType: "csv") {
            do {
                //csvのファイルのデータを所得
                let csvStr = try String(contentsOfFile:csvPath, encoding:String.Encoding.utf8)
                //csvファイルを改行区切りで配列に格納
                let csvArr = csvStr.components(separatedBy: .newlines)
                print(csvArr)
            } catch let error as NSError {
                print(error.localizedDescription)
            }
        }
    }
    
    
    
    func addQuestion(_ csvArr :String) {
        let question = Question()
        let ally = csvArr.components(separatedBy: ",")
        
        //ダウンキャストがうまくいかないとエラーが起こるので、場合分け必須
        question.no = ally[0] as! Int8
        question.licenseId = ally[1] as! Int8
        question.genre = ally[2]
        question.problem = ally[3]
        question.comment = ally[4]
        question.optionA = ally[5]
        question.optionB = ally[6]
        question.optionC = ally[7]
        question.optionD = ally[8]
        question.answer = ally[9]
        question.correct = false
        question.done = false
        try! realm.write {
            realm.add(question)
        }
    }
>>>>>>> fb53405f8591fb41130f24f92c07f34bebf80a51
}
