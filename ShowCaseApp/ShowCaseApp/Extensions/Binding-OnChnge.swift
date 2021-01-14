//
//  Binding-OnChnge.swift
//  ShowCaseApp
//
//  Created by Eugene Berezin on 11/2/20.
//

import SwiftUI

extension Binding {
    
    func onChange(_ handler: @escaping () -> Void) -> Binding<Value> {
        Binding(
            get: {self.wrappedValue},
            set: {newValue in
                self.wrappedValue = newValue
                handler()
            }
        )
    }
}

