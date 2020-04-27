Extension { #name : #PjDateAndTime }

{ #category : #'*Phx-JSON' }
PjDateAndTime class >> instantiateWithPhxJsonReader: reader instanceJsonObject: str [
	<javascript: 'return new Date(str);'>
]

{ #category : #'*Phx-JSON' }
PjDateAndTime class >> phxJsonClassName [
	^ 'DateAndTime'
]

{ #category : #'*Phx-JSON' }
PjDateAndTime >> writePhxJsonRepresentationOn: w [
	w writeQuoted: "self yyyymmdd" self toISOString "toString"
]
