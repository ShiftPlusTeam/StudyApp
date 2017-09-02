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

class QesList :Object{
    //問題一覧
    //No:問題番号
    //Genre:ジャンル
    //Problem:問題文
    //Comment:?
    //Option1:選択肢
    //Option2:選択肢
    //Option3:選択肢
    //Option4:選択肢
    //Answer:正解
    //Correct:?

    //
    dynamic var No :Int8 = 0
    dynamic var Genre :String = ""
    dynamic var Problem :String = ""
    dynamic var Comment :String = ""
    dynamic var Option1 :String = ""
    dynamic var Option2 :String = ""
    dynamic var Option3 :String = ""
    dynamic var Option4 :String = ""
    dynamic var Answer :String = ""
    dynamic var Correct :Bool = false
    dynamic var Answered :Bool = false
    
}

class RealmControllerLisence{
    
    let realm = try! Realm()
    let result = try! Realm().objects(License.self).sorted(byKeyPath: "Id")
    
    func getResult() -> Results<License>{
        return result
    }
    
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
    
    func allDelete(){
        try! realm.write {
            realm.delete(result)
        }
    }
}

class RealmControllerQestion{
    let realm = try! Realm()
    let result = try! Realm().objects(QesList.self).sorted(byKeyPath: "No")

    func getResult() -> Results<QesList> {
        return result
    }
    
    func getResult(_ query :String) -> Results<QesList> {
        let queryResult = try! Realm().objects(QesList.self).filter(query)
        return queryResult
    }
    
    func addQestion(_ newQesCsvSent :String) {
        let myQes = QesList()
        let ally = newQesCsvSent.components(separatedBy: ",")
        
        //ダウンキャストがうまくいかないとエラーが起こるので、場合分け必須
        myQes.No = ally[0] as! Int8
        myQes.Genre = ally[1]
        myQes.Problem = ally[2]
        myQes.Comment = ally[3]
        myQes.Option1 = ally[4]
        myQes.Option2 = ally[5]
        myQes.Option3 = ally[6]
        myQes.Option4 = ally[7]
        myQes.Answer = ally[8]
        myQes.Correct = ally[9] as! Bool
        myQes.Answered = ally[10] as! Bool
        
        try! realm.write {
            realm.add(myQes)
        }
    }
}
