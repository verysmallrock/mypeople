module.exports = {
    doTest: ->
        alert('hey')

    hasStore: (key) ->
        localStorage.getItem(key)?

    store: (key, dataString) ->
        localStorage.setItem(key, dataString)

    retrieve: (key, dataString) ->
        localStorage.getItem(key)

    resetData: (key) ->
        localStorage.reset(key)
}