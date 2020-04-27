Extension { #name : #String }

{ #category : #'*Phx-JSON' }
String >> writePhxJsonOn: w [
	w << (Json render: self)
]
