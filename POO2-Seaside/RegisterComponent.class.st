Class {
	#name : #RegisterComponent,
	#superclass : #AccessComponent,
	#category : #'POO2-Seaside'
}

{ #category : #rendering }
RegisterComponent >> registerAndLogin [
	| anUser |
	anUser := self model addUser: username withPassword: password.
	anUser ifNotNil: [ self proceedWith: anUser ].
	self username: nil;password:nil.
]

{ #category : #rendering }
RegisterComponent >> renderBackToLogin: aCanvas [
	aCanvas button
		callback: [self answer  ];
		with:'Back to Login' 
]

{ #category : #rendering }
RegisterComponent >> renderButtonsOn: aCanvas [
	self renderSignUpButtonsOn: aCanvas.
	self renderBackToLogin: aCanvas
]

{ #category : #rendering }
RegisterComponent >> renderInputElementsOn: aCanvas [
	super renderInputElementsOn: aCanvas.
	
]

{ #category : #rendering }
RegisterComponent >> renderSignUpButtonsOn: aCanvas [
	aCanvas submitButton
		callback: [ self registerAndLogin ];
		with: 'Register'
]
