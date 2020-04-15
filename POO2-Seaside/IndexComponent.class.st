Class {
	#name : #IndexComponent,
	#superclass : #WAComponent,
	#category : #'POO2-Seaside'
}

{ #category : #rendering }
IndexComponent >> renderContentOn: aCanvas [
	aCanvas heading: 'HOLA USUARIO : ' , self session user name.
	aCanvas
		paragraph: [ aCanvas anchor
				callback: [ self answer ];
				with: [ aCanvas button with: 'DESLOGUEAME' ] ]
]
