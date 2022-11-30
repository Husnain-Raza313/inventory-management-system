// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//= require jquery
<<<<<<< HEAD
//= require jquery_ujs
require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require("bootstrap")
require('@client-side-validations/client-side-validations/src')
require('packs/brands')
require('packs/flash')
global.toastr = require('toastr')
import 'bootstrap-icons/font/bootstrap-icons.css'
import "@fortawesome/fontawesome-free/js/all";
=======
//= require select2
import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
Rails.start()
Turbolinks.start()
ActiveStorage.start()
import "bootstrap"
import 'bootstrap-icons/font/bootstrap-icons.css'
import "@fortawesome/fontawesome-free/js/all";
require("packs/select2setup")
>>>>>>> a945f4b (Multi-select:: Implemented Multiselect using package select2)
