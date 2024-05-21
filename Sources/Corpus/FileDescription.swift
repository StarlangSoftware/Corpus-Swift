//
//  File.swift
//  
//
//  Created by Olcay Taner YILDIZ on 10.09.2020.
//

import Foundation

public class FileDescription{
    
    private var __path: String
    private var __extension: String
    private var __index: Int
    
    /// Another constructor for the FileDescription object. FileDescription object is used to store sentence or tree
    /// file names in a format of path/index.extension such as 'trees/0123.train' or 'sentences/0002.test'. At most 10000
    /// file names can be stored for an extension.
    /// - Parameters:
    ///   - path: Path of the file
    ///   - fileExtension: Extension of the file such as train, test, dev etc.
    ///   - index: Index of the file, should be larger than or equal to 0 and less than 10000. 123, 0, 9999, etc.
    public init(path: String, fileExtension: String, index: Int){
        self.__path = path
        self.__extension = fileExtension
        self.__index = index
    }
    
    /// Constructor for the FileDescription object. FileDescription object is used to store sentence or tree file names
    /// in a format of path/index.extension such as 'trees/0123.train' or 'sentences/0002.test'. At most 10000 file names
    /// can be stored for an extension.
    /// - Parameters:
    ///   - path: Path of the file
    ///   - fileName: Raw file name of the string without path name, including the index of the file and the
    ///                    extension. For example 0023.train, 3456.test, 0125.dev, 0000.train etc.
    public init(path: String, fileName: String){
        self.__path = path
        self.__extension = String(fileName[fileName.range(of: ".")!.upperBound...])
        self.__index = Int(String(fileName[..<fileName.lastIndex(of: ".")!]))!
    }
    
    /// Accessor for the path attribute.
    /// - Returns: Path
    public func getPath() -> String{
        return self.__path
    }
    
    /// Accessor for the index attribute.
    /// - Returns: Index
    public func getIndex() -> Int{
        return self.__index
    }
    
    /// Accessor for the extension attribute.
    /// - Returns: Extension
    public func getExtension() -> String{
        return self.__extension
    }
    
    /// Returns the filename with the original path, such as trees/1234.train
    /// - Returns: The filename with the original path
    public func getFileName() -> String{
        return self.getFileName(thisPath: self.__path)
    }
    
    /// Returns the filename with path and extensions are replaced with the given path and extension.
    /// - Parameters:
    ///   - thisPath: New path
    ///   - fileExtension: New extension
    /// - Returns: The filename with path and extensions are replaced with the given path and extension.
    public func getFileName(thisPath : String, fileExtension : String) -> String{
        return self.getFileName(thisPath: thisPath, index: self.__index, fileExtension: fileExtension)
    }
    
    /// Returns the filename with extension replaced with the given extension.
    /// - Parameter fileExtension: New extension
    /// - Returns: The filename with extension replaced with the given extension.
    public func getFileNameWithExtension(fileExtension: String) -> String{
        return self.getFileName(thisPath: self.__path, fileExtension: fileExtension)
    }
    
    /// Returns the filename with path, index, and extension are replaced with the given path, index, and extension.
    /// - Parameters:
    ///   - thisPath: New path
    ///   - index: New Index
    ///   - fileExtension: New extension
    /// - Returns: The filename with path, index, and extension are replaced with the given path, index, and extension.
    public func getFileName(thisPath: String, index: Int, fileExtension: String) -> String{
        let result = thisPath + "/" + String(format:"%04d", index) + "." + fileExtension
        return result
    }
    
    /// Returns the filename with path and index are replaced with the given path and index.
    /// - Parameters:
    ///   - thisPath: New path
    ///   - index: New Index
    /// - Returns: The filename with path and index are replaced with the given path and index.
    public func getFileName(thisPath: String, index: Int) -> String{
        return self.getFileName(thisPath: thisPath, index: index, fileExtension: self.__extension)
    }
    
    /// Returns the filename with path replaced with the given path
    /// - Parameter thisPath: New path
    /// - Returns: The filename with path replaced with the given path
    public func getFileName(thisPath: String) -> String{
        return self.getFileName(thisPath: thisPath, index: self.__index)
    }
    
    /// Returns only the filename without path as 'index.extension'.
    /// - Returns: File name without path as 'index.extension'.
    public func getRawFileName() -> String{
        let result = String(format: "%04d", self.__index) + "." + self.__extension
        return result
    }
    
    /// Increments index by count
    /// - Parameter count: Count to be incremented
    public func addToIndex(count: Int){
        self.__index += count
    }
    
    /// Checks if the next file (found by changing the path and adding count to the index) exists or not. Returns true
    /// if it exists, false otherwise.
    /// - Parameters:
    ///   - thisPath: New path
    ///   - count: Count to be incremented.
    /// - Returns: Returns true, if the next file (found by changing the path and adding count to the index) exists,
    /// false otherwise.
    public func nextFileExists(thisPath: String, count: Int) -> Bool{
        let fileManager = FileManager.default
        return fileManager.fileExists(atPath: self.getFileName(thisPath: thisPath, index: self.__index + count))
    }
    
    /// Checks if the next file (found by adding count to the index) exists or not. Returns true  if it exists, false
    /// otherwise.
    /// - Parameter count: Count to be incremented.
    /// - Returns: Returns true, if the next file (found by adding count to the index) exists, false otherwise.
    public func nextFileExists(count: Int) -> Bool{
        return self.nextFileExists(thisPath: self.__path, count: count)
    }
    
    /// Checks if the previous file (found by changing the path and subtracting count from the index) exists or not.
    /// Returns true  if it exists, false otherwise.
    /// - Parameters:
    ///   - thisPath: New path
    ///   - count: Count to be decremented.
    /// - Returns: Returns true, if the previous file (found by changing the path and subtracting count to the index)
    /// exists, false otherwise.
    public func previousFileExists(thisPath: String, count: Int) -> Bool{
        let fileManager = FileManager.default
        return fileManager.fileExists(atPath: self.getFileName(thisPath: thisPath, index: self.__index - count))
    }
    
    /// Checks if the previous file (found by subtracting count from the index) exists or not.
    /// Returns true  if it exists, false otherwise.
    /// - Parameter count: Count to be decremented.
    /// - Returns: Returns true, if the previous file (found by subtracting count to the index) exists, false otherwise.
    public func previousFileExists(count: Int) -> Bool{
        return self.previousFileExists(thisPath: self.__path, count: count)
    }

}
