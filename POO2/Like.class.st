Class {
	#name : #Like,
	#superclass : #Object,
	#instVars : [
		'meGusta',
		'post',
		'user',
		'creationDate',
		'creationTime'
	],
	#category : #POO2
}

{ #category : #'initialization - private' }
Like class >> register: aBoolean from: aUser to: aPost [
	| instancia |
	instancia := self new.
	instancia crearLike: aBoolean from: aUser to: aPost.
	^ instancia
]

{ #category : #'initialization - private' }
Like >> crearLike:aBoolean from:aUser to:aPost [
 user:=aUser.
 post:=aPost.
 meGusta:=aBoolean.
 creationDate:=Date today.
 creationTime:=Time now.
]

{ #category : #accessing }
Like >> creationDate [
	^ creationDate
]

{ #category : #accessing }
Like >> creationTime [
	^ creationTime
]

{ #category : #accessing }
Like >> existeInteraccion: aUser [
 ^(user esMiUsuario: aUser).
]

{ #category : #accessing }
Like >> meGusta [
	^ meGusta
]

{ #category : #accessing }
Like >> point [
 (self meGusta) ifTrue: [ ^1 ] ifFalse:[^-1].
]

{ #category : #accessing }
Like >> post [
	^ post
]

{ #category : #accessing }
Like >> user [
	^ user
]
