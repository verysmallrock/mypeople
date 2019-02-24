import AppView from 'view/appview'
import AppNav from 'view/appnav'
import AppMenu from 'view/appmenu'
import AppState from 'model/appstate'
import ItemListView from 'view/itemlistview.cjsx'

export default class Application extends React.Component
  constructor: ->
    super()
    @appState = new AppState(@)

  renderMainView: (view) ->
    switch view
      when 0 then <ItemListView items={@appState.people} />
      when 1 then <ItemListView items={@appState.relationships} />
      when 2 then <ItemListView items={@appState.dummyList} />
      else <div> dunno</div>

  getTitle: (view) ->
    switch view
      when 0 then 'People'
      when 1 then 'Relationships'
      when 2 then 'Graph'
      else ''

  render: ->
    currentView = @appState.view.selectedView

    <AppView>
      <AppNav title={@getTitle(currentView)} />
      <AppMenu appState={@appState} />
      { @renderMainView(currentView) }
    </AppView>
      