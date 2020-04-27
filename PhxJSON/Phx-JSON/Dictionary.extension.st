Extension { #name : #Dictionary }

{ #category : #'*Phx-JSON' }
Dictionary >> writePhxJsonRepresentationOn: w [
	w
		doBetweenCurlyBraces: [ self keys
				do:
					[ :key | w writeKeyName: key andValue: [ (self at: key) writePhxJsonOn: w ] ]
				separatedBy: [ w comma ] ]
]
