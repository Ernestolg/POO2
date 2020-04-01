Class {
	#name : #Question,
	#superclass : #Posts,
	#instVars : [
		'title',
		'topics',
		'myAnswers'
	],
	#category : #POO2
}

{ #category : #'initialization - private' }
Question class >> crearPregunta: aStringT topicos: collectionT desc: aStringD author: aUser [
	| instancia |
	instancia := self new.
	instancia
		crearPregunta: aStringT
		topicos: collectionT
		desc: aStringD
		author: aUser.
		^instancia
]

{ #category : #'adding elements' }
Question >> addAnswer:anAnswer [
	myAnswers add:anAnswer.
]

{ #category : #'initialization - private' }
Question >> crearPregunta:aStringT topicos:collectionT desc:aStringD author:aUser [
 "crea una instancia de pregunta , primero manda un mensaje a self
 para utilizar el metodo definido en la clase padre Posts y luego inicializa
 las variables propias de una pregunta.La ultima linea se encarga de
 mandar la pregunta a todos los topicos que se le enviaron"
 self crearPost:aUser  text:aStringD.
 title:=aStringT.
 topics:=collectionT.
 myAnswers :=OrderedCollection new.
 self soyDeTopicos: collectionT.
  
]

{ #category : #accesing }
Question >> myAnswer [
"no funciona el sorted Collection"
	| col |
	col := SortedCollection
		sortBlock: [ :arg1 :arg2 | (arg1 puntaje) <= (arg2 puntaje) ].
	col addAll: (myAnswers) .	
	^ col.
]

{ #category : #accesing }
Question >> soyDeTopicos:collectionT [
 "aqui se recibe una coleccion de topicos, los cuales se iteran para que 
  se agrege en cada uno la instancia de la pregunta ,asi cada topico la conoce"
	collectionT do: [ :each| each addQuestion:self ].
]
