Extension { #name : #Object }

{ #category : #'*Phx-JSON' }
Object >> allPhxJsonInstvarNames [
	^ self class allInstVarNames
]

{ #category : #'*Phx-JSON' }
Object >> asPhxJsonString [
	| writer |
	writer := self class newPhxJsonWriter.
	self writePhxJsonOn: writer.
	^ writer string
]

{ #category : #'*Phx-JSON' }
Object class >> instantiateWithPhxJsonReader: reader instanceJsonObject: jsonObject [
	| obj |
	obj := self new.
	reader addKnownObject: obj.
	jsonObject
		keysAndValuesDo: [ :k :v | obj instVarNamed: k put: (reader readFromJsObjectOrDictionary: v) ].
	^ obj 
]

{ #category : #'*Phx-JSON' }
Object class >> newPhxJsonWriter [
	^PhxJsonWriter new
]

{ #category : #'*Phx-JSON' }
Object class >> phxJsonClassName [
	^ self name
]

{ #category : #'*Phx-JSON' }
Object >> writePhxJsonObjectOn: w [
	^ w
		doBetweenCurlyBraces: [ w writeKeyName: 'class' andValue: self class phxJsonClassName.
			w comma.
			w
				writeKeyName: 'instance'
				andValue: [ self writePhxJsonRepresentationOn: w ] ]
]

{ #category : #'*Phx-JSON' }
Object >> writePhxJsonOn: w [
	w
		writeReferenceFor: self
		or: [ self writePhxJsonObjectOn: w ]
]

{ #category : #'*Phx-JSON' }
Object >> writePhxJsonRepresentationOn: w [
	w
		doBetweenCurlyBraces: [ self allPhxJsonInstvarNames
				do: [ :key | 
					w
						writeKeyName: key
						andValue: [ (self instVarNamed: key) writePhxJsonOn: w ] ]
				separatedBy: [ w comma ] ]
]
