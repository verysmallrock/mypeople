import styles from './appmenu.scss'
import TextField from '@material-ui/core/TextField';

export default class ObjectEditor extends React.Component
    renderPropertyEditors: ->
        for prop in Object.getOwnPropertyNames(@obj)
            continue if prop == 'key'
            if typeof @obj[prop] == 'string'
                <TextField label={ prop } value={ @obj[prop] } /> 
            else if typeof @obj[prop] == 'number'
                <TextField type='number' label={ prop } value={ @obj[prop] } /> 
            else 
                <TextField label={ prop } value={ @obj[prop] } /> 

    render: ->
        @obj = @props.item
        <div className={ styles.objectEditor }>
            { @renderPropertyEditors() }
        </div>