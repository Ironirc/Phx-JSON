Extension { #name : #Date }

{ #category : #'*Phx-JSON' }
Date class >> instantiateWithPhxJsonReader: reader instanceJsonObject: aString [
	^self readFrom: (aString ifNotNilOrEmpty: [aString first:10]) pattern: 'yyyy-mm-dd'
]

{ #category : #'*Phx-JSON' }
Date >> writePhxJsonRepresentationOn: w [
	w writeQuoted: self yyyymmdd
]
