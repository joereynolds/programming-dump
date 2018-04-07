const chalk = require("chalk");

class Printer {

    /**
     * Prints out the usages for each selector if they are <= userDefinedUsageCount
     */
    public printUsages(selectors: any[], userDefinedUsageCount: number) {
        selectors.forEach(selector => {
            if (selector.usages <= userDefinedUsageCount) {
                console.log(
                    `${selector.usages} usages found, ${chalk.green(selector.selector)} can probably be removed.`,
                );
            }
        });
    }
}

export { Printer };
