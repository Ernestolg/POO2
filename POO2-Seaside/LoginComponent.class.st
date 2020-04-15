Class {
	#name : #LoginComponent,
	#superclass : #AccessComponent,
	#category : #'POO2-Seaside'
}

{ #category : #callbacks }
LoginComponent >> login [
	(self model myUserWithName: username protectedBy: password)
		ifNotNil: [ :it | self proceedWith: it ].
	username := nil.
	password := nil
]

{ #category : #callbacks }
LoginComponent >> model [
	^CuOOra soleInstance 
	
]

{ #category : #callbacks }
LoginComponent >> registerNewUser [
	self call: RegisterComponent new
]

{ #category : #rendering }
LoginComponent >> renderButtonsOn: aCanvas [
	self renderSignInButtonOn: aCanvas.
	self renderSignUpButtonOn: aCanvas
	
]

{ #category : #rendering }
LoginComponent >> renderSignInButtonOn: aCanvas [
	aCanvas submitButton
		callback:[self login];
		with:'Sign In'

]

{ #category : #callbacks }
LoginComponent >> renderSignUpButtonOn: aCanvas [
	aCanvas submitButton
		callback: [ self registerNewUser ];
		with: 'Sign Up, it''s free'
]
