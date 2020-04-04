Class {
	#name : #Topic,
	#superclass : #Object,
	#instVars : [
		'name',
		'description',
		'questions'
	],
	#category : #POO2
}

{ #category : #initialization }
Topic class >> cargar: tName desc: tDesc [
|topic|
topic := self new.
topic name:tName ;description: tDesc ; iniciarQuestions .
^topic.

  
]

{ #category : #'adding elements' }
Topic >> addQuestion: aQuestion [
	questions add: aQuestion
]

{ #category : #accessing }
Topic >> description [
	^ description.
]

{ #category : #'initialization - private' }
Topic >> description: anObject [
	description := anObject
]

{ #category : #'initialization - private' }
Topic >> iniciarQuestions [
	questions:= OrderedCollection new.
]

{ #category : #'adding elements' }
Topic >> myQuestions:aCollection [
	aCollection addAll: questions.
	^aCollection
]

{ #category : #accessing }
Topic >> name [
	^ name.
]

{ #category : #'initialization - private' }
Topic >> name: anObject [
	name := anObject
]

{ #category : #accessing }
Topic >> questions [
	^ questions.
]

{ #category : #remove }
Topic >> removeQuestion:aQuestion [
"remueve la pregunta de los topicos, como es utilizado desde las preguntas , este metodo no 
 retornaria nada mas"
	 questions remove: aQuestion .
]

{ #category : #accessing }
Topic >> soyYo:aString [
 "devuelvo true o false si soy el topico que me llega por parametro"
	^name=aString.
	
]
