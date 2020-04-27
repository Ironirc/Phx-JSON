Extension { #name : #PjString }

{ #category : #'*Phx-JSON' }
PjString >> writePhxJsonOn: w [
	w << self asJSON
]
