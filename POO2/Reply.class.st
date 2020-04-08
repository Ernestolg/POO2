Class {
	#name : #Reply,
	#superclass : #Post,
	#instVars : [
		'question'
	],
	#category : #POO2
}

{ #category : #'initialization - private' }
Reply class >> create: aUser text: aString question: aQuestion [
	| instancia |
	instancia := self new.
	instancia create: aUser text: aString question: aQuestion.
	^instancia.
]

{ #category : #'adding elements' }
Reply >> create: aUser text: aString question: aQuestion [
	self createPost: aUser text: aString.
	question := aQuestion.
	aQuestion addReply: self.
]

{ #category : #accesing }
Reply >> pointsWithoutUser [
"pregunto si el user que creo la respuesta coincide con el user creador de la pregunta y 
	si lo hacen , devuelvo 0 ,sino 50"
	(question imFromUser: user) ifTrue:[^0] ifFalse:[^50]. 
]

{ #category : #accesing }
Reply >> question [
	^question.
]

{ #category : #remove }
Reply >> removeFromQuestion [
 question removeAnswer: self.
 
]

{ #category : #remove }
Reply >> removeFromUser [
	user removeReply:self.
 
]

{ #category : #remove }
Reply >> removeMe [ 
	self removeFromUser.
 
]
