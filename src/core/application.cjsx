import AppView from 'view/appview'
import AppNav from 'view/appnav'
import AppMenu from 'view/appmenu'
import AppState from 'model/appstate'
import ItemListView from 'view/itemlistview'
import ObjectEditor from 'view/objecteditor'

import styles from './application.scss'

export default class Application extends React.Component
  constructor: ->
    super()
    @appState = new AppState(@)

  renderMainView: (view) ->
    switch view
      when 0 then <ItemListView items={@appState.persons} state={ @appState }/>
      when 1 then <ItemListView items={@appState.relationships} state={ @appState }/>
      when 2 then <ItemListView items={@appState.dummyList} state={ @appState }/>
      when 3 then <ObjectEditor item={ @appState.currentEditingItem } />
      else <div> dunno</div>

  getTitle: (view) ->
    switch view
      when 0 then 'People'
      when 1 then 'Relationships'
      when 2 then 'Graph'
      when 3 then @appState.currentEditingItem.getTitle?() || @appState.currentEditingItem.toString?() || 'Editing Object'
      else ''

  render: ->
    currentView = @appState.view.selectedView

    <AppView>
      <AppNav title={@getTitle(currentView)} />
      <AppMenu appState={@appState} />
      <div className={ styles.appContent }>
        { @renderMainView(currentView) }
      </div>
    </AppView>
      