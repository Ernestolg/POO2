Class {
	#name : #CuOOraSetTest,
	#superclass : #TestCase,
	#instVars : [
		'cuoora'
	],
	#category : #'POO2-Test'
}

{ #category : #running }
CuOOraSetTest >> setUp [
	super setUp.
	cuoora:= CuOOra new.
]

{ #category : #running }
CuOOraSetTest >> tearDown [ 
	super tearDown 
]

{ #category : #running }
CuOOraSetTest >> testAddTopic [
	self assert: cuoora topics size equals: 0.
	cuoora addTopic: 'Testing' withDescription:'Just a test' .
	self assert: cuoora topics size equals: 1.
	self
		assert: (cuoora topics anySatisfy: [ :each | each name = 'Testing' ]).
	cuoora addTopic: 'Testing' withDescription:'Another test'  .
	self assert: cuoora topics size equals: 1.
	self
		assert: (cuoora topics anySatisfy: [ :each | each description  = 'Just a test' ])
]

{ #category : #running }
CuOOraSetTest >> testAddUser [
	self assert: cuoora users size equals: 0.
	cuoora addUser: 'Ernesto' withPassword: '123'.
	self assert: cuoora users size equals: 1.
	self
		assert: (cuoora users anySatisfy: [ :each | each name = 'Ernesto' ]).
	cuoora addUser: 'Ernesto' withPassword: '345'.
	self assert: cuoora users size equals: 1.
	self
		assert: (cuoora users anySatisfy: [ :each | each password = '123' ])
]

{ #category : #running }
CuOOraSetTest >> testUserWithName [
 |result|
	cuoora addUser: 'Ernesto' withPassword: '123'.
	self assert: cuoora users size equals:1.
	result:= cuoora myUserWithName: 'Ernesto' protectedBy:'123' .
	self assert: result name equals: cuoora users first name.
	result:= cuoora myUserWithName: 'Pepe' protectedBy: '123'.
	self assert: result  equals: nil.
	result:= cuoora myUserWithName: 'Ernesto' protectedBy:'kayak'.
	self assert: result  equals:nil. 
]
