const child_process = require("child_process");

class RipGrep {

    private readonly executable: string = "rg";
    private readonly ignoreCase: string = "-i";
    private readonly selectorFilter: string = "^[#\.]";

    public run(cssFilePath: string): string[]  {
        const call = child_process.spawnSync(
            this.executable,
            [
                this.ignoreCase,
                this.selectorFilter,
                cssFilePath,
            ],
        );
        const callOutput = call.stdout.toString();
        const response = this.cleanCssSelectors(callOutput);
        const responseAsList = response.split("\n");
        const finalResult = this.removePseudoSelectors(responseAsList);

        return finalResult.filter(result => result !== "");
    }

    /**
     * Gets all ids and classes from rg's output
     */
    public getSelectors(output: string): string[]{
        return output.split("\n");
    }

    /**
     * Removes trailing spaces, }'s, #'s and .'s
     */
    private cleanCssSelectors(response: string): string {
        return response.replace(/(#|\.|\s*\{)/g, "");
    }

    private removePseudoSelectors(cssSelectors: string[]): string[] {
        const selectorMatch = /(:hover|:valid|:invalid)/g;
        return cssSelectors.filter(cssSelector => !cssSelector.match(selectorMatch));
    }
}

export { RipGrep };
