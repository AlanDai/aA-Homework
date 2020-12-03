import React from 'react';

import GiphysIndex from './giphys_index';

export class GiphysSearch extends React.Component {
    constructor(props) {
        super(props)
        this.state = {
            searchTerm: ''
        }
        
        this.handleChange = this.handleChange.bind(this);
        this.handleSubmit = this.handleSubmit.bind(this);
    };

    handleChange(e) {
        this.setState({ searchTerm: e.currentTarget.value })
    }

    handleSubmit(e) {
        e.preventDefault();
        let searchTerm = this.state.searchTerm.split(' ').join('+');
        this.props.fetchSearchGiphys(searchTerm)
    }

    render () {
        return (
            <div>
                <form>
                    <input value={this.state.searchTerm} onChange={this.handleChange}/>
                    <button onClick={this.handleSubmit}>Submit Giphy</button>
                </form>
                <GiphysIndex giphys={giphys} />
            </div>
        )
    }
}