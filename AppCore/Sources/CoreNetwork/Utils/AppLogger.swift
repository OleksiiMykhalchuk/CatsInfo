//
//  AppLogger.swift
//  AppCore
//
//  Created by Oleksii Mykhalchuk on 12/28/24.
//

import Foundation
import os

struct AppLogger {

    private let logger: Logger

    init(category: String) {
        self.logger = Logger(subsystem: Bundle.main.bundleIdentifier ?? "unknown", category: category)
    }

    func debug(_ message: String) {
        logger.debug("DEBUG: \(message)")
    }

    func error(_ message: String) {
        logger.fault("ERROR: \(message)")
    }
}
