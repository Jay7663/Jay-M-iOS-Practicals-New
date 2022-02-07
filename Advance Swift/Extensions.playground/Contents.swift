import UIKit

extension String {
    
    func addCharAt(char: Character, index: Int) -> String {
        var string = [Character](String(self))
        string[index - 1] = char
        return String(string)
    }
    
    func replaceChar (replace: String, with: String) -> String {
        return self.replacingOccurrences(of: replace, with: with)
    }
    
    func removeWhiteSpaces() -> String {
        return self.replacingOccurrences(of: " ", with: "")
    }
    
    func countWords() -> Int {
        return self.components(separatedBy: " ").count
    }
    
}

var string = "Jay Mo dha wa di ya"
print("Adding Character D at 4th Position : \(string.addCharAt(char: "D", index: 4))")
print("Replacing WhiteSpace with Character D : \(string.replaceChar(replace: "D", with: " "))")
print("Removing all White Spaces from String : \(string.removeWhiteSpaces())")
print("Count number of Words from String : \(string.countWords())")
