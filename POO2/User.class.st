Class {
	#name : #User,
	#superclass : #Object,
	#instVars : [
		'name',
		'password',
		'creationDate',
		'creationTime',
		'myQuestion',
		'myAnswer',
		'favTopics',
		'followers'
	],
	#category : #POO2
}

{ #category : #initialization }
User class >> cargar:nameUser pass:passUser [
|objeto|
objeto := self new .
objeto crearUsuario:nameUser  pass:passUser. 
^objeto.
]

{ #category : #'adding elements' }
User >> addFavTopic:topic [
	"agrego mi topico favorito,que llega por parametro"
	favTopics add: topic.
 
]

{ #category : #'adding elements' }
User >> addFollower:anUser [
 "agrego este usuario como seguidor de otro pasado por parametro"
 followers add:anUser.
]

{ #category : #initialization }
User >> crearUsuario:nameUser pass:passUser [

self name:nameUser;password:passUser.
creationDate:= Date today.
creationTime:= Time now.
followers := OrderedCollection new .
myQuestion := OrderedCollection new.
myAnswer  := OrderedCollection new.
favTopics := OrderedCollection new.
]

{ #category : #'accessing values' }
User >> creationDate [
	^ creationDate
]

{ #category : #'accessing values' }
User >> creationTime [
	^ creationTime
]

{ #category : #accessing }
User >> esMiUsuario:aUser [
	"respondo si soy el usuario que recibo"
	^ (aUser soyYo: name).
]

{ #category : #'accessing values' }
User >> favTopics [
	^favTopics.
]

{ #category : #'accessing values' }
User >> followers [
	^ followers
]

{ #category : #'adding elements' }
User >> makeAnswer: aQuestion text: text [
	"creo una instancia de respuesta y la cargo a mis respuestas"

	| answer |
	answer := Answer crearRespuesta: self text: text question: aQuestion.
	myAnswer add: answer.
	^answer.
]

{ #category : #'adding elements' }
User >> makeQuestion: title body: text topics: collectionT [ 
	"creo una instancia de pregunta y la agrego a mis preguntas,
	la instancia de pregunta debe tener el usuario que la hizo
	por esa razon le paso self , y tambien una coleccion de topicos"
	| aQuestion |
	aQuestion := Question
		crearPregunta: title
		topicos: collectionT
		desc: text
		author: self.
	myQuestion add: aQuestion.
	^aQuestion.
]

{ #category : #accessing }
User >> miPuntaje [
 |punto|
	punto:=0.
	punto := self miPuntajeInteraccion + self miPuntajeLikes .	
	^punto.
	
]

{ #category : #accessing }
User >> miPuntajeInteraccion [
"cuento todas las preguntas (valen 20 puntos) y cada respuesta de otro usuario
 a esas preguntas, que valen 50"
 |punto|	
	punto:=myQuestion sum: [:each | each puntosSinUser ].
	punto:=punto + (myQuestion size * 20).
	^punto.
	
]

{ #category : #accessing }
User >> miPuntajeLikes [
	"cuento todos los likes en las interacciones del user"

	| punto |
	punto := 0.
	myQuestion
		ifNotEmpty: [ punto := punto + (myQuestion sum: [ :each | each puntaje ]) ].
	myAnswer
		ifNotEmpty: [ punto := punto + (myAnswer sum: [ :each | each puntaje ]) ].
	^ punto
]

{ #category : #'accessing values' }
User >> myAnswer [ 
	^ myAnswer  
]

{ #category : #'accessing values' }
User >> myQuestion [
	^ myQuestion 
]

{ #category : #'adding elements' }
User >> myQuestions: aCollection [
	aCollection addAll: myQuestion .
	^aCollection.
]

{ #category : #'accessing values' }
User >> name [
	^ name
]

{ #category : #initialization }
User >> name: anObject [
	name := anObject
]

{ #category : #'accessing values' }
User >> password [
	^ password
]

{ #category : #initialization }
User >> password: anObject [
	password := anObject
]

{ #category : #accessing }
User >> relevantQuestion [
"en una coleccion auxiliar recolecto todaslas preguntas de los topicos favoritos
 y de los usuarios que sigo y  la devuelvo"
|questions|
	questions:=OrderedCollection new.
	favTopics ifNotEmpty:[ favTopics do: [:each| each myQuestions:questions]].
	followers ifNotEmpty: [ followers do: [ :each| each myQuestions: questions ]].	
	^questions.
]

{ #category : #remove }
User >> removeAnswer:aAnswer [
 myAnswer remove:aAnswer.

]

{ #category : #remove }
User >> removeQuestion:aQuestion [
"elimina la pregunta de mi coleccion de preguntas"
 myQuestion remove: aQuestion .

]

{ #category : #accessing }
User >> soyYo:name2 [
	"respondo si soy el usuario que recibo"
	^ name=name2.
]
