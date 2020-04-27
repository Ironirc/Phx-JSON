Extension { #name : #PjArray }

{ #category : #'*Phx-JSON' }
PjArray class >> instantiateWithPhxJsonReader: reader instanceJsonObject: jsonObject [
	^ self
		withAll:
			(jsonObject collect: [ :each | reader readFromJsObjectOrDictionary: each ])
]

{ #category : #'*Phx-JSON' }
PjArray >> writePhxJsonRepresentationOn: w [
	w
		doBetweenSquareBrackets: [ self
				do: [ :each | each writePhxJsonOn: w ]
				separatedBy: [ w comma ] ]
]
