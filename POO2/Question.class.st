Class {
	#name : #Question,
	#superclass : #Post,
	#instVars : [
		'title',
		'topics',
		'replies'
	],
	#category : #POO2
}

{ #category : #'initialization - private' }
Question class >> create: aStringT topics: collectionT desc: aStringD author: aUser [
	| instancia |
	instancia := self new.
	instancia
		create: aStringT
		topics: collectionT
		desc: aStringD
		author: aUser.
		^instancia
]

{ #category : #'adding elements' }
Question >> addReply:aReply [
	replies add:aReply.
]

{ #category : #'initialization - private' }
Question >> create:aStringT topics:collectionT desc:aStringD author:aUser [
 "crea una instancia de pregunta , primero manda un mensaje a self
 para utilizar el metodo definido en la clase padre Posts y luego inicializa
 las variables propias de una pregunta.La ultima linea se encarga de
 mandar la pregunta a todos los topicos que se le enviaron"
 self createPost:aUser  text:aStringD.
 title:=aStringT.
 topics:=collectionT.
 replies :=OrderedCollection new.
 self imFromTopics: collectionT.
  
]

{ #category : #accesing }
Question >> imFromTopics:collectionT [
 "aqui se recibe una coleccion de topicos, los cuales se iteran para que 
  se agrege en cada uno la instancia de la pregunta ,asi cada topico la conoce"
	collectionT do: [ :each| each questions:self ].
]

{ #category : #accesing }
Question >> imFromUser:anUser [
	^(user itsMyUser: anUser).
]

{ #category : #accesing }
Question >> myRepliesSorted [
"no funciona el sorted Collection"
	| coleccion |
	coleccion:=SortedCollection sortBlock:[:a :b| a point  >= b point  ].
	coleccion addAll: (replies) .	
	^ coleccion.
]

{ #category : #remove }
Question >> removeFromTopic [
	topics do:[:each| each removeQuestion:self].
]

{ #category : #remove }
Question >> removeFromUser [
	user removeQuestion: self.
]

{ #category : #remove }
Question >> removeMe [
	replies ifNotEmpty: [ replies do: [ :each | each removeMe ] ].
	self
		removeReply ;
		removeFromTopic;
		removeFromUser
]

{ #category : #remove }
Question >> removeReply [
	replies :=nil.
]

{ #category : #accesing }
Question >> replies [
	^replies .
]
