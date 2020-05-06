Extension { #name : #String }

{ #category : #'*Phx-JSON' }
String >> writePhxJsonOn: w [
	w << (STONJSON toString: self)
	


]
