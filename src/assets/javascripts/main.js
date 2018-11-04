import Amber from 'amber'

import './jquery-3.3.1.min.js'
import './jquery-ui/jquery-ui.css'
import './jquery-ui/jquery-ui.js'
import './jquery-ui/jquery-ui.structure.css'
import './jquery-ui/jquery-ui.theme.css'

if (!Date.prototype.toGranite) {
  (function() {

    function pad(number) {
      if (number < 10) {
        return '0' + number;
      }
      return number;
    }

    Date.prototype.toGranite = function() {
      return this.getUTCFullYear() +
        '-' + pad(this.getUTCMonth() + 1) +
        '-' + pad(this.getUTCDate()) +
        ' ' + pad(this.getUTCHours()) +
        ':' + pad(this.getUTCMinutes()) +
        ':' + pad(this.getUTCSeconds())  ;
    };

  }());
}


