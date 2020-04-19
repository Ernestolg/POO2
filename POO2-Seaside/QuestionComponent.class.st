Class {
	#name : #QuestionComponent,
	#superclass : #WAComponent,
	#instVars : [
		'question',
		'showQuestion'
	],
	#category : #'POO2-Seaside'
}

{ #category : #accessing }
QuestionComponent >> back [
	self answer.
]

{ #category : #initialization }
QuestionComponent >> initialize [ 
	super initialize.
	self showQuestion: ShowQuestionsComponent new.
	self question:OrderedCollection new.
	
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
	aCanvas paragraph: [ aCanvas text: aReply text].
	aCanvas
		paragraph: [ aCanvas
				text: 'realizada por :   ';
				space: 2;
				text: aReply user name ].
	self renderButtonsOn: aCanvas withReply: aReply
]

{ #category : #rendering }
QuestionComponent >> renderButtonsOn: aCanvas withReply: aReply [
	aCanvas anchor
		callback: [ aReply dislike: self session user ];
		with:  aReply dislikes asString,'  dislikes'.
	aCanvas text:' | '.
	aCanvas anchor
		callback: [ aReply like: self session user ];
		with: aReply likes asString,'  likes'
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
	showQuestion collection: self question.
	aCanvas render: showQuestion.
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
