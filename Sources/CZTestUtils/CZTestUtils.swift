import Foundation
import XCTest

public class CZTestUtils {
  public typealias WaitExpectation = () -> Void
  private enum Constant {
    static let waitExpectationDescription = "waitForInterval"
  }
  
  /// Returns tuple of`WaitExpectation` closure and XCTestExpectation.
  /// Call `expectation.fulfill()` to fulfill the expectation.
  ///
  /// - Parameters:
  ///   - interval: the internal of timeout
  ///   - testCase: the testCase which contains expectation
  /// - Returns: Tuple of`WaitExpectation` closure and XCTestExpectation.
  ///            Should call `WaitExpectation` closure to make`testCase` waiting before timeout of `interval`.
  public static func waitWithInterval(_ interval: TimeInterval,
                                      testCase: XCTestCase) -> (WaitExpectation, XCTestExpectation) {
    let expectation = XCTestExpectation(description: Constant.waitExpectationDescription)
    let waitExpectation: WaitExpectation = {
      testCase.wait(for: [expectation], timeout: interval)
    }
    return (waitExpectation, expectation)
  }
}
