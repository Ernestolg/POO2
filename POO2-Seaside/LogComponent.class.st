Class {
	#name : #LogComponent,
	#superclass : #AccessComponent,
	#category : #'POO2-Seaside'
}

{ #category : #callbacks }
LogComponent >> login [
	(self model myUserWithName: username protectedBy: password)
		ifNotNil: [ :it | self proceedWith: it ]
		ifNil: [ errorMessage := 'Username or password incorrect' ]
]

{ #category : #callbacks }
LogComponent >> model [
	^CuOOra soleInstance 
	
]

{ #category : #callbacks }
LogComponent >> registerNewUser [
	self call: RegisComponent new
]

{ #category : #rendering }
LogComponent >> renderButtonsOn: aCanvas [
	self renderSignInButtonOn: aCanvas.
	self renderSignUpButtonOn: aCanvas
	
]

{ #category : #rendering }
LogComponent >> renderContentOn: aCanvas [
	aCanvas heading:[aCanvas strong:'LOGIN'].
	aCanvas horizontalRule.
	super renderContentOn:aCanvas.
]

{ #category : #rendering }
LogComponent >> renderSignInButtonOn: aCanvas [
	aCanvas submitButton
		callback:[self login];
		with:'Sign In'

]

{ #category : #callbacks }
LogComponent >> renderSignUpButtonOn: aCanvas [
	aCanvas submitButton
		callback: [ self registerNewUser ];
		with: 'Sign Up, it''s free'
]
