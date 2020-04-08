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
	"agrego mi topico favorito,que llega por parametro"
	favTopics add: topic.
 
]

{ #category : #'adding elements' }
User >> addFollower:anUser [
 "agrego este usuario como seguidor de otro pasado por parametro"
 followers add:anUser.
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

{ #category : #'accessing values' }
User >> followers [
	^ followers
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

{ #category : #'adding elements' }
User >> makeQuestion: title body: text topics: collectionT [ 
	"creo una instancia de pregunta y la agrego a mis preguntas,
	la instancia de pregunta debe tener el usuario que la hizo
	por esa razon le paso self , y tambien una coleccion de topicos"
	| aQuestion |
	aQuestion := Question
		create: title
		topics: collectionT
		desc: text
		author: self.
	questions add: aQuestion.
	^aQuestion.
]

{ #category : #callback }
User >> myScore [ 
 |score|
	score:=0.
	score := self myScoreInteraction + self myScoreLikes  .	
	^score.
	
]

{ #category : #callback }
User >> myScoreInteraction [
	"cuento todas las preguntas (valen 20 puntos) y cada respuesta de otro usuario
 a esas preguntas, que valen 50"

	| scoreAux |
	scoreAux :=  (questions size *20).
	replies isNotEmpty ifTrue: [ scoreAux:= scoreAux + (replies sum:[:each|each pointsWithoutUser]) ].
	^scoreAux 
]

{ #category : #callback }
User >> myScoreLikes [
	"cuento todos los likes en las interacciones del user"

	| scoreAux |
	scoreAux := 0.
	questions
		ifNotEmpty: [ scoreAux := scoreAux + (questions sum: [ :each | each score ]) ].
	replies
		ifNotEmpty: [ scoreAux := scoreAux  + (replies sum: [ :each | each score ]) ].
	^ scoreAux 
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

{ #category : #remove }
User >> removeQuestion:aQuestion [
	questions detect: [ :question | question text == aQuestion text ] 
							ifFound: [ self removeReply: aQuestion ] 
							ifNone: [ ^ nil ].

]

{ #category : #removing }
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
