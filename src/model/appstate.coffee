export default class AppState
    view:
        selectedView: 1
    peopleTypes: [
        1,2,3,4,5
    ]
    people: [
        1,2,3,4,5,6
    ]
    relationshipTypes: [
        1,2,3
    ]
    relationships: [
        1,2,3,4,5,6,7,8
    ]
    dummyList: [
        1,2,3,4,5,6
    ]

    app: null

    constructor: (@app) ->

    reRender: ->
        @app?.forceUpdate?()