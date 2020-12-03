import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';
import Root from './components/root';
import { fetchSearchGiphys } from './util/api_util';
import { receiveSearchGiphys, requestSearchGiphys } from './actions/giphy_actions';

document.addEventListener('DOMContentLoaded', () => {
    const root = document.getElementById('root');
    const store = configureStore();

    // TESTING
    window.store = store;
    window.fetchSearchGiphys = fetchSearchGiphys;
    window.receiveSearchGiphys = receiveSearchGiphys;
    window.requestSearchGiphys = requestSearchGiphys;
    // END TESTING

    ReactDOM.render(<Root store={store} />, root);
})