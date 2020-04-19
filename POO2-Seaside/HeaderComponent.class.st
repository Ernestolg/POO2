Class {
	#name : #HeaderComponent,
	#superclass : #WAComponent,
	#instVars : [
		'caller'
	],
	#category : #'POO2-Seaside'
}

{ #category : #accessing }
HeaderComponent >> caller [
	^ caller
]

{ #category : #accessing }
HeaderComponent >> caller: anObject [
	caller := anObject
]

{ #category : #rendering }
HeaderComponent >> initialize:aComponent [
	super initialize.
	caller:= aComponent.
]

{ #category : #callback }
HeaderComponent >> renderBackButtonOn: aCanvas [
	aCanvas
		paragraph: [ aCanvas anchor
				callback: [ caller back ];
				with: 'Go back!' ]
]

{ #category : #rendering }
HeaderComponent >> renderContentOn: aCanvas [
	aCanvas
		paragraph: [ aCanvas heading
				level: 2;
				with: 'Bienvenido a CuOOra !'.
			self renderLogoutOn: aCanvas ].
	aCanvas
		horizontalRule;
		horizontalRule
]

{ #category : #rendering }
HeaderComponent >> renderLogoutOn: aCanvas [
	aCanvas
		paragraph: [ aCanvas text: self session user name.
			aCanvas space: 10.
			aCanvas anchor
				callback: [ self session userLogout.
					caller back ];
				with: [ aCanvas button with: 'DESLOGUEAME' ] ]
]
