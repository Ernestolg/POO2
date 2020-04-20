Class {
	#name : #CreateAnswerComponent,
	#superclass : #WAComponent,
	#instVars : [
		'header',
		'question',
		'respuesta'
	],
	#category : #'POO2-Seaside'
}

{ #category : #rendering }
CreateAnswerComponent >> crearRespuesta [
	| reply |
	reply := self session user
		replyQuestion: self question
		withText: self respuesta.
	self answer.
]

{ #category : #accessing }
CreateAnswerComponent >> header [
	^ header
]

{ #category : #accessing }
CreateAnswerComponent >> header: anObject [
	header := anObject
]

{ #category : #accessing }
CreateAnswerComponent >> question [
	^ question
]

{ #category : #accessing }
CreateAnswerComponent >> question: anObject [
	question := anObject
]

{ #category : #rendering }
CreateAnswerComponent >> renderContentOn: aCanvas [
	aCanvas
		form: [ aCanvas
				paragraph: [ aCanvas strong: 'Respuesta  :'.
					aCanvas space: 5.
					(aCanvas textArea on: #respuesta of: self)
						columns: 20;
						rows: 2 ].
			aCanvas submitButton
				callback: [ self crearRespuesta ];
				with: 'Enviar !' ]
]

{ #category : #accessing }
CreateAnswerComponent >> respuesta [
	^ respuesta
]

{ #category : #accessing }
CreateAnswerComponent >> respuesta: anObject [
	respuesta := anObject
]
