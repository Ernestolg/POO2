Class {
	#name : #Answer,
	#superclass : #Posts,
	#instVars : [
		'question'
	],
	#category : #POO2
}

{ #category : #'initialization - private' }
Answer class >> crearRespuesta: aUser text: aString question: aQuestion [
	| instancia |
	instancia := self new.
	instancia crearRespuesta: aUser text: aString question: aQuestion.
	^instancia.
]

{ #category : #'adding elements' }
Answer >> crearRespuesta: aUser text: aString question: aQuestion [
	self crearPost: aUser text: aString.
	question := aQuestion.
	aQuestion addAnswer: self.
]

{ #category : #accesing }
Answer >> question [
	^question.
]
