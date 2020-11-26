//
//  Pangs.swift
//  pang
//
//  Created by 김종원 on 2020/11/26.
//

import SwiftUI

struct Pangs {
    private(set) var zonePangs: [Pang]
    
    private let saveKey: String = "Pangs"
    
    init() {
        let path: URL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let fileName: URL = path.appendingPathComponent(self.saveKey)
        if let data = try? Data(contentsOf: fileName) {
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([Pang].self, from: data) {
                self.zonePangs = decoded
                return
            } else { print("Can't decode data from bundle.") }
        } else { print("Can't load data from bundle.") }
        self.zonePangs = []
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
        guard let encoded = try? encoder.encode(self.zonePangs) else {
            print("Can't encode data to bundle.")
            return
        }
        do {
            try encoded.write(to: fileName, options: [.atomicWrite, .completeFileProtection])
            print("\(self.zonePangs) encoded.")
        } catch {
            print("Can't save data to bundle.")
        }
    }
    
    mutating func add(_ pang: Pang) {
        self.zonePangs.append(pang)
        self.saveData()
    }
    
    mutating func removeCache() {
        let path: URL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let fileName: URL = path.appendingPathComponent(self.saveKey)
        
        do {
            try FileManager.default.removeItem(at: fileName)
            print("Delete data from bundle.")
        } catch {
            print("Can't delete data from bundle.")
        }
        self.zonePangs.removeAll()
    }
    
    static var example: Pangs {
            var example = Pangs()
            example.add(Pang(text: "Example0"))
            example.add(Pang(text: "Example1", images: [UIImage(imageLiteralResourceName: "sample-v")]))
            example.add(Pang(text: "Example2", images: [UIImage(imageLiteralResourceName: "sample-s")]))
            example.add(Pang(images: [UIImage(imageLiteralResourceName: "sample-h")]))
            example.add(Pang(text: "Example4", images: [
                                UIImage(imageLiteralResourceName: "sample-s"),
                                UIImage(imageLiteralResourceName: "sample-h")
            ]))
            return example
        }
}
