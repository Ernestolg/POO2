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
Topic class >> create: tName withDescription: tDesc [
^self new initialize:tName withDescription:tDesc

  
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
Topic >> itsMe:aString [
 "devuelvo true o false si soy el topico que me llega por parametro"
	^name=aString.
	
]

{ #category : #accessing }
Topic >> name [
	^ name.
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
