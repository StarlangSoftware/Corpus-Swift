//
//  File.swift
//  
//
//  Created by Olcay Taner YILDIZ on 12.09.2020.
//

import Foundation
import Dictionary

public class TurkishSplitter : SentenceSplitter{
    
    public override func shortCuts() -> [String]{
        return ["alb", "bnb", "bkz", "bşk", "co", "dr", "dç", "der", "em", "gn",
               "hz", "kd", "kur", "kuv", "ltd", "md", "mr", "mö", "muh", "müh",
               "no", "öğr", "op", "opr", "org", "sf", "tuğ", "uzm", "vb", "vd",
               "yön", "yrb", "yrd", "üniv", "fak", "prof", "dz", "yd", "krm", "gen",
               "pte", "p", "av", "II", "III", "IV", "VI", "VII", "VIII", "IX",
               "X", "XI", "XII", "XIII", "XIV", "XV", "XVI", "XVII", "XVIII", "XIX",
               "XX", "tuğa", "plt", "tğm", "tic", "srv", "bl", "dipl", "not", "min",
               "cul", "san", "rzv", "or", "kor", "tüm", "st", "sn", "fr", "pl",
               "ka", "tk", "ko", "vs", "yard", "bknz", "doç", "gör", "müz", "oyn",
               "m", "s", "kr", "ms", "hv", "uz", "re", "ph", "mc", "ed",
               "km", "yb", "bk", "jr", "bn", "os", "mrs", "bld", "sen", "alm",
               "sir", "ord", "dir", "yay", "man", "brm", "edt", "dec", "mah", "cad",
               "vol", "kom", "sok", "apt", "elk", "mad", "ort", "cap", "ste", "exc",
               "ef"]
    }
    
    public override func lowerCaseLetters() -> String{
        return TurkishLanguage.LOWERCASE_LETTERS
    }
    
    public override func upperCaseLetters() -> String{
        return TurkishLanguage.UPPERCASE_LETTERS
    }

}
