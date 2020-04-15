Class {
	#name : #RegisComponent,
	#superclass : #AccessComponent,
	#category : #'POO2-Seaside'
}

{ #category : #rendering }
RegisComponent >> registerAndLogin [
	| anUser |
	anUser := self model addUser: username withPassword: password.
	anUser ifNotNil: [ self proceedWith: anUser ].
	self username: nil;password:nil.
]

{ #category : #rendering }
RegisComponent >> renderBackToLogin: aCanvas [
	aCanvas button
		callback: [self answer  ];
		with:'Back to Login' 
]

{ #category : #rendering }
RegisComponent >> renderButtonsOn: aCanvas [
	self renderSignUpButtonsOn: aCanvas.
	self renderBackToLogin: aCanvas
]

{ #category : #rendering }
RegisComponent >> renderInputElementsOn: aCanvas [
	super renderInputElementsOn: aCanvas.
	
]

{ #category : #rendering }
RegisComponent >> renderSignUpButtonsOn: aCanvas [
	aCanvas submitButton
		callback: [ self registerAndLogin ];
		with: 'Register'
]
