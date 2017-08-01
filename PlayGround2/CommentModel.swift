//
//  CommentModel.swift
//  PlayGround2
//
//  Created by Kevin on 7/27/17.
//  Copyright © 2017 Kevin. All rights reserved.
//

class CommentModel {
    var id: String?
    var playerComment: String?
    var playerUsername: String?
    
    init (id:String?, playerComment:String?, playerUsername:String?) {
        self.id = id
        self.playerComment = playerComment
        self.playerUsername = playerUsername
    }
}
