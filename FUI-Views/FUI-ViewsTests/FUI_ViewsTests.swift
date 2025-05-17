//
//  FUI_ViewsTests.swift
//  FUI-ViewsTests
//
//  Created by IVAN CAMPOS on 6/15/24.
//

import Testing
@testable import FUI_Views

struct FUI_ViewsTests {

    @Test func testExample() async throws {
        // Write your test here and use APIs like `#expect(...)` to check expected conditions.
    }

    @Test func testFutureScapeReturnsSubstitutions() async throws {
        let result = futureScape("ab7")
        #expect(result.contains("\u{00DF}"))
        #expect(result.contains("\u{E002}"))
        #expect(result == "A\u{00DF}\u{E002}")
    }

}
