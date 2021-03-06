"
A TablePresenter handles a table.
Tables defines columns (see #addColumn: and TableColumn hierarchy).
Tables receive items (see #items:) to feed the table.

self example

"
Class {
	#name : #TablePresenter,
	#superclass : #TableBasePresenter,
	#instVars : [
		'itemsHolder'
	],
	#category : #'Spec-Core-Widgets-Table'
}

{ #category : #specs }
TablePresenter class >> adapterName [

	^ #TableAdapter
]

{ #category : #example }
TablePresenter class >> example [
	<sampleInstance>
	
	^ self new
		addColumn: (ImageTableColumn title: 'Icon' evaluated: #systemIcon);
		addColumn: (StringTableColumn title: 'Name' evaluated: #name);
		items: Smalltalk allClasses;
		openWithSpec
]

{ #category : #example }
TablePresenter class >> exampleEditableCell [

	self flag: #TODO
]

{ #category : #initialization }
TablePresenter >> initialize [ 

	super initialize.
	itemsHolder := #() asValueHolder.
	itemsHolder whenChangedDo: [ self itemsChanged ].	
]

{ #category : #accessing }
TablePresenter >> itemAt: aNumber [
	
	^ self items at: aNumber
]

{ #category : #accessing }
TablePresenter >> items [

	^ itemsHolder value
]

{ #category : #accessing }
TablePresenter >> items: aSequenceableCollection [

	itemsHolder value: aSequenceableCollection
]

{ #category : #private }
TablePresenter >> itemsChanged [

	self changed: #items
]
