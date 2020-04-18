Class {
	#name : #QuestionComponent,
	#superclass : #WAComponent,
	#instVars : [
		'header',
		'question'
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
	header:= HeaderComponent new.
	header caller:self.
	
]

{ #category : #initialization }
QuestionComponent >> initialize: aQuestion [
	self initialize.
	header := HeaderComponent new.
	question := aQuestion
]

{ #category : #accessing }
QuestionComponent >> question [
	^ question
]

{ #category : #accessing }
QuestionComponent >> question: anObject [
	question := anObject
]

{ #category : #initialization }
QuestionComponent >> renderContentOn: aCanvas [
	aCanvas render:header.
	aCanvas
		paragraph: [ aCanvas
				text: 'ESTO ES LA PREGUNTA   :';
				space: 10;
				text: self question title ]
]
