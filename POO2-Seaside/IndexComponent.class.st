Class {
	#name : #IndexComponent,
	#superclass : #WAComponent,
	#instVars : [
		'header'
	],
	#category : #'POO2-Seaside'
}

{ #category : #callback }
IndexComponent >> askQuestion [
	self call: QuestionComponent new.
	self session user isNil
		ifTrue: [ self answer ]
]

{ #category : #initialize }
IndexComponent >> children [
	^ {header}
]

{ #category : #initialize }
IndexComponent >> initialize [ 
	super initialize.
	header:= HeaderComponent new.
	header caller:self.
	
]

{ #category : #callback }
IndexComponent >> logout [
	self answer.
]

{ #category : #rendering }
IndexComponent >> renderAskQuestionOn: aCanvas. [
	aCanvas anchor
		callback:[self askQuestion];
		with:'Ask a Question here !'
]

{ #category : #rendering }
IndexComponent >> renderButtonsOn: aCanvas withQuestion: aQuestion [
	aCanvas anchor
		callback: [ aQuestion dislike: self session user ];
		with:  aQuestion dislikes asString,'  dislikes'.
	aCanvas text:' | '.
	aCanvas anchor
		callback: [ aQuestion like: self session user ];
		with: aQuestion likes asString,'  likes'
]

{ #category : #rendering }
IndexComponent >> renderCollectionOn: aCanvas withCollection: collection [
	aCanvas
		unorderedList: [ collection
				do: [ :each | 
					aCanvas
						listItem: [ self renderQuestionOn: aCanvas withQuestion: each ].
					self renderStructureOn: aCanvas withString: '' ] ]
]

{ #category : #rendering }
IndexComponent >> renderContentOn: aCanvas [
	aCanvas render: header.
	self
		renderStructureOn: aCanvas
		withString: 'Mis preguntas favoritas!'.
	self
		renderCollectionOn: aCanvas
		withCollection: self session user relevantQuestions.
	self renderStructureOn: aCanvas withString: ''.
	self renderAskQuestionOn: aCanvas
]

{ #category : #rendering }
IndexComponent >> renderQuestionOn: aCanvas withQuestion: question [
	aCanvas paragraph: question title.
	aCanvas
		paragraph: [ aCanvas
				text: 'realizada por :   ';
				strong: question user name ].
	self renderButtonsOn: aCanvas withQuestion: question.

]

{ #category : #rendering }
IndexComponent >> renderStructureOn: aCanvas withString: aString [
	aCanvas
		strong: aString;
		horizontalRule
]
