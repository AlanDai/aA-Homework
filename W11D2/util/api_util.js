import { giphyKey } from '../api_keys';

export const fetchSearchGiphys = searchTerm => (
    $.ajax({
        method: "GET",
        url: `http://api.giphy.com/v1/gifs/search?q=${searchTerm}&api_key=${giphyKey}&limit=2`,
    })
);