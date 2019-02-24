import styles from './appmenu.scss'
import { withStyles } from '@material-ui/core/styles';
import BottomNavigation from '@material-ui/core/BottomNavigation';
import BottomNavigationAction from '@material-ui/core/BottomNavigationAction';
import PersonRounded from '@material-ui/icons/PersonRounded';
import GroupRounded from '@material-ui/icons/GroupRounded';
import ScatterPlot from '@material-ui/icons/ScatterPlot';

import AppState from 'model/appstate'

export default class AppMenu extends React.Component
    handleChange: (event, value) ->
        @props.appState.view.selectedView = value
        @props.appState.reRender()
        @forceUpdate()

    render: ->
        selectedView = @props.appState.view.selectedView
        <div className={ styles.menu } >
            <BottomNavigation showLabels onChange={@handleChange.bind(@)} value={selectedView} >
                <BottomNavigationAction label='People' icon={ <PersonRounded /> } />
                <BottomNavigationAction label='Relationships' icon={ <GroupRounded />} />
                <BottomNavigationAction label='Graph' icon={ <ScatterPlot />} />
            </BottomNavigation>
        </div>