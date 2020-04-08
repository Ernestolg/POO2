Class {
	#name : #Reply,
	#superclass : #Post,
	#instVars : [
		'question',
		'user'
	],
	#category : #POO2
}

{ #category : #'initialization - private' }
Reply class >> reply:aQuestion withText:aText withUser:aUser [
	^ self new initialize: aQuestion  withText:aText  withUser:aUser.
]

{ #category : #'initialization - private' }
Reply >> initialize:aQuestion withText:aText withUser:aUser [
	"It creates a reply written by a user for a question"
	question := aQuestion.
	text := aText.
	user := aUser.
]

{ #category : #accessing }
Reply >> question [
	^ question
]

{ #category : #accessing }
Reply >> question: anObject [
	question := anObject
]

{ #category : #callback }
Reply >> score [
	|likes dislikes|
	likes := interactions count:[:interaction| interaction like ].
	dislikes := interactions count:[:interaction| interaction like not].
	^ (likes - dislikes)
]

{ #category : #accessing }
Reply >> user [
	^ user
]

{ #category : #accessing }
Reply >> user: anObject [
	user := anObject
]
