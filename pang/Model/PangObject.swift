//
//  PangObject.swift
//  pang
//
//  Created by 김종원 on 2020/11/16.
//

import Foundation

class PangObject: ObservableObject {
    private(set) var pangs: [Pang]
    
    private let saveKey: String = "Pangs"
    
    init() {
        let path: URL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let fileName: URL = path.appendingPathComponent(self.saveKey)
        if let data = try? Data(contentsOf: fileName) {
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([Pang].self, from: data) {
                self.pangs = decoded
                return
            } else { print("Can't decode data from bundle.") }
        } else { print("Can't load data from bundle.") }
        self.pangs = []
    }
    
    func loadData() -> [Pang] {
        let path: URL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let fileName: URL = path.appendingPathComponent(self.saveKey)
        guard let data = try? Data(contentsOf: fileName) else {
            print("Can't load data from bundle.")
            return []
        }
        let decoder = JSONDecoder()
        guard let decoded = try? decoder.decode([Pang].self, from: data) else {
            print("Can't decode data from bundle.")
            return []
        }
        return decoded
    }
    
    func saveData() {
        let path: URL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let fileName: URL = path.appendingPathComponent(self.saveKey)
        
        let encoder = JSONEncoder()
        guard let encoded = try? encoder.encode(self.pangs) else {
            print("\(self.pangs)")
            print("Can't encode data to bundle.")
            return
        }
        do {
            try encoded.write(to: fileName, options: [.atomicWrite, .completeFileProtection])
        } catch {
            print("Can't save data to bundle.")
        }
    }
    
    func add(_ pang: Pang) {
        objectWillChange.send()
        self.pangs.append(pang)
        self.saveData()
    }
    
    func removePangs() {
        objectWillChange.send()
        self.pangs.removeAll()
        self.saveData()
    }
    
    func removeCache() {
        let path: URL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let fileName: URL = path.appendingPathComponent(self.saveKey)
        
        objectWillChange.send()
        
        do {
            try FileManager.default.removeItem(at: fileName)
        } catch {
            print("Can't delete data from bundle.")
        }
        self.pangs.removeAll()
    }
}
