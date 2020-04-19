Class {
	#name : #CreateQuestionComponent,
	#superclass : #WAComponent,
	#instVars : [
		'header',
		'topics',
		'text',
		'title'
	],
	#category : #'POO2-Seaside'
}

{ #category : #callback }
CreateQuestionComponent >> back [
	 self answer.
]

{ #category : #callback }
CreateQuestionComponent >> cargarPregunta [
	self session user
		askQuestion: title
		withText: text
		withTopics: topics.
	self answer
]

{ #category : #initialization }
CreateQuestionComponent >> initialize [
	super initialize.
	header := HeaderComponent new.
	header caller: self.
	topics := Set new
]

{ #category : #rendering }
CreateQuestionComponent >> renderAddListOn: aCanvas withCollection: aCollection [
	aCanvas
		form: [ aCanvas
				paragraph: [ aCanvas text: 'Seleccionar topicos'.
					aCanvas select
						list: (aCollection );
						callback: [ :value | self topics: value ] ].
			aCanvas submitButton with: 'agregar' ]
]

{ #category : #rendering }
CreateQuestionComponent >> renderContentOn: aCanvas [
	| model |
	model := CuOOra soleInstance.
	aCanvas render: header.
	self renderAddListOn: aCanvas withCollection:model topics. 
	self renderDeleteListOn: aCanvas.
	aCanvas
		form: [ self renderTextBoxOn: aCanvas.
			aCanvas submitButton
				callback: [self cargarPregunta ];
				with: 'Listo !' ]
]

{ #category : #rendering }
CreateQuestionComponent >> renderDeleteListOn: aCanvas [
	aCanvas
		form: [ aCanvas
				paragraph: [ aCanvas text: 'Deseleccionar topicos  :'.
					aCanvas space: 5.
					aCanvas select
						list: topics;
						callback: [ :value | self topicsDelete: value ] ].
			aCanvas space: 40.
			aCanvas submitButton with: 'borrar' ]
]

{ #category : #rendering }
CreateQuestionComponent >> renderTextBoxOn: aCanvas [
	aCanvas
		paragraph: [ aCanvas strong: 'TITLE  :'.
			aCanvas space:5.
			(aCanvas textArea on: #title of: self)
				columns: 20;
				rows: 2 ].
	aCanvas
		paragraph: [ aCanvas strong: 'BODY  :'.
			aCanvas space:5.
			(aCanvas textArea on: #text of: self)
				columns: 80;
				rows: 5 ]
]

{ #category : #accessing }
CreateQuestionComponent >> text [
	^ text
]

{ #category : #accessing }
CreateQuestionComponent >> text: anObject [
	text := anObject
]

{ #category : #accessing }
CreateQuestionComponent >> title [
	^ title
]

{ #category : #accessing }
CreateQuestionComponent >> title: anObject [
	title := anObject
]

{ #category : #accessing }
CreateQuestionComponent >> topics [
	^ topics
]

{ #category : #accessing }
CreateQuestionComponent >> topics: anObject [
	topics add: anObject.
]

{ #category : #accessing }
CreateQuestionComponent >> topicsDelete: aString [
	topics := topics reject: [ :each | each = aString ]
]
