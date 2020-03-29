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
