Class {
	#name : #ReplySetTest,
	#superclass : #TestCase,
	#instVars : [
		'testedUser2',
		'aQuestion',
		'aReply'
	],
	#category : #'POO2-Tests'
}

{ #category : #'setUp-tearDown' }
ReplySetTest >> setUp [
	super setUp.
	aReply := testedUser2
	replyQuestion: aQuestion
	withText: 'You have 2 read the documentation.'.
]
