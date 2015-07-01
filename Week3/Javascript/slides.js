'use strict';

var slideLoader = require('./slideLoader.js');

slideLoader('./slides.txt', function (slides) {
    slides.forEach(function (slide) {
        console.log('\n\n\n\ ' + slide);
    })
});

