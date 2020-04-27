Extension { #name : #PjCollection }

{ #category : #'*Phx-JSON' }
PjCollection class >> instantiateWithPhxJsonReader: reader instanceJsonObject: jsonObject [
	^ self
		withAll:
			(jsonObject collect: [ :each | reader readFromJsObjectOrDictionary: each ])
]

{ #category : #'*Phx-JSON' }
PjCollection >> writePhxJsonRepresentationOn: w [
	w
		doBetweenSquareBrackets: [ self
				do: [ :each | each writePhxJsonOn: w ]
				separatedBy: [ w comma ] ]
]
