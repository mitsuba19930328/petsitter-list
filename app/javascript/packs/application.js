// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascripts and only use these pack files to reference
// that code so it'll be compiled.

// import 'bootstrap'
// import '../src/application.scss'

import 'bootstrap';
import '../stylesheets/application';

require("@rails/ujs").start()
require("@rails/activestorage").start()
require("/channels")
require('jquery')//jQueryを追加
require('bootstrap/dist/js/bootstrap.min.js')//Bootstrapを追加
require('raty.js')
require('test.js')





// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
