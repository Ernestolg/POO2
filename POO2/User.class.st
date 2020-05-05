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
		'questions',
		'replies',
		'favTopics',
		'followers'
	],
	#category : #'POO2-Model'
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
User >> addRelevant:aSet [

aSet addAll: self questions.
^aSet.
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

{ #category : #callback }
User >> dislike: aPost [
	aPost dislike: self
]

{ #category : #'accessing values' }
User >> favTopics [
	^favTopics.
]

{ #category : #'adding elements' }
User >> follow:anUser [
 followers add: anUser.
]

{ #category : #'accessing values' }
User >> followers [
	^ followers
]

{ #category : #initialization }
User >> initialize:nameUser withPassword:passUser [

name:=nameUser.
password:=passUser.
creationDate:= DateAndTime now.
followers := OrderedCollection new .
questions := OrderedCollection new.
replies  := OrderedCollection new.
favTopics := OrderedCollection new.
]

{ #category : #callback }
User >> interactionScoring [
	"It retrives the difference between likes and dislikes of user posts (questions or replies)"
	| questionReactionScore replyReactionScore |
	
	questionReactionScore := questions inject: 0 into: [:total :question | total + question score ].
	replyReactionScore := replies inject: 0 into: [:total :reply | total + reply score ].  
	
	^ (questionReactionScore + replyReactionScore ).
]

{ #category : #callback }
User >> isFollower: anUser [
	^ (followers anySatisfy: [:follower | (follower itsMe:  anUser name)]).
]

{ #category : #callback }
User >> itsMe:name2 [
	"respondo si soy el usuario que recibo"
	^ name=name2.
]

{ #category : #callback }
User >> like: aPost [
	aPost like: self.
]

{ #category : #'accessing values' }
User >> name [
	^ name
]

{ #category : #'accessing values' }
User >> password [
	^ password
]

{ #category : #'accessing values' }
User >> postScoring [

	^ (self replyScoring + self questionScoring).
]

{ #category : #'adding elements' }
User >> protected:aString [
	^ (self password=aString).
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
User >> relevantQuestions [
	| questionsSet collection |
	collection := SortedCollection
		sortBlock: [ :a :b | a creationDate > b creationDate ].
	questionsSet := Set new.
	favTopics do: [ :each | each addRelevant: questionsSet ].
	followers do: [ :each | each addRelevant: questionsSet ].
	collection addAll: questionsSet.
	^ collection
]

{ #category : #remove }
User >> removeQuestion: aQuestion [
"Primero me aseguro que la pregunta a borrar sea parte de mis preguntas, luego mando el borrado
en cascada para que la pregunta se encarge de borrarse junto con sus interacciones y respuestas
luego la borro de mi coleccion"
	questions
		detect: [ :question | question text == aQuestion text ]
		ifFound: [ aQuestion removeMe.
			questions := questions remove: aQuestion ]
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
User >> replyQuestion: aQuestion withText: aText [
	| aReply |
	aReply := Reply create: self withText: aText withQuestion: aQuestion.
	replies add: aReply.
	^ aReply
]

{ #category : #callback }
User >> replyScoring [
	^ replies sum: [ :each | each pointsWithoutUser ]
]

{ #category : #'accessing values' }
User >> score [ 
	
	^ (self postScoring  + self interactionScoring)
	
]

{ #category : #callback }
User >> unfollow: anUser [
	followers := followers reject: [ :each | each itsMe: anUser name]
]
