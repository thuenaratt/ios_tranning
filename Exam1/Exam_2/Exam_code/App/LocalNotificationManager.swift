//
//  LocalNotificationManager.swift
//  Exam
//
//  Created by Savet on 4/2/20.
//

import UserNotifications

class LocalNotificationManager {
	
	init(title: String, body: String) {
		UNUserNotificationCenter.current()
			.requestAuthorization(options: [.alert, .badge, .alert]) { granted, error in
				if granted == true && error == nil {
					let content = UNMutableNotificationContent()
					content.title = title
					content.body = body
					content.sound = .default
					let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 0.0000001, repeats: false)
					let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
					UNUserNotificationCenter.current().add(request) { error in
						guard error == nil else { return }
						print("Scheduling notification with id: \(title)")
					}
				}
			}
	}
}
