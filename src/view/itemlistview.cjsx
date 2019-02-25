import AppState from 'model/appstate'
import PropTypes from 'prop-types';
import { withStyles } from '@material-ui/core/styles';
import List from '@material-ui/core/List';
import ListItem from '@material-ui/core/ListItem';
import ListItemIcon from '@material-ui/core/ListItemIcon';
import ListItemText from '@material-ui/core/ListItemText';
import StarIcon from '@material-ui/icons/Star';

styles = (theme) =>
  root:
    width: '100%'
    maxWidth: 360
    backgroundColor: theme.palette.background.paper
  

export default class ItemListView extends React.Component 
    handleItemClick: (e, item) ->
        @props.state.setItemEditState(item)

    makeListItem: (data) ->
        <ListItem button key={ data.key } onClick={ (event) => @handleItemClick(event, data) }>
            <ListItemIcon>
                <StarIcon />
            </ListItemIcon>
            <ListItemText inset primary={data.getName?() || data.toString()} />
        </ListItem>

    getRows: ->
        if Array.isArray(@props.items)
            items = @props.items
        else
            items = @props.items.models
        rows = []
        for item in items
            rows.push(@makeListItem(item))
        rows

    render: ->
        <List component='nav' className={styles.root}>
            {@getRows()}
        </List>