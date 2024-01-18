//
//  AppIntent.swift
//  WidgetBugSampleExtension
//
//  Created by Egor Solovev on 09.01.2024.
//

import WidgetKit
import AppIntents

struct ConfigurationAppIntent: AppIntent, WidgetConfigurationIntent {
    static var title: LocalizedStringResource = "Configuration"
    static var description = IntentDescription("This is an example widget.")

    // An example configurable parameter.
    @Parameter(title: "Favorite Emoji", default: "😃")
    var favoriteEmoji: String
    
    @Parameter(title: "Custom Emoji", default: nil)
    var customEmoji: EmojiAppEntity?
    
    static var parameterSummary: some ParameterSummary {
        Summary {
            \.$favoriteEmoji
            \.$customEmoji
        }
    }
}

struct EmojiAppEntity: AppEntity {
    static var defaultQuery = EmojiQuery()
    
    static var typeDisplayRepresentation: TypeDisplayRepresentation = "Custom Emoji"
    
    var displayRepresentation: DisplayRepresentation {
        DisplayRepresentation(title: LocalizedStringResource(stringLiteral: displayString))
    }
    
    var id: String
    var displayString: String
    
    init?(identifier: String?, name: String?) {
        guard let identifier = identifier, let name = name else {
            return nil
        }
        self.id = identifier
        self.displayString = name
    }
    
    struct EmojiQuery: EntityStringQuery {

        func entities(matching string: String) async throws -> [EmojiAppEntity] {
            return ["🐶","🙉","🐮","🐔","🐧"].compactMap { emoji in
                EmojiAppEntity(identifier: emoji, name: emoji)
            }
        }
        
        func entities(for identifiers: [EmojiAppEntity.ID]) async throws -> [EmojiAppEntity] {
            return ["🐶","🙉","🐮","🐔","🐧"].compactMap { emoji in
                EmojiAppEntity(identifier: emoji, name: emoji)
            }
        }
        
        func suggestedEntities() async throws -> [EmojiAppEntity] {
            return ["🐶","🙉","🐮","🐔","🐧"].compactMap { emoji in
                EmojiAppEntity(identifier: emoji, name: emoji)
            }
        }
        
        func defaultResult() async -> EmojiAppEntity? {
            nil
        }
    }

}
