//
//  DashbordPresenterTests.swift
//  IlJournalieriOSTests
//
//  Created by Aleksandra Vasileva on 08.11.2023.
//

@testable import IlJournalieriOS
import Quick
import Nimble
import Foundation
import XCTest
@testable import IlJournalieriOS



class DashbordPresenterTests: QuickSpec {
    override func spec() {
        describe("Presenter") {
           
            
            context(""){
                let moreMessageService = IMoreMessageServiceMock()
                let presenter = DashboardPresenter(moreMessageService: moreMessageService)
                let delegate = IDashboardPresenterDelegateMock()
                presenter.delegate = delegate
                presenter.addMoreMessage(nil)
                
                it(""){
                    expect(delegate.showAlertCalled) == true
                    
                }
            }
            
            context(""){
                let moreMessageService = IMoreMessageServiceMock()
                let presenter = DashboardPresenter(moreMessageService: moreMessageService)
                let delegate = IDashboardPresenterDelegateMock()
                presenter.delegate = delegate
                presenter.addMoreMessage("hello")
                it (""){
                    expect(delegate.showAlertCalled) == false
                    expect(delegate.clearMoreMessageInputCalled) == true
                }
            }
                
         
                }
            }
        }
    

