Class {
	#name : #InteractionSetTest,
	#superclass : #TestCase,
	#instVars : [
		'testedUser',
		'aReply',
		'testedUser3'
	],
	#category : #'POO2-Tests'
}

{ #category : #'setUp-tearDown' }
InteractionSetTest >> setUp [
	super setUp.
	testedUser like: aReply.
	testedUser3 dislike: aReply
]
