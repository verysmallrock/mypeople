import Relationship from './relationship'
import Relationships from './relationships'
import RelationshipType from './relationshiptype'
import RelationshipTypes from './relationshiptypes'
import Person from './person'
import Persons from './persons'
import PersonType from './persontype'
import PersonTypes from './persontypes'

export default class AppState
    view:
        selectedView: 1
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
        @relationshipTypes =  new RelationshipTypes()
        @relationshipTypes.add(new RelationshipType())
        @relationshipTypes.add(new RelationshipType())
        @relationshipTypes.add(new RelationshipType())

        @relationships = new Relationships()
        @relationships.add(new Relationship('Friend'))
        @relationships.add(new Relationship('Partner'))

    initializePeople: ->
        @personTypes =  new PersonTypes()
        @personTypes.add(new PersonType())
        @personTypes.add(new PersonType())
        @personTypes.add(new PersonType())

        @persons = new Persons()
        @persons.add(new Person('Luke'))
        @persons.add(new Person('Tiffany'))
        @persons.add(new Person('Charles'))

    constructor: (@app) ->
        @initializeRelationships()
        @initializePeople()

    reRender: ->
        @app?.forceUpdate?()