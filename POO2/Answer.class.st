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
Answer >> puntosSinUser [
"pregunto si el user que creo la respuesta coincide con el user creador de la pregunta y 
	si lo hacen , devuelvo 0 ,sino 50"
	(question imFromUser: user) ifTrue:[^0] ifFalse:[^50]. 
]

{ #category : #accesing }
Answer >> question [
	^question.
]

{ #category : #remove }
Answer >> removeFromQuestion [
 question removeAnswer: self.
 
]

{ #category : #remove }
Answer >> removeFromUser [
	user removeAnswer:self.
 
]

{ #category : #remove }
Answer >> removeMe [ 
	self removeFromUser.
 
]
