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

    public init(path: String, extensionOrFileName: String, index: Int){
        self.__path = path
        self.__extension = extensionOrFileName
        self.__index = index
    }

    public init(path: String, extensionOrFileName: String){
        self.__path = path
        self.__extension = String(extensionOrFileName[extensionOrFileName.range(of: ".")!.upperBound...])
        self.__index = Int(String(extensionOrFileName[..<extensionOrFileName.lastIndex(of: ".")!]))!
    }

    public func getPath() -> String{
        return self.__path
    }

    public func getIndex() -> Int{
        return self.__index
    }

    public func getExtension() -> String{
        return self.__extension
    }

    public func getFileName() -> String{
        return self.getFileName(thisPath: self.__path)
    }

    public func getFileName(thisPath : String, fileExtension : String) -> String{
        return self.getFileName(thisPath: thisPath, index: self.__index, fileExtension: fileExtension)
    }

    public func getFileNameWithExtension(fileExtension: String) -> String{
        return self.getFileName(thisPath: self.__path, fileExtension: fileExtension)
    }

    public func getFileName(thisPath: String, index: Int, fileExtension: String) -> String{
        let result = thisPath + "/" + String(format:"%04d", index) + "." + fileExtension
        return result
    }

    public func getFileName(thisPath: String, index: Int) -> String{
        return self.getFileName(thisPath: thisPath, index: index, fileExtension: self.__extension)
    }

    public func getFileName(thisPath: String) -> String{
        return self.getFileName(thisPath: thisPath, index: self.__index)
    }

    public func getRawFileName() -> String{
        let result = String(format: "%04d", self.__index) + "." + self.__extension
        return result
    }

    public func addToIndex(count: Int){
        self.__index += count
    }

    public func nextFileExists(thisPath: String, count: Int) -> Bool{
        let fileManager = FileManager.default
        return fileManager.fileExists(atPath: self.getFileName(thisPath: thisPath, index: self.__index + count))
    }

    public func nextFileExists(count: Int) -> Bool{
        return self.nextFileExists(thisPath: self.__path, count: count)
    }

    public func previousFileExists(thisPath: String, count: Int) -> Bool{
        let fileManager = FileManager.default
        return fileManager.fileExists(atPath: self.getFileName(thisPath: thisPath, index: self.__index - count))
    }

    public func previousFileExists(count: Int) -> Bool{
        return self.previousFileExists(thisPath: self.__path, count: count)
    }

}
