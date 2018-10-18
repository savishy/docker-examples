// Tests for the calculator.
exports.config = {
    // directConnect: true,
    seleniumAddress: "http://hub:4444/wd/hub",
    capabilities: {
	'browserName': 'chrome'
    },
    framework: 'jasmine2',

    specs: [
	'spec.js'
    ],
};
