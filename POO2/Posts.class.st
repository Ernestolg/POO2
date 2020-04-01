Class {
	#name : #Posts,
	#superclass : #Object,
	#instVars : [
		'creationDate',
		'creationTime',
		'user',
		'interaction',
		'textBody'
	],
	#category : #POO2
}

{ #category : #adding }
Posts >> addReaction:aUser like:aBoolean [
	"La idea de este metodo es que ,llege el objeto usuario, con su like
	y primero ,se busque en las interacciones de este posteo si existe
	una interaccion de este usuario,si existe ,se guarda en instancia 
	y luego se remueve de la lista.Luego se crea la interaccion nueva" 
	|ins|
	self removeLike:aUser.
	ins:= Like register:aBoolean  from:aUser  to: self.	
	interaction add:ins.
	^ins.
]

{ #category : #'initialization - private' }
Posts >> crearPost:aUser text:aString [
	"Prepara la instancia para su uso"
	
	creationDate:= Date today.
	creationTime:= Time now.
	user:=aUser.
	textBody:=aString.
	interaction:=OrderedCollection new.
]

{ #category : #accesing }
Posts >> creationDate [
	^creationDate
]

{ #category : #accesing }
Posts >> creationTime [
	^creationTime
]

{ #category : #accesing }
Posts >> interaction [
	^interaction
]

{ #category : #accesing }
Posts >> puntaje [
"devuelve la suma de todos los puntajes "
^interaction sum:[:each| each point ].
 
]

{ #category : #remove }
Posts >> removeLike:aUser [
	interaction :=interaction reject: [:each| each existeInteraccion:aUser ].
]

{ #category : #remove }
Posts >> removerLike:aUser [
	interaction :=interaction reject: [:each| each existeInteraccion:aUser ].
]

{ #category : #accesing }
Posts >> textBody [
	^textBody
]

{ #category : #accesing }
Posts >> user [ 
	^user
]
