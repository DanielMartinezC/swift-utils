import UIKit

extension String {
    
    func isCiValid() -> Bool{
        var ci = self
        if (ci.count < 7 || ci.count > 8) {
            return false
        }

        if (ci.count == 7) {
            ci = "0" + ci
        }
        
        let coef = [2, 9, 8, 7, 6, 3, 4]
        var acc = 0
        
        var i = 0
        while i < ci.count - 1 {
            if let ciCharAt = ci.character(at: i), let charAtInt = Int(String(ciCharAt)){
                let product = String(coef[i] * charAtInt)
                acc += Int(String(product.character(at: product.count-1)!)) ?? 0
                i += 1
            } else {
                return false
            }
        }
        
        var aux = 10
        while (aux - acc < 0) {
            aux += 10
        }
        
        if let charAt = ci.character(at: ci.count - 1){
            return aux - acc == Int(String(charAt))
        }
        
        return false
        
    }
    
    func isPhoneValid() -> Bool{
        if self.count > 3, let first3Int = Int(self.substring(to:self.index(self.startIndex, offsetBy: 3))) {
            if 091...099 ~= first3Int {
                return true
            }
        }
        
        return false
        
    }
    
    func containsOnlyLetters() -> Bool {
        let accents = ["á","é","í","ó","ú","Á","É","Í","Ó","Ú"]
        for chr in self {
            if (!(chr >= "a" && chr <= "z") && !(chr >= "A" && chr <= "Z") && !accents.contains(String(chr))) {
                return false
            }
        }
        
        return true
    }
}

extension StringProtocol {
    
    func index(at offset: Int, from start: Index? = nil) -> Index? {
        return index(start ?? startIndex, offsetBy: offset, limitedBy: endIndex)
    }
    
    func character(at offset: Int) -> Character? {
        //offset can't be negative
        if offset >= 0 {
            guard let index = index(at: offset) else { return nil }
            return self[index]
        }
        return nil
    }
}