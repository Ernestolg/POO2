Class {
	#name : #QuestionComponent,
	#superclass : #WAComponent,
	#instVars : [
		'question',
		'showQuestion',
		'header',
		'answerBox'
	],
	#category : #'POO2-Seaside'
}

{ #category : #accessing }
QuestionComponent >> back [
	self answer.
]

{ #category : #initialization }
QuestionComponent >> children [
 |collection|
	collection :=OrderedCollection new.
	collection add: header;add:	showQuestion;add:answerBox .
	^ collection.
]

{ #category : #rendering }
QuestionComponent >> crearRespuesta [
	| aComponent |
	aComponent := CreateReplyComponent new.
	aComponent question: self question.
	self call: aComponent.
	self session user isNil
		ifTrue: [ self answer ]
]

{ #category : #initialization }
QuestionComponent >> initialize [
	super initialize.
	self showQuestion: ShowQuestionsComponent new.
	self question: OrderedCollection new.
	answerBox:=CreateReplyComponent new.
	header := HeaderComponent new.
	header caller: self
]

{ #category : #accessing }
QuestionComponent >> question [
	^ question
]

{ #category : #accessing }
QuestionComponent >> question: aQuestion [
	question := aQuestion 
]

{ #category : #rendering }
QuestionComponent >> renderAnswerOn: aCanvas withReply: aReply [
	aCanvas paragraph: [ aCanvas text: aReply text ].
	aCanvas
		paragraph: [ aCanvas
				text: 'realizada por :   ';
				space: 2.
			aCanvas anchor
				callback: [ showQuestion goToUser: aReply user ];
				with: aReply user name ].
	showQuestion renderButtonsOn: aCanvas withQuestion: aReply
]

{ #category : #accessing }
QuestionComponent >> renderBackButtonOn: aCanvas [
	aCanvas anchor
		callback: [ self back ];
		with: 'Volver'
]

{ #category : #rendering }
QuestionComponent >> renderCollectionAnswerOn: aCanvas [
	aCanvas
		unorderedList: [ self question replies 
				do: [ :each | 
					aCanvas
						listItem: [ self renderAnswerOn: aCanvas withReply: each ].
					aCanvas horizontalRule ] ]
]

{ #category : #rendering }
QuestionComponent >> renderContentOn: aCanvas [
	aCanvas render: header.
	self renderBackButtonOn: aCanvas.
	showQuestion collection: self question.
	aCanvas render: showQuestion.
	answerBox question:self question.
	aCanvas render: answerBox .
	aCanvas
		paragraph: [ aCanvas
				strong: 'Respuestas !';
				horizontalRule;
				break.
			self renderCollectionAnswerOn: aCanvas ]
]

{ #category : #accessing }
QuestionComponent >> showQuestion [
	^ showQuestion
]

{ #category : #accessing }
QuestionComponent >> showQuestion: anObject [
	showQuestion := anObject
]
