Class {
	#name : #UserComponent,
	#superclass : #WAComponent,
	#instVars : [
		'user',
		'showQuestion',
		'header'
	],
	#category : #'POO2-UI'
}

{ #category : #accessing }
UserComponent >> back [
	self answer.
	
]

{ #category : #rendering }
UserComponent >> children [
 |collection|
	collection :=OrderedCollection new.
	collection add: header;add:	showQuestion .
	^ collection.
]

{ #category : #rendering }
UserComponent >> followUser [
	self session user follow: self user.
]

{ #category : #initialize }
UserComponent >> initialize [
	super initialize.
	showQuestion := ShowQuestionsComponent new.
	header := HeaderComponent new.
	header caller: self
]

{ #category : #accessing }
UserComponent >> renderBackButtonOn: aCanvas [
	aCanvas anchor
		callback: [ self back ];
		with: 'Volver !'
]

{ #category : #rendering }
UserComponent >> renderContentOn: aCanvas [
	aCanvas render:header.
	self renderBackButtonOn: aCanvas.
	showQuestion message:'PERFIL DE : ',user name .
	showQuestion collection: user questions.	
	aCanvas paragraph:[self renderFollowOn:aCanvas].
	aCanvas render: showQuestion .
]

{ #category : #rendering }
UserComponent >> renderFollowButtonOn: aCanvas [
	aCanvas anchor
		callback: [ self followUser ];
		with: 'FOLLOW !'
]

{ #category : #rendering }
UserComponent >> renderFollowOn: aCanvas [
	(self session user isFollower: user)
		ifTrue: [ self renderUnfollowButtonOn: aCanvas ]
		ifFalse: [ self renderFollowButtonOn: aCanvas ]
]

{ #category : #rendering }
UserComponent >> renderUnfollowButtonOn: aCanvas [
		aCanvas anchor
		callback: [ self unfollowUser ];
		with: 'UNFOLLOW !'
]

{ #category : #accessing }
UserComponent >> showQuestion [
	^ showQuestion
]

{ #category : #accessing }
UserComponent >> showQuestion: anObject [
	showQuestion := anObject
]

{ #category : #rendering }
UserComponent >> unfollowUser [
	self session user unfollow: self user.
]

{ #category : #accessing }
UserComponent >> user [
	^ user
]

{ #category : #accessing }
UserComponent >> user: anObject [
	user := anObject
]
