//
//  EmojiArtModel.swift
//  EmojiArt
//
//  Created by Daniil Silin on 05/03/2022.
//
// MODEL

import Foundation

struct EmojiArtModel: Codable {
    var background = Background.blank
    var emojis = [Emoji]()
    
    struct Emoji: Identifiable, Hashable, Codable {
        var id: Int
        let text: String
        
        var x: Int
        var y: Int
        var size: Int
        
        fileprivate init(id: Int, text: String, x: Int, y: Int, size: Int){
            self.id = id
            self.text = text
            self.x = x
            self.y = y
            self.size = size
        }
    }
    
    init(){}
    
    func json() throws -> Data {
        return try JSONEncoder().encode(self)
    }
    
    init(json: Data) throws {
        self = try JSONDecoder().decode(EmojiArtModel.self, from: json)
    }
    
    
    init(url: URL) throws {
        let data = try Data(contentsOf: url)
        self = try EmojiArtModel(json: data)
    }
    
    private var uniqueEmojiId = 0
    
    mutating func addEmoji(_ text: String, at loaction: (x: Int, y: Int), size: Int){
        uniqueEmojiId += 1
        emojis.append(Emoji(id: uniqueEmojiId, text: text, x: loaction.x, y: loaction.y, size: size))
        
    }
}
