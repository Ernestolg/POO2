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

{ #category : #accessing }
User >> creationDate [
	^ creationDate
]

{ #category : #accessing }
User >> creationTime [
	^ creationTime
]

{ #category : #remove }
User >> eliminarMiPregunta [


]

{ #category : #remove }
User >> eliminarMiPregunta:aQuestion [
"elimina la pregunta de mi coleccion de preguntas"
 myQuestion := myQuestion remove: aQuestion .

]

{ #category : #remove }
User >> eliminarMiRespuesta [

]

{ #category : #remove }
User >> eliminarMiRespuesta:aAnswer [
 myAnswer := myAnswer remove:aAnswer.

]

{ #category : #accessing }
User >> esMiUsuario:aUser [
	"respondo si soy el usuario que recibo"
	^ (aUser soyYo: name).
]

{ #category : #accessing }
User >> favTopics [
	^favTopics.
]

{ #category : #accessing }
User >> followers [
	^ followers
]

{ #category : #'adding elements' }
User >> makeAnswer:title [
	postsAnswer add:title.
	
 
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
User >> makeQuestion:title [
	postsQuestion add:title.
	
 
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
User >> myAnswer [ 
	^ myAnswer  
]

{ #category : #accessing }
User >> myQuestion [
	^ myQuestion 
]

{ #category : #accessing }
User >> name [
	^ name
]

{ #category : #initialization }
User >> name: anObject [
	name := anObject
]

{ #category : #accessing }
User >> password [
	^ password
]

{ #category : #initialization }
User >> password: anObject [
	password := anObject
]

{ #category : #accessing }
User >> postsAnswer [ 
	^ postsAnswer  
]

{ #category : #accessing }
User >> postsQuestion [
	^ postsQuestion 
]

{ #category : #accessing }
User >> soyYo:name2 [
	"respondo si soy el usuario que recibo"
	^ name=name2.
]
