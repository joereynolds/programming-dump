const child_process = require("child_process");

class RipGrep {

    public run(cssFilePath: string)  {
        const call = child_process.spawnSync("rg", ["-i", "^[#\.]", cssFilePath]);
        const response = this.cleanCssSelectors(call.stdout.toString());

        return response.split("\n");
    }

    private function cleanCssSelectors(response: string) {
        const response = response.trim();
        return response.replace(/\s*\{/g, "");
    }
}

export { RipGrep };
