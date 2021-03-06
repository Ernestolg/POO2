Class {
	#name : #AccessComponent,
	#superclass : #WAComponent,
	#instVars : [
		'username',
		'password',
		'errorMessage'
	],
	#category : #'POO2-UI'
}

{ #category : #model }
AccessComponent >> model [
	^CuOOra soleInstance.
]

{ #category : #accessing }
AccessComponent >> password [
	^ password
]

{ #category : #accessing }
AccessComponent >> password: anObject [
	password := anObject
]

{ #category : #private }
AccessComponent >> proceedWith: anUser [
	errorMessage :=nil.
	self session user: anUser.
	self call: IndexComponent new.
	username:=nil.
	password:=nil.
	
]

{ #category : #rendering }
AccessComponent >> renderButtonsOn: aCanvas [
	self subclassResponsibility
]

{ #category : #rendering }
AccessComponent >> renderContentOn: aCanvas [
	errorMessage ifNotNil: [ aCanvas paragraph: errorMessage ].
	aCanvas
		form: [ self renderInputElementsOn: aCanvas.
			self renderButtonsOn: aCanvas ]
]

{ #category : #rendering }
AccessComponent >> renderInputElementsOn: aCanvas [
	aCanvas label: 'Username'.
	aCanvas paragraph: [ aCanvas textInput on: #username of: self ].
	aCanvas label: 'Password'.
	aCanvas paragraph: [ aCanvas textInput on: #password of: self ]
]

{ #category : #accessing }
AccessComponent >> username [
	^ username
]

{ #category : #accessing }
AccessComponent >> username: anObject [
	username := anObject
]
