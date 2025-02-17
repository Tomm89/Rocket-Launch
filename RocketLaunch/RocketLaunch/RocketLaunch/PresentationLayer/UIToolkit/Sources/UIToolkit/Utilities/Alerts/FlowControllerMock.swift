//
//  FlowControllerMock.swift
//  RocketLaunchTests
//
//  Created by Tomáš Brand on 19.11.2023.
//

public class FlowControllerMock<T: Flow & Equatable>: FlowController {
    
    public var handleFlowCount = 0
    public var handleFlowValue: T?
    
    override public func handleFlow(_ flow: Flow) {
        handleFlowCount += 1
        handleFlowValue = flow as? T
    }
}
