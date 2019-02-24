import React from 'react';
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
    makeListItem: (data) ->
        <ListItem button>
            <ListItemIcon>
                <StarIcon />
            </ListItemIcon>
            <ListItemText inset primary={data.getName?() || data.toString()} />
        </ListItem>

    getRows: ->
        items = @props.items
        rows = []
        for item in items
            rows.push(@makeListItem(item))
        rows

    render: ->
        <List component='nav' className={styles.root}>
            {@getRows()}
        </List>