Class {
	#name : #QuestionComponent,
	#superclass : #WAComponent,
	#instVars : [
		'header',
		'topics'
	],
	#category : #'POO2-Seaside'
}

{ #category : #initialization }
QuestionComponent >> initialize [
	super initialize.
	header := HeaderComponent new.
	topics:=Set new.
	header caller: self
]

{ #category : #callback }
QuestionComponent >> logout [
	 self answer.
]

{ #category : #rendering }
QuestionComponent >> renderAddListOn: aCanvas withModel: aModel [
	aCanvas
		form: [ aCanvas
				paragraph: [ aCanvas text: 'Seleccionar topicos'.
					aCanvas select
						list: (aModel topics collect: [ :each | each name ]);
						callback: [ :value | self topics: value ] ].
			aCanvas submitButton with: 'agregar' ]
]

{ #category : #rendering }
QuestionComponent >> renderContentOn: aCanvas [
	| model |
	model := CuOOra soleInstance.
	aCanvas render: header.
	self renderAddListOn: aCanvas withModel: model .
	self renderDeleteListOn: aCanvas.
]

{ #category : #rendering }
QuestionComponent >> renderDeleteListOn: aCanvas [
	aCanvas
		form: [ aCanvas
				paragraph: [ aCanvas text: 'Deseleccionar topicos'.
					aCanvas select
						list: topics;
						callback: [ :value | self topicsDelete: value ] ].
			aCanvas submitButton with: 'borrar' ]
]

{ #category : #accessing }
QuestionComponent >> topics [
	^ topics
]

{ #category : #accessing }
QuestionComponent >> topics: anObject [
	topics add: anObject.
]

{ #category : #accessing }
QuestionComponent >> topicsDelete: aString [
	topics := topics reject: [ :each | each = aString ]
]
