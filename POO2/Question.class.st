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
	^myAnswers .
]

{ #category : #accesing }
Question >> myAnswerSorted [
"no funciona el sorted Collection"
	| coleccion |
	coleccion:=SortedCollection sortBlock:[:a :b| a puntaje  >= b puntaje  ].
	coleccion addAll: (myAnswers) .	
	^ coleccion.
]

{ #category : #accesing }
Question >> puntosSinUser [
"creo una coleccion y la cargo con todas las respuestas de otro usuario
que no sea el creador de la pregunta"
	| coleccion |
	coleccion := myAnswers reject: [ :each | each imFromUser: user ].
	^(coleccion size * 50)
]

{ #category : #remove }
Question >> removeAnswer:aAnswer [
 "elimino una respuesta de esta pregunta"
	myAnswers remove: aAnswer.
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
	myAnswers ifNotEmpty: [ myAnswers do: [ :each | each removeMe ] ].
	self
		removeMyAnswer ;
		removeFromTopic;
		removeFromUser
]

{ #category : #remove }
Question >> removeMyAnswer [
	myAnswers :=nil.
]

{ #category : #accesing }
Question >> soyDeTopicos:collectionT [
 "aqui se recibe una coleccion de topicos, los cuales se iteran para que 
  se agrege en cada uno la instancia de la pregunta ,asi cada topico la conoce"
	collectionT do: [ :each| each addQuestion:self ].
]
