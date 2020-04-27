Extension { #name : #Number }

{ #category : #'*Phx-JSON' }
Number >> writePhxJsonOn: w [
	w << self asString
]
