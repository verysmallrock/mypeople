import styles from './appmenu.scss'
import { withStyles } from '@material-ui/core/styles';
import BottomNavigation from '@material-ui/core/BottomNavigation';
import BottomNavigationAction from '@material-ui/core/BottomNavigationAction';
import PersonRounded from '@material-ui/icons/PersonRounded';
import GroupRounded from '@material-ui/icons/GroupRounded';
import PersonOutlined from '@material-ui/icons/PersonOutlined';

export default class AppMenu extends React.Component
    state:
        value: 0

    handleChange: (event, value) ->
        @setState({ value })

    render: ->
        value = @state.value
        <div className={ styles.menu } >
            <BottomNavigation showLabels onChange={@handleChange.bind(@)} value={value} >
                <BottomNavigationAction label='Archetypes' icon={ <PersonOutlined /> } />
                <BottomNavigationAction label='People' icon={ <PersonRounded /> } />
                <BottomNavigationAction label='Relationships' icon={ <GroupRounded />} />
            </BottomNavigation>
        </div>