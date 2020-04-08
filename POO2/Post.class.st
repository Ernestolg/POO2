Class {
	#name : #Post,
	#superclass : #Object,
	#instVars : [
		'creationDate',
		'creationTime',
		'user',
		'interactions',
		'text'
	],
	#category : #POO2
}

{ #category : #intialization }
Post class >> create:aUser withText:aText [
	^ self new initialize: aUser withText: aText.
]

{ #category : #adding }
Post >> addInteraction:aUser like:aBoolean [
	"La idea de este metodo es que ,llege el objeto usuario, con su like
	y primero ,se busque en las interacciones de este posteo si existe
	una interaccion de este usuario,si existe ,se guarda en instancia 
	y luego se remueve de la lista.Luego se crea la interaccion nueva" 
	|instance|
	self removeLike:aUser.
	instance:= Interaction interaction: aUser withLike: aBoolean.	
	interactions add:instance.
	^instance.
]

{ #category : #accesing }
Post >> creationDate [
	^creationDate
]

{ #category : #accesing }
Post >> creationTime [
	^creationTime
]

{ #category : #'initialization - private' }
Post >> initialize:aUser withText:aText [
	"Prepara la instancia para su uso"
	
	creationDate:= Date today.
	creationTime:= Time now.
	user:=aUser.
	text:=aText.
	interactions:=OrderedCollection new.
]

{ #category : #accesing }
Post >> interactions [
	^interactions
]

{ #category : #remove }
Post >> removeLike:aUser [
	interactions :=interactions reject: [:each| each interactionExist:aUser ].
]

{ #category : #accesing }
Post >> score [

|likes dislikes|
	likes := interactions count:[:interaction| interaction like].
	dislikes := interactions count:[:interaction| interaction like not].
	^(likes-dislikes).
 
]

{ #category : #accesing }
Post >> text [
	^text
]

{ #category : #accesing }
Post >> user [ 
	^user
]
