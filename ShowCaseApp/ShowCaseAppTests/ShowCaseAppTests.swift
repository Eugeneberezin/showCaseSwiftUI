//
//  ShowCaseAppTests.swift
//  ShowCaseAppTests
//
//  Created by Eugene Berezin on 1/13/21.
//

import CoreData
import XCTest
@testable import ShowCaseApp


class BaseTestCase: XCTestCase {
    var dataController: DataController!
    var managedObjectContext: NSManagedObjectContext!

    override func setUpWithError() throws {
        dataController = DataController(inMemory: true)
        managedObjectContext = dataController.container.viewContext
    }
    
}
