//
//  Registration.swift
//  AFNetworking
//
//  Created by ben3 on 20/07/2020.
//

import Foundation
 
@objc public class MessageCellRegistration: NSObject {
    
    let _messageType: String
    let _incomingNib: UINib
    let _outgoingNib: UINib
    let _incomingContentClass: NSObject.Type
    let _outgoingContentClass: NSObject.Type
        
    @objc public init(messageType: String, incomingNib: UINib, outgoingNib: UINib, incomingContentClass: NSObject.Type, outgoingContentClass: NSObject.Type) {
        _messageType = messageType
        _incomingNib = incomingNib
        _outgoingNib = outgoingNib
        _incomingContentClass = incomingContentClass
        _outgoingContentClass = outgoingContentClass
    }
    
    @objc public init(messageType: String, incomingContentClass: NSObject.Type, outgoingContentClass: NSObject.Type) {
        _messageType = messageType
        _incomingNib = UINib(nibName: "IncomingMessageCell", bundle: Bundle(for: MessageCell.self))
        _outgoingNib = UINib(nibName: "OutgoingMessageCell", bundle: Bundle(for: MessageCell.self))
        _incomingContentClass = incomingContentClass
        _outgoingContentClass = outgoingContentClass
    }

    @objc public init(messageType: String, contentClass: NSObject.Type) {
        _messageType = messageType
        _incomingNib = UINib(nibName: "IncomingMessageCell", bundle: Bundle(for: MessageCell.self))
        _outgoingNib = UINib(nibName: "OutgoingMessageCell", bundle: Bundle(for: MessageCell.self))
        _incomingContentClass = contentClass
        _outgoingContentClass = contentClass
    }

    @objc public func messageType() -> String {
        return _messageType
    }

    @objc public func nib(direction: MessageDirection) -> UINib {
        switch direction {
        case .incoming:
            return _incomingNib
        case .outgoing:
            return _outgoingNib
        }
    }
    
    @objc public func identifier(direction: MessageDirection) -> String {
        return _messageType + direction.get()
    }
        
    @objc public func content(direction: MessageDirection) -> MessageContent {
        var contentClass: NSObject.Type?
        switch direction {
        case .incoming:
            contentClass = _incomingContentClass
        case .outgoing:
            contentClass = _outgoingContentClass
        }
        return contentClass!.init() as! MessageContent
    }

}
