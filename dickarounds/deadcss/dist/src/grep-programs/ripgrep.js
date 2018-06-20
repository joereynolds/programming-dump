"use strict";
exports.__esModule = true;
var child_process = require("child_process");
var RipGrep = /** @class */ (function () {
    function RipGrep() {
        this.executable = "rg";
    }
    RipGrep.prototype.run = function (cssFilePath) {
        var call = child_process.spawnSync(this.executable, ["-i", "^[#\.]", cssFilePath]);
        var callOutput = call.stdout.toString();
        var response = this.cleanCssSelectors(callOutput);
        var responseAsList = response.split("\n");
        var finalResult = this.removePseudoSelectors(responseAsList);
        return finalResult.filter(function (result) { return result !== ""; });
    };
    /**
     * Gets all ids and classes from rg's output
     */
    RipGrep.prototype.getSelectors = function (output) {
        return output.split("\n");
    };
    /**
     * Removes trailing spaces, }'s, #'s and .'s
     */
    RipGrep.prototype.cleanCssSelectors = function (response) {
        return response.replace(/(#|\.|\s*\{)/g, "");
    };
    RipGrep.prototype.removePseudoSelectors = function (cssSelectors) {
        var selectorMatch = /(:hover|:valid|:invalid)/g;
        return cssSelectors.filter(function (cssSelector) { return !cssSelector.match(selectorMatch); });
    };
    return RipGrep;
}());
exports.RipGrep = RipGrep;
//# sourceMappingURL=ripgrep.js.map