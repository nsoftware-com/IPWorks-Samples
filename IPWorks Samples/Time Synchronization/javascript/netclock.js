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
  const netclock = new ipworks.netclock();
  const argv = process.argv;

  printBanner();

  let server = "";

  // Parse flagged arguments (e.g. -s time.nist.gov)
  for (let i = 0; i < argv.length; i++) {
    if (argv[i].startsWith("-")) {
      if (argv[i] === "-s" && argv[i + 1]) {
        server = argv[i + 1];
      }
      if (argv[i] === "-h" || argv[i] === "--help") {
        printUsage();
        process.exit();
      }
    }
  }

  if (!server) {
    printUsage();
    process.exit();
  }

  try {
    netclock.setTimeServer(server);
    await netclock.getTime();
    const internetTime = await netclock.getLocalTime();

    console.log("System date and time:   " + new Date());
    console.log("Internet date and time: " + internetTime);
  } catch (ex) {
    console.log("Error: " + ex.message);
  }

  process.exit();
}

function printUsage() {
  console.log("Usage: node netclock.js -s server");
  console.log("Options:");
  console.log("  -s      The time server from which to request the time");
  console.log("Examples:");
  console.log("  node netclock.js -s time.nist.gov");
  console.log("");
}

function printBanner() {
  console.log("*********************************************************");
  console.log("*               Time Synchronization Demo               *");
  console.log("*      Uses the NetClock component to retrieve and      *");
  console.log("*   compare internet time with the local system time.   *");
  console.log("*********************************************************");
  console.log("");
}



function prompt(promptName, label, punctuation, defaultVal)
{
  lastPrompt = promptName;
  lastDefault = defaultVal;
  process.stdout.write(`${label} [${defaultVal}]${punctuation} `);
}
