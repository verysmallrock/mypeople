
import PropTypes from 'prop-types';
import { withStyles } from '@material-ui/core/styles';
import AppBar from '@material-ui/core/AppBar';
import Toolbar from '@material-ui/core/Toolbar';
import Typography from '@material-ui/core/Typography';
import IconButton from '@material-ui/core/IconButton';
import MenuIcon from '@material-ui/icons/Menu';
import AccountCircle from '@material-ui/icons/AccountCircle';
import Switch from '@material-ui/core/Switch';
import FormControlLabel from '@material-ui/core/FormControlLabel';
import FormGroup from '@material-ui/core/FormGroup';
import MenuItem from '@material-ui/core/MenuItem';
import Menu from '@material-ui/core/Menu';

styles =
  root:
    flexGrow: 1,
  grow:
    flexGrow: 1,
  menuButton:
    marginLeft: -12,
    marginRight: 20,


class AppNav extends React.Component
    state:
        auth: true
        anchorEl: null

    handleChange: (event) ->
        @setState({ auth: event.target.checked })

    handleMenu: (event) ->
        @setState({ anchorEl: event.currentTarget })

    handleClose: ->
        @setState({ anchorEl: null })

    render: ->
        { classes, title } = @props;
        { auth, anchorEl } = @state;
        open = Boolean(anchorEl);
        <AppBar position="fixed">
          <Toolbar>
            <IconButton className={classes.menuButton} color="inherit" aria-label="Menu">
              <MenuIcon />
            </IconButton>
            <Typography variant="h6" color="inherit" className={classes.grow}>{title}</Typography>
              <div>
                <IconButton
                    aria-owns={if open then 'menu-appbar' else undefined}
                    aria-haspopup="true"
                    onClick={@handleMenu}
                    color="inherit"                
                >
                  <AccountCircle />
                </IconButton>
                <Menu
                  id="menu-appbar"
                  anchorEl={anchorEl}
                  anchorOrigin={{  vertical: 'top', horizontal: 'right'}}
                  transformOrigin={{ vertical: 'top', horizontal: 'right'}}
                  open={open}
                  onClose={@handleClose}
                >
                  <MenuItem onClick={@handleClose}>Profile</MenuItem>
                  <MenuItem onClick={@handleClose}>My account</MenuItem>
                </Menu>
              </div>
          </Toolbar>
        </AppBar>  

export default withStyles(styles)(AppNav);