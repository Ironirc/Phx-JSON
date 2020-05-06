Class {
	#name : #BaselineOfPhxJSON,
	#superclass : #BaselineOf,
	#category : #BaselineOfPhxJSON
}

{ #category : #baseline }
BaselineOfPhxJSON >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ spec
				blessing: #baseline;
				repository: 'github://Ironirc/Phx-JSON';
				package: 'Phx-JSON' ]
]
