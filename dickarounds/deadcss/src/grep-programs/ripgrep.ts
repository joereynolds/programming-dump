const child_process = require("child_process");
const fs = require("fs");

class RipGrep {

    private readonly executable: string = "rg";
    private readonly ignoreCase: string = "-i";
    private readonly filesToIgnore: string = "--iglob=!*.{css,scss}";

    public run(cssFilePath: string): string[]  {
        const selectors = this.getSelectors(cssFilePath);
        const cleanSelectors = this.cleanCssSelectors(selectors);
        return cleanSelectors;
    }

    /**
     * Gets all ids and classes from cssFilePath
     *
     * @TODO move out of ripgrep
     */
    public getSelectors(cssFilePath: string): string[] {
        const fileContents: string = fs.readFileSync(cssFilePath, "utf8");

        const selectors = fileContents.split("\n").filter(selector => {
            return (selector.startsWith("#") || selector.startsWith("."));
        });

        return selectors;
    }

    /**
     * Brings back an array of objects in the following format:
     * [
     *     {
     *         selector: my-id-selector,
     *         usages: 3,
     *         foundIn: [
     *             views/content/customer.php
     *             views/content/dashboard.php
     *             views/content/shop.php
     *         ]
     *     }
     * ]
     */
    public findUsagesOfSelectors(selectors: string[]) {

        const foundSelectors: any[] = [];
        selectors.forEach(selector => {
            const call = child_process.spawnSync(
                this.executable,
                [
                    this.ignoreCase,
                    this.filesToIgnore,
                    selector,
                    "test/fixtures",
                ],
                {
                    stdio: "pipe",
                    encoding: "utf-8",
                },
            );

            let listOfFiles: string[] = call.output[1].split("\n");
            listOfFiles = listOfFiles.filter(element => element !== "");

            foundSelectors.push({
                selector,
                usages: listOfFiles.length,
            });
        });

        return foundSelectors;
    }

    /**
     * @TODO move out of ripgrep
     */
    public cleanCssSelectors(selectors: string[]): string[] {
        selectors = this.removeNoiseFromSelectors(selectors);
        selectors = this.removePseudoSelectors(selectors);
        return selectors.filter(selector => selector !== "");
    }

    /**
     * @TODO move out of ripgrep
     */
    private removeNoiseFromSelectors(selectors: string[]): string[] {
        const cleanSelectors = selectors.map(selector => {
            return selector.replace(/(#|\.|\s*\{)/g, "");
        });

        return cleanSelectors;
    }

    /**
     * @TODO move out of ripgrep
     */
    private removePseudoSelectors(selectors: string[]): string[] {
        const selectorMatch = /(:hover|:valid|:invalid)/g;
        return selectors.filter(selector => !selector.match(selectorMatch));
    }
}

export { RipGrep };
