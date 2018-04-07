const chalk = require("chalk");
const progressBar = require("progress");

class Printer {

    /**
     * Prints out the usages for each selector if they are <= userDefinedUsageCount
     */
    public printUsages(selectors: any[], userDefinedUsageCount: number) {
        // const bar = new progressBar(":bar", { total: selectors.length });

        selectors.forEach(selector => {
            // bar.tick();
            if (selector.usages <= userDefinedUsageCount) {
                console.log(
                    `${selector.usages} usages found, ${chalk.green(selector.selector)} can probably be removed.`,
                );
            }
        });
    }
}

export { Printer };
