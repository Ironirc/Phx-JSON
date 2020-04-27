Extension { #name : #PjObject }

{ #category : #'*Phx-JSON' }
PjObject >> allPhxJsonInstvarNames [
	^ self keys
]

{ #category : #'*Phx-JSON' }
PjObject class >> instantiateWithPhxJsonReader: reader instanceJsonObject: jsonObject [
	| obj |
	obj := self new.
	jsonObject
		keysAndValuesDo: [ :k :v | obj instVarNamed: k put: (reader readFromJsObjectOrDictionary: v) ].
	^ obj 
]

{ #category : #'*Phx-JSON' }
PjObject class >> jsTranspilationImportMethodsNonstandard [
	<pharoJsSkip>
	^{ Object class -> #(newPhxJsonWriter ).
	
		Object -> #( asPhxJsonString #writePhxJsonOn: writePhxJsonRepresentationOn:
			).
		}
]

{ #category : #'*Phx-JSON' }
PjObject class >> phxJsonClassName [
	^ self name
]
