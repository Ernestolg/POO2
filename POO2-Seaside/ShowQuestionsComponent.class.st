Class {
	#name : #ShowQuestionsComponent,
	#superclass : #WAComponent,
	#instVars : [
		'collection',
		'message'
	],
	#category : #'POO2-Seaside'
}

{ #category : #accessing }
ShowQuestionsComponent >> collection [
	^ collection
]

{ #category : #accessing }
ShowQuestionsComponent >> collection: anObject [
	collection := anObject asOrderedCollection .
]

{ #category : #callback }
ShowQuestionsComponent >> goToQuestion: aQuestion [
	| aComponent |
	aComponent := QuestionComponent new.
	aComponent question: aQuestion.
	self call: aComponent.
	self session user isNil
		ifTrue: [ self answer ]
]

{ #category : #callback }
ShowQuestionsComponent >> goToUser: aUser [
	| aComponent |
	aComponent := UserComponent new.
	aComponent user: aUser.
	self call: aComponent.
	self session user isNil
		ifTrue: [ self answer ]
]

{ #category : #accessing }
ShowQuestionsComponent >> message [
	^ message
]

{ #category : #accessing }
ShowQuestionsComponent >> message: anObject [
	message := anObject
]

{ #category : #rendering }
ShowQuestionsComponent >> renderButtonsOn: aCanvas withQuestion: aQuestion [
	aCanvas anchor
		callback: [ aQuestion dislike: self session user ];
		with:  aQuestion dislikes asString,'  dislikes'.
	aCanvas text:' | '.
	aCanvas anchor
		callback: [ aQuestion like: self session user ];
		with: aQuestion likes asString,'  likes'
]

{ #category : #rendering }
ShowQuestionsComponent >> renderCollectionOn: aCanvas [
	aCanvas
		unorderedList: [ collection
				do: [ :each | 
					aCanvas
						listItem: [ self renderQuestionOn: aCanvas withQuestion: each ].
					self renderStructureOn: aCanvas withString: '' ] ]
]

{ #category : #rendering }
ShowQuestionsComponent >> renderContentOn: aCanvas [
	self renderStructureOn: aCanvas withString: message.
	self renderCollectionOn: aCanvas
]

{ #category : #rendering }
ShowQuestionsComponent >> renderQuestionOn: aCanvas withQuestion: question [
	aCanvas
		paragraph: [ aCanvas anchor
				callback: [ self goToQuestion: question ];
				with: question title ].
	aCanvas
		paragraph: [ aCanvas
				text: 'realizada por :   ';
				space: 2.
			aCanvas anchor
				callback: [ self goToUser: question user ];
				with: question user name ].
	self renderButtonsOn: aCanvas withQuestion: question
]

{ #category : #rendering }
ShowQuestionsComponent >> renderStructureOn: aCanvas withString: aString [
	aCanvas
		strong: aString;
		horizontalRule
]
