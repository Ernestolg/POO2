"
""Topic class""
"
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

{ #category : #'initialization - private' }
Topic class >> topic:aName withDescription:aDescription [
	^ self new initialize: aName  withDescription: aDescription.
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
Topic >> initialize:aName withDescription:aDescription [
	name := aName.
	description := aDescription.
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
