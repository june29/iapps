class IApps
  constructor: ->
    @query    = ko.observable()
    @apps     = ko.observableArray()
    @selected = ko.observable()
    @loading  = ko.observable(false)

  search: =>
    return if @query().length == 0

    $.ajax
      url: "/search"
      data:
        query: @query()
      dataType: "json"
      beforeSend: =>
        @loading(true)
        @selected(null)
        @apps.removeAll()
    .done (data) =>
      for result in data.results
        do (result) =>
          @apps.push(result)
    .always () =>
      @loading(false)

  select: (app) =>
    @selected(app)

$ ->
  ko.applyBindings(new IApps())

  $(window).on "load resize", ->
    $("#selected").height($(window).height() - 20)
