Class {
	#name : #SessionWithUser,
	#superclass : #WASession,
	#instVars : [
		'user'
	],
	#category : #'POO2-UI'
}

{ #category : #accessing }
SessionWithUser >> user [
	^ user
]

{ #category : #accessing }
SessionWithUser >> user: anObject [
	user := anObject
]

{ #category : #accessing }
SessionWithUser >> userLogout [
	user:=nil.
]
