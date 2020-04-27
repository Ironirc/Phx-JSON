Extension { #name : #PjNumber }

{ #category : #'*Phx-JSON' }
PjNumber >> writePhxJsonOn: w [
	w << self asString
]
