Class {
	#name : #UserComponent,
	#superclass : #WAComponent,
	#instVars : [
		'header',
		'user'
	],
	#category : #'POO2-Seaside'
}

{ #category : #initialization }
UserComponent >> back [
	self answer.
	
]

{ #category : #initialization }
UserComponent >> initialize [ 
	super initialize.
	header:=HeaderComponent new.
	header caller:self.
	
]

{ #category : #rendering }
UserComponent >> renderContentOn: aCanvas [
	aCanvas render:header.
	aCanvas paragraph:[ aCanvas text:'ESTE ESPACIO ES DEL USUARIO   :  ',user name]
]

{ #category : #accessing }
UserComponent >> user [
	^ user
]

{ #category : #accessing }
UserComponent >> user: anObject [
	user := anObject
]
