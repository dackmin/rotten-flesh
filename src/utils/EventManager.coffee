# Global RottenFlesh event emitter
# Just like your average event manager, but way better
class Rotten.EventManager


    # Constructs the event manager
    constructor: ->
        @listeners = {}

    # Add an event listener
    #
    # @param {String} name Event name
    # @param {Function} listener Callback handler
    listen: (name, listener) ->
        @listeners[name] = [] if not @listeners[name]
        if listener not in @listeners[name] then @listeners[name].push listener


    # Fire an event & execute a callback
    #
    # @param {String} name Event name
    # @param {Object} event The event object to pass to listener
    fire: (name, event) ->
        listener event for listener in @listeners[name]


    # Mute an event listener
    #
    # @param {String} name Event name
    # @param {Function} listener Callback to delete
    mute: (name, listener) ->
        index = listener in @listeners[name]
        @listeners[name].splice listener, 1 if index >= 0
