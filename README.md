# Phx-JSON
This package allows for Smalltalk/Javascript object serialisation and materialisation.\
Thanks to PharoJs this works as well in Smalltalk as in Javascript.\
This package was developed since none of the existing serialisation packages (STON, NeoJSON) are transpilable to Javascript using PharoJs.

### Serializes to pure JSON of the form:
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

### Serialization
```
human := Human new.
human name: 'John Doe'.
car := Car new.
car color: 'Red'.
car purchasedAt: DateAndTime now.
car owner: h.
jsonString := car asPhxJsonString.
```

### Materialisation
```
car := PhxJsonReader readFromString: jsonString.
```

### Cycles are seamlessly resolved with references to "known instances"
e.g. these objects contain two cycles
```
human := Human new.
human name: 'John Doe'.
human parent: human.
car := Car new.
car color: 'Red'.
car owner: human.
human ownedCars: {car}.
```

### serializes as:
```
{
	"class": "Car",
	"instance": {
		"color": "Red",
		"owner": {
			"class": "Human",
			"instance": {
				"name": "John Doe",
				"parent": {
					"instRef": 2
				},
				"ownedCars": {
					"class": "Array",
					"instance": [
						{
							"instRef": 1
						}
					]
				}
			}
		}
	}
}
```


### Known issues
1/Differences in key/value order between smalltalk and javascript\
2/Differences regarding presence of keys and nil values.
