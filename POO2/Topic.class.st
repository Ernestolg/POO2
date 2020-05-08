"
Class
------------------
It represent a topic of a Post.

Responsibilities
__________________


Related with
__________________
- Each Post has a collection of topics. Besides, each user has a collection of favorite topics.
"
Class {
	#name : #Topic,
	#superclass : #Object,
	#instVars : [
		'name',
		'description',
		'questions'
	],
	#category : #'POO2-Model'
}

{ #category : #initialization }
Topic class >> create: tName withDescription: tDesc [
^self new initialize:tName withDescription:tDesc

  
]

{ #category : #'adding elements' }
Topic >> addRelevant:aSet [
aSet addAll: self questions.
^aSet.
]

{ #category : #accessing }
Topic >> description [
	^ description.
]

{ #category : #'initialization - private' }
Topic >> initialize:tName withDescription:desc [

name:=tName.
description:=desc.
questions := OrderedCollection new.
]

{ #category : #accessing }
Topic >> name [
	^ name.
]

{ #category : #accessing }
Topic >> printOn: aStream [
	self name ifNotNil: [ aStream nextPutAll: self name ]
]

{ #category : #accessing }
Topic >> questions [
	^ questions.
]

{ #category : #'adding elements' }
Topic >> questions:aQuestion [
	questions add: aQuestion.
]

{ #category : #remove }
Topic >> removeQuestion:aQuestion [
"remueve la pregunta de los topicos, como es utilizado desde las preguntas , este metodo no 
 retornaria nada mas"
	 questions remove: aQuestion .
]
