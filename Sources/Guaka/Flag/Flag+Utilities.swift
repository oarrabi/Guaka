//
//  Flag+Utilities.swift
//  Guaka
//
//  Created by Omar Abdelhafith on 12/11/2016.
//
//

extension Flag {

  /// Converts the value from string to the internal flag value type
  /// Throws exception if cannot convert
  func convertValueToInnerType(value: String) throws -> FlagValue {
    do {
      return try self.type.fromString(flagValue: value)
    } catch let e as FlagValueError {
      throw CommandError.incorrectFlagValue(self.longName, e.error)
    }
  }

  func checkFlagLongName() throws {
    if longName.characters.contains("-") ||
      longName.characters.contains(" ") ||
      longName.characters.contains("/") ||
      longName.characters.contains("\\") ||
      longName.characters.count == 0 {
      throw CommandError.wrongFlagLongName(longName)
    }
  }

  func checkFlagShortName() throws {
    guard let shortName = shortName else {
      return
    }
    
    if shortName.characters.contains("-") ||
      shortName.characters.contains(" ") ||
      shortName.characters.contains("/") ||
      shortName.characters.contains("\\") ||
      shortName.characters.count == 0 ||
      shortName.characters.count > 1 {
      throw CommandError.wrongFlagShortName(shortName)
    }
  }
  
}

