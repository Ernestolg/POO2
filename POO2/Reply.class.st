"
Class
------------------
It represents a reply made by a user to a Question.

Responsibilities
__________________
- Reply Scoring
- It knows who is its writer and the question


Related with
__________________
Each user has a collection of replies, when a user replies a Question, the reply is saved in replies collection.
"
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
Reply >> initialize: anUser withText: aText question: aQuestion [
	user := anUser.
	text := aText.
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
