//
//  WidgetBugSampleExtensionBundle.swift
//  WidgetBugSampleExtension
//
//  Created by Egor Solovev on 09.01.2024.
//

import WidgetKit
import SwiftUI

@main
struct WidgetBugSampleExtensionBundle: WidgetBundle {
    var body: some Widget {
        WidgetBugSampleExtension()
        WidgetBugSampleExtensionLiveActivity()
    }
}
