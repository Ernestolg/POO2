Class {
	#name : #CreateReplyComponent,
	#superclass : #WAComponent,
	#instVars : [
		'header',
		'question',
		'respuesta'
	],
	#category : #'POO2-UI'
}

{ #category : #rendering }
CreateReplyComponent >> crearRespuesta [
	self session user
		replyQuestion: self question
		withText: self respuesta.
		self respuesta: nil.
]

{ #category : #accessing }
CreateReplyComponent >> header [
	^ header
]

{ #category : #accessing }
CreateReplyComponent >> header: anObject [
	header := anObject
]

{ #category : #accessing }
CreateReplyComponent >> question [
	^ question
]

{ #category : #accessing }
CreateReplyComponent >> question: anObject [
	question := anObject
]

{ #category : #rendering }
CreateReplyComponent >> renderContentOn: aCanvas [
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
CreateReplyComponent >> respuesta [
	^ respuesta
]

{ #category : #accessing }
CreateReplyComponent >> respuesta: anObject [
	respuesta := anObject
]
