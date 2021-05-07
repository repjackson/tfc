if Meteor.isClient
    Router.route '/orders', (->
        @render 'orders'
        ), name:'orders'

    Template.orders.onCreated ->
        # @autorun -> Meteor.subscribe 'model_docs', 'service'
        # @autorun -> Meteor.subscribe 'model_docs', 'rental'
        @autorun -> Meteor.subscribe 'model_docs', 'menu_section'
        @autorun -> Meteor.subscribe 'model_docs', 'order'
        @autorun -> Meteor.subscribe 'model_docs', 'dish'
        # @autorun -> Meteor.subscribe 'users'

    # Template.delta.onRendered ->
    #     Meteor.call 'log_view', @_id, ->

    Template.orders.helpers
        top_food: ->
            Docs.find
                model:'food'

        menu_sections: ->
            Docs.find
                model:'menu_section'

        # top_services: ->
        #     Docs.find
        #         model:'service'

        orders: ->
            Docs.find {
                model:'order'
            }, sort: _timestamp:-1