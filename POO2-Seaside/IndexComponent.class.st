Class {
	#name : #IndexComponent,
	#superclass : #WAComponent,
	#instVars : [
		'header',
		'showQuestion'
	],
	#category : #'POO2-Seaside'
}

{ #category : #callback }
IndexComponent >> askQuestion [
	self call: CreateQuestionComponent new.
	self session user isNil
		ifTrue: [ self answer ]
]

{ #category : #callback }
IndexComponent >> back [
	self answer.
]

{ #category : #initialize }
IndexComponent >> children [
 |collection|
	collection :=OrderedCollection new.
	collection add: header;add:	showQuestion .
	^ collection.
]

{ #category : #initialize }
IndexComponent >> initialize [ 
	super initialize.
	header:= HeaderComponent new.
	showQuestion := ShowQuestionsComponent new.
	header caller:self.
	
]

{ #category : #rendering }
IndexComponent >> renderAskQuestionOn: aCanvas. [
	aCanvas anchor
		callback:[self askQuestion];
		with:'Ask a Question here !'
]

{ #category : #rendering }
IndexComponent >> renderContentOn: aCanvas [
	aCanvas render: header.
	showQuestion message:'MIS PREGUNTAS FAVORITAS!  '.
	showQuestion collection: self session user relevantQuestions .
	aCanvas render: showQuestion.
	self renderAskQuestionOn: aCanvas
]
