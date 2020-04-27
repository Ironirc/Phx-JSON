Extension { #name : #DateAndTime }

{ #category : #'*Phx-JSON' }
DateAndTime class >> instantiateWithPhxJsonReader: reader instanceJsonObject: jsonObject [
	^self fromString: jsonObject
]

{ #category : #'*Phx-JSON' }
DateAndTime >> writePhxJsonOn: w [
	self writePhxJsonObjectOn: w
]

{ #category : #'*Phx-JSON' }
DateAndTime >> writePhxJsonRepresentationOn: w [
	w writeQuoted: self asUTC asString
]
