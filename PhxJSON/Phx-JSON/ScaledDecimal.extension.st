Extension { #name : #ScaledDecimal }

{ #category : #'*Phx-JSON' }
ScaledDecimal >> writePhxJsonOn: w [
	w << (self printShowingDecimalPlaces: self scale)
]
