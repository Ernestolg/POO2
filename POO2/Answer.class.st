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
"creo una coleccion y la cargo con todas las respuestas de otro usuario
que no sea el creador de la pregunta"
	| coleccion |
	coleccion := question reject: [ :each | each imFromUser: user ].
	^(coleccion size * 50)
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
