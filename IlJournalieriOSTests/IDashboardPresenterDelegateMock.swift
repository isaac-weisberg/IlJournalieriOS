//
//  IDashboardPresenterDelegateMock.swift
//  IlJournalieriOSTests
//
//  Created by Aleksandra Vasileva on 07.11.2023.
//

import Foundation
@testable import IlJournalieriOS

class DashboardPresenterDelegateMock: IDashboardPresenterDelegate {

    var clearMoreMessageInputCallsCount = 0
    var clearMoreMessageInputCalled: Bool {
        return clearMoreMessageInputCallsCount > 0
    }
    var clearMoreMessageInputClosure: (() -> Void)?

    func clearMoreMessageInput() {
        clearMoreMessageInputCallsCount += 1
        clearMoreMessageInputClosure?()
    }

    var showAlertCallsCount = 0
    var showAlertCalled: Bool {
        return showAlertCallsCount > 0
    }
    var showAlertReceivedMsg: (String)?
    var showAlertReceivedInvocations: [(String)] = []
    var showAlertClosure: ((String) -> Void)?

    func showAlert(_ msg: String) {
        showAlertCallsCount += 1
        showAlertReceivedMsg = msg
        showAlertReceivedInvocations.append(msg)
        showAlertClosure?(msg)
    }

}
