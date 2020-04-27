# Phx-JSON
Smalltalk object serialisation and materialisation (compatible with PharoJs)

Serializes Smalltalk or Javascript (PharoJs) objects to pure JSON of the form:
```
{
	"class": "Car",
	"instance": {
		"color": "Red",
		"purchasedAt": {
			"class": "DateAndTime",
			"instance": "2020-04-27T18:21:24.041099+00:00"
		},
		"owner": {
			"class": "Human",
			"instance": {
				"name": "John Doe"
			}
		}
	}
}
```

Serialization:
```
	| human car |
	human := Human new.
	human name: 'John Doe'.
	car := Car new.
	car color: 'Red'.
	car purchasedAt: DateAndTime now.
	car owner: h.
	jsonString := car asPhxJsonString.
```

Resurrection:
```
car := PhxJsonReader readFromString: jsonString.
```
