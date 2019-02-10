export default class AppView extends React.Component        
    render: ->
        <div className="application">
            { @props.children }
        </div>  