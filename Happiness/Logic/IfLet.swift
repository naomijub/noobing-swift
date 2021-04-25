//
//  IfLet.swift
//  Happiness
//
//  Created by Julia Naomi Boeira on 24/04/21.
//

import Foundation

func ifLets<T, S>(t: T?, s: S?) -> (T, S)? {
    if let a = t {
        if let b = s {
           return (a, b)
        }
        return nil
    }
    return nil
}

func ifLets<T, S, U>(t: T?, s: S?, u: U?) -> (T, S, U)? {
    if let a = t {
        if let b = s {
            if let c = u {
                    return (a, b, c)
            }
            return nil
        }
        return nil
    }
    return nil
}
