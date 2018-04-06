const child_process = require("child_process");
const fs = require("fs");

class RipGrep {

    private readonly executable: string = "rg";
    private readonly ignoreCase: string = "-i";

    public run(cssFilePath: string): string[]  {
        const selectors = this.getSelectors(cssFilePath);
        const cleanSelectors = this.cleanCssSelectors(selectors);
        return cleanSelectors;
    }

    public getSelectors(cssFilePath: string): string[] {
        const fileContents: string = fs.readFileSync(cssFilePath, "utf8");

        const selectors = fileContents.split("\n").filter(line => {
            return (line.startsWith("#") || line.startsWith("."));
        });

        return selectors;
    }

    private cleanCssSelectors(selectors: string[]): string[] {
        selectors = this.removeNoiseFromSelectors(selectors);
        selectors = this.removePseudoSelectors(selectors);
        return selectors.filter(selector => selector !== "");
    }

    private removeNoiseFromSelectors(selectors: string[]): string[] {
        const cleanSelectors = selectors.map(selector => {
            return selector.replace(/(#|\.|\s*\{)/g, "");
        });

        return cleanSelectors;
    }

    private removePseudoSelectors(selectors: string[]): string[] {
        const selectorMatch = /(:hover|:valid|:invalid)/g;
        return selectors.filter(selector => !selector.match(selectorMatch));
    }
}

export { RipGrep };
