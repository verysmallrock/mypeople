export default class BaseModel
    constructor: (@key) ->
        @key ?= Math.floor(Math.random() * 1000)
    
    toString: ->
        return @key.toString()

    getName: ->
        if @name?
            @name.toString()
        else
            @key.toString()

    save: ->
        @serialize()

    # return an object that can be stringified
    serialize: ->
        @

    # turn an object into yourself 
    deserialize: (data) ->
        for prop in Object.getOwnPropertyNames(@)
            @[prop] = data[prop]
        @