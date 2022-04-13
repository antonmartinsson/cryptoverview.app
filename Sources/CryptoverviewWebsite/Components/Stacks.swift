//
//  Stacks.swift
//
//  Created by Anton Martinsson on 2021-05-13.
//

import Foundation
import Plot

struct VStack: ComponentContainer {
	@ComponentBuilder var content: ContentProvider
	
	var body: Component {
		Div(content: content).class("vStack")
	}
}

struct HStack: ComponentContainer {
	@ComponentBuilder var content: ContentProvider
	
	var body: Component {
		Div(content: content).class("hStack")
	}
}
