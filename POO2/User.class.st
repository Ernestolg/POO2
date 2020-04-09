"
Class
------------------
It represents an User

Responsibilities
__________________
- User scoring
- Create and delete questions.
- Follow other users
- Reply a question.

Related with
__________________
Each user has a collection of his own questions and replies. Also, the user has a collection of favorite topics.


"
Class {
	#name : #User,
	#superclass : #Object,
	#instVars : [
		'name',
		'password',
		'creationDate',
		'creationTime',
		'questions',
		'replies',
		'favTopics',
		'followers'
	],
	#category : #POO2
}

{ #category : #initialization }
User class >> create:aUsername withPassword:aPassword [
^self new initialize:aUsername withPassword:aPassword.
]

{ #category : #'adding elements' }
User >> addFavTopic:topic [
	favTopics add: topic.
 
]

{ #category : #'adding elements' }
User >> addFollower: anUser [
	followers add: anUser.
]

{ #category : #'adding elements' }
User >> askQuestion: title withText:aText withTopics: aTopicsCollection [
	| aQuestion |
	aQuestion := Question create: title withTopics: aTopicsCollection withText: aText withAuthor: self.
	questions add: aQuestion.
	^aQuestion.
]

{ #category : #'accessing values' }
User >> creationDate [
	^ creationDate
]

{ #category : #'accessing values' }
User >> creationTime [
	^ creationTime
]

{ #category : #'accessing values' }
User >> favTopics [
	^favTopics.
]

{ #category : #'adding elements' }
User >> follow:anUser [
 anUser addFollower: self.
]

{ #category : #'accessing values' }
User >> followers [
	^ followers
]

{ #category : #callback }
User >> followingUser:anUser [ 
	^ followers anySatisfy: [ :user | user username == anUser username ].
]

{ #category : #initialization }
User >> initialize:nameUser withPassword:passUser [

name:=nameUser.
password:=passUser.
creationDate:= Date today.
creationTime:= Time now.
followers := OrderedCollection new .
questions := OrderedCollection new.
replies  := OrderedCollection new.
favTopics := OrderedCollection new.
]

{ #category : #callback }
User >> interactionScoring [
	"It retrives the difference between likes and dislikes of user posts (questions or replies)"
	| questionReactionScore replyReactionScore |
	
	questionReactionScore := questions inject: 0 into: [ :question | question score ].
	replyReactionScore := replies inject: 0 into: [ :reply | reply score ].  
	
	^ (questionReactionScore + replyReactionScore ).
]

{ #category : #callback }
User >> isFavoriteTopic: aTopicsCollection [

	^ (aTopicsCollection anySatisfy: [ :topic | favTopics includes: [ :favTopic | favTopic name == topic name ] ]).
]

{ #category : #callback }
User >> isFollower: anUser [
	^ (followers anySatisfy: [:follower | follower username == anUser username]).
]

{ #category : #callback }
User >> itsMe:name2 [
	"respondo si soy el usuario que recibo"
	^ name=name2.
]

{ #category : #callback }
User >> itsMyTopic: aTopicName [
	^ favTopics includes: [ :topic | topic name == aTopicName ].
]

{ #category : #callback }
User >> itsMyUser:aUser [
	"respondo si soy el usuario que recibo"
	^ (aUser itsMe:name).
]

{ #category : #'accessing values' }
User >> name [
	^ name
]

{ #category : #'accessing values' }
User >> password [
	^ password
]

{ #category : #callback }
User >> postScoring [

	^ (self replyScoring + self questionScoring).
]

{ #category : #callback }
User >> questionScoring [

	^ (questions size) * 20.
]

{ #category : #'accessing values' }
User >> questions [
	^ questions
]

{ #category : #callback }
User >> relevantQuestion [
"en una coleccion auxiliar recolecto todaslas preguntas de los topicos favoritos
 y de los usuarios que sigo y  la devuelvo"
|questionsSet|
	questionsSet:=Set new.
	favTopics ifNotEmpty:[ favTopics do: [:each| each myQuestions:questionsSet]].
	followers ifNotEmpty: [ followers do: [ :each| each myQuestions: questionsSet ]].	
	^questionsSet.
]

{ #category : #callback }
User >> relevantQuestion:anUser [
	questions ifNotEmpty: [ questions select: [ :question | question relevant: anUser ] ]
]

{ #category : #remove }
User >> removeQuestion:aQuestion [
	questions detect: [ :question | question text == aQuestion text ] 
							ifFound: [ self removeReply: aQuestion ] 
							ifNone: [ ^ nil ].

]

{ #category : #remove }
User >> removeReplies:aQuestion [
	aQuestion replies do: [ :reply | replies remove: reply].
]

{ #category : #remove }
User >> removeReply:aReply [
 replies remove:aReply.

]

{ #category : #'accessing values' }
User >> replies [
	^ replies  
]

{ #category : #'adding elements' }
User >> replyQuestion: aQuestion text: text [
	"creo una instancia de respuesta y la cargo a mis respuestas"

	| answer |
	answer := Reply create: self text: text question: aQuestion.
	replies add: answer.
	^answer.
]

{ #category : #'adding elements' }
User >> replyQuestion: aQuestion withText: aText [

	| aReply |
	aReply  := Reply create: self withText: aText withQuestion: aQuestion.
	replies add: aReply.
	^aReply.
]

{ #category : #callback }
User >> replyScoring [

	^ (replies size) * 50.
]

{ #category : #callback }
User >> score [ 
 |score|
	score:=0.
	score := self postScoring + self interactionScoring  .	
	^score.
	
]
