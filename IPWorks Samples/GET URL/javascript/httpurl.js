/*
 * IPWorks 2024 JavaScript Edition - Sample Project
 *
 * This sample project demonstrates the usage of IPWorks in a 
 * simple, straightforward way. It is not intended to be a complete 
 * application. Error handling and other checks are simplified for clarity.
 *
 * www.nsoftware.com/ipworks
 *
 * This code is subject to the terms and conditions specified in the 
 * corresponding product license agreement which outlines the authorized 
 * usage and restrictions.
 */
 
const readline = require("readline");
const ipworks = require("@nsoftware/ipworks");

if(!ipworks) {
  console.error("Cannot find ipworks.");
  process.exit(1);
}
let rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

main();

async function main() {
	printBanner();
	const argv = process.argv;
	if (argv.length !== 4) {
		console.log("Usage: node httpurl.js -u url");
		console.log(" -u    the url to fetch");
		console.log("Example: node httpurl.js -u https://www.google.com");
		process.exit();
	}
	let url;
	for (let i = 0; i < argv.length; i++) {
		if (argv[i] === '-u') { url = argv[i + 1] }
	}

	const http = new ipworks.http();


	http.on("Transfer", function (e) {
		console.log(e.text.toString());
	})
		.on("SSLServerAuthentication", function (e) {
			e.accept = true;
		});

	http.setFollowRedirects(1);

	await http.get(url).catch((err) => {
		console.log(err.message);
	});
	process.exit();
}

function printBanner() {
	console.log("***************************************************");
	console.log("*         Welcome to the IPWorks HTTP Demo        *");
	console.log("*  Demonstrates a simple HTTP GET request using   *");
	console.log("*           the IPWorks HTTP component            *");
	console.log("***************************************************\n");
}


function prompt(promptName, label, punctuation, defaultVal)
{
  lastPrompt = promptName;
  lastDefault = defaultVal;
  process.stdout.write(`${label} [${defaultVal}]${punctuation} `);
}
