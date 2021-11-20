

import UIKit
import FMDB
class BabassuLabelledBaseManager: NSObject {
    
    static let defaultManger = BabassuLabelledBaseManager()
    typealias successBlock = () ->Void
    typealias failBlock = () ->Void
    
    
    private var livelockName : String?
    
    
    lazy var fmdb : FMDatabase = {
        let path = NSHomeDirectory().appending("/Documents/testDB.db")
        let db = FMDatabase(path: path)
        return db
    }()
    
    
    func creatTable(livelockName : String) {
        fmdb.open()
        self.livelockName = livelockName
        let creatSql = "create table if not exists \(livelockName) (id integer primary key autoincrement,model BLOB)"
        let result = fmdb.executeUpdate(creatSql, withArgumentsIn: [])
        if result{
        }
    }
    
    
    func dropTable() -> Void {
        let sql = "drop table if exists " + livelockName!
        let result = fmdb.executeUpdate(sql, withArgumentsIn:[])
        if result{
        }
    }
    
    
    @available(iOS 11.0, *)
    func insert(model:NSObject,name:String, successBlock: successBlock, failBlock: failBlock) -> Void {
        print(NSHomeDirectory())
        
        let modelData = try! NSKeyedArchiver.archivedData(withRootObject: model, requiringSecureCoding: false)
        let insertSql = "insert into " + name + " (model) values(?)"
        
        do {
            try fmdb.executeUpdate(insertSql, values: [modelData])
            successBlock()
        } catch {
            print(fmdb.lastError())
            failBlock()
        }
    }
    
    
    
    @available(iOS 11.0, *)
    func update(model:NSObject,uid:Int32,name:String, successBlock: successBlock, failBlock: failBlock) -> Void {
        
        let modelData = try! NSKeyedArchiver.archivedData(withRootObject: model, requiringSecureCoding: false)
        
        
        let updateSql = "update " + name + " set model = ? where id = ?"
        
        do {
            try fmdb.executeUpdate(updateSql, values: [modelData, uid])
            successBlock()
        } catch {
            print(fmdb.lastError())
            failBlock()
        }
    }
    
    
    func delete(uid:Int32,name:String, successBlock: successBlock, failBlock: failBlock) -> Void {
        let deleteSql = "delete from " + name + " where id = ?"
        do {
            
            
            try fmdb.executeUpdate(deleteSql, values: [uid])
            successBlock()
        } catch {
            print(fmdb.lastError())
        }
    }
    
    
    @available(iOS 9.0, *)
    func selectAll(name:String) -> [NSObject] {
        var tmpArr = [NSObject]()
        let selectSql = "select * from " + name
        
        do {
            let rs = try fmdb.executeQuery(selectSql, values:nil)
            while rs.next() {
                var model = NSObject()
                let modelData  = rs.data(forColumn:"model")
                let id = rs.int(forColumn: "id")
                model = try! NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(modelData!) as! NSObject
                
                model.unmanagedFmdb = Int32(id)
                tmpArr.append(model)
            }
        } catch {
            print(fmdb.lastError())
        }
        return tmpArr
    }
    
    
    
}
private var wd_id_key: String = "key"

extension NSObject {
    open var unmanagedFmdb:Int32? {
        get {
            return (objc_getAssociatedObject(self, &wd_id_key) as? Int32)
        } set(newValue) {
            objc_setAssociatedObject(self, &wd_id_key, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_ASSIGN)
        }
    }
}

