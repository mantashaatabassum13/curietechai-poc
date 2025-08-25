%dw 2.0
output application/json
---
// Transform Salesforce Account data to NetSuite Customer format
payload map (account, index) -> {
	// NetSuite Customer fields mapping
	companyName: account.Name,
	email: account.PersonEmail,
	phone: account.Phone,
	// Additional NetSuite customer fields can be added here
	entityId: account.Id ++ "_" ++ (now() as String {format: "yyyyMMddHHmmss"}),
	isPerson: true,
	// Set default values for required NetSuite fields
	subsidiary: {
		internalId: "1" // Default subsidiary - should be configured based on your NetSuite setup
	}
}