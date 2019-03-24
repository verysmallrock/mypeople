import Relationship from './relationship'
import Relationships from './relationships'
import RelationshipType from './relationshiptype'
import RelationshipTypes from './relationshiptypes'
import Person from './person'
import Persons from './persons'
import PersonType from './persontype'
import PersonTypes from './persontypes'

export default class AppState
    STORAGE_KEY: 'appState'
    view:
        selectedView: 0
    personTypes: null
    persons: null
    relationshipTypes: null
    relationships: null
    dummyList: [
        1,2,3,4,5,6
    ]

    app: null

    setItemEditState: (item) ->
        @view.selectedView = 3
        @currentEditingItem = item
        @reRender()

    initializeRelationships: ->
        @relationshipTypes = new RelationshipTypes()
        @relationshipTypes.add(new RelationshipType())
        @relationshipTypes.add(new RelationshipType())
        @relationshipTypes.add(new RelationshipType())

        @relationships = new Relationships()
        @relationships.add(new Relationship('Friend'))
        @relationships.add(new Relationship('Partner'))

    initializePeople: ->
        @personTypes = new PersonTypes()
        @personTypes.add(new PersonType())
        @personTypes.add(new PersonType())
        @personTypes.add(new PersonType())

        @persons = new Persons()
        @persons.add(luke = new Person('Luke'))
        @persons.add(new Person('Tiffany'))
        @persons.add(new Person('Charles'))

    constructor: (@app) ->
        if AppHelper.hasStore(@STORAGE_KEY)
            @load()
        else
            @initializeRelationships()
            @initializePeople()
        
        window.appState = @

    save: ->
        AppHelper.store(@STORAGE_KEY, JSON.stringify(@serialize()))

    # return an object that can be stringified
    serialize: ->
        storedData = {}
        storedData.view = @view

        storedData.personTypes = @personTypes.serialize()
        storedData.persons = @persons.serialize()
    
        storedData.relationshipTypes = @relationshipTypes.serialize()
        storedData.relationships = @relationships.serialize()

        storedData

    # turn a jsonString into yourself
    deserialize: (dataString) ->
        @relationshipTypes ?= new RelationshipTypes()
        @relationships ?= new Relationships()
        @personTypes ?= new PersonTypes()
        @persons ?= new Persons()

        data = JSON.parse(dataString)
        @view = data.view

        @personTypes.deserialize(data.personTypes)
        @persons.deserialize(data.persons)
    
        @relationshipTypes.deserialize(data.relationshipTypes)
        @relationships.deserialize(data.relationships)
        @

    load: ->
        storedData = AppHelper.retrieve(@STORAGE_KEY)  
        @deserialize(storedData)
        @

    reRender: ->
        @app?.forceUpdate?()
        @save()