//
//  EmojiArtApp.swift
//  EmojiArt
//
//  Created by Daniil Silin on 05/03/2022.
//

import SwiftUI

@main
struct EmojiArtApp: App {
//    @StateObject var documentVM = EmojiArtDocument()
    @StateObject var paletteStore = PaletteStore(named: "Default")
    
    var body: some Scene {
        DocumentGroup(newDocument: { EmojiArtDocument() }) { config in
            EmojiArtDocumentView(documentVM: config.document)
                .environmentObject(paletteStore)
        }
    }
}
