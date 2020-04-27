Extension { #name : #PjDictionary }

{ #category : #'*Phx-JSON' }
PjDictionary class >> instantiateWithPhxJsonReader: reader instanceJsonObject: jsonObject [
	| n |
	n :=  self new.
	jsonObject keysAndValuesDo: [:k :v | n at: k put: (reader readFromJsObjectOrDictionary: v)  ].
	^n
		
]

{ #category : #'*Phx-JSON' }
PjDictionary class >> phxJsonClassName [
	^ 'Dictionary'
]

{ #category : #'*Phx-JSON' }
PjDictionary >> writePhxJsonRepresentationOn: w [
	self asJsObject writePhxJsonRepresentationOn: w
]
