Class {
	#name : #RegisterComponent,
	#superclass : #AccessComponent,
	#category : #'POO2-UI'
}

{ #category : #rendering }
RegisterComponent >> registerAndLogin [
	| anUser |
	anUser := self model addUser: username withPassword: password.
	anUser
		ifNotNil: [ self proceedWith: anUser ]
		ifNil: [ errorMessage := 'Username  already exist' ].
		self answer.
]

{ #category : #rendering }
RegisterComponent >> renderAsegurarme: aCanvas [
	aCanvas button
		callback: [self answer  ];
		with:'Back to Login' 
]

{ #category : #rendering }
RegisterComponent >> renderButtonsOn: aCanvas [
	self renderSignUpButtonsOn: aCanvas.
	self renderAsegurarme: aCanvas.
]

{ #category : #rendering }
RegisterComponent >> renderContentOn: aCanvas [
	aCanvas heading:[aCanvas strong:'REGISTER'].
	aCanvas horizontalRule.
	super renderContentOn:aCanvas.
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
