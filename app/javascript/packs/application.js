// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//= require jquery
//= require jquery_ujs
//= require select2
require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require("bootstrap")
require('@client-side-validations/client-side-validations/src')
require('packs/brands')
require('packs/flash')
require('packs/reports')
require("packs/select2setup")
require("packs/imageprev")
global.toastr = require('toastr')
import 'bootstrap-icons/font/bootstrap-icons.css'
import "@fortawesome/fontawesome-free/js/all"
import "chartkick/chart.js"

