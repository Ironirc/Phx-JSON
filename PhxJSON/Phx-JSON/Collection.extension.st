Extension { #name : #Collection }

{ #category : #'*Phx-JSON' }
Collection class >> instantiateWithPhxJsonReader: reader instanceJsonObject: jsonObject [
	^ self
		withAll:
			(jsonObject collect: [ :each | reader readFromJsObjectOrDictionary: each ])
]

{ #category : #'*Phx-JSON' }
Collection >> writePhxJsonRepresentationOn: w [
	w
		doBetweenSquareBrackets: [ self
				do: [ :each | each writePhxJsonOn: w ]
				separatedBy: [ w comma ] ]
]
