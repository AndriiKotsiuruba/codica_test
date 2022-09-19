
import Rails from '@rails/ujs'
import Turbolinks from 'turbolinks'
Rails.start()
Turbolinks.start()

import $ from 'jquery';

window.$ = $;
window.jQuery = $;

import 'inputmask';

import 'bootstrap/dist/js/bootstrap';

import 'js/disabled_submit';
import 'js/inputmask';

import 'js/registration/edit_books_count';
