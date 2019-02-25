export default class BaseModel
    constructor: (@key) ->
        @key ?= Math.floor(Math.random() * 1000)
    
    toString: ->
        return @key.toString()

    getName: ->
        @key.toString()