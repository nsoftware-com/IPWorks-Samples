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
  const argv = process.argv;
  if (argv.length < 5) {
    console.log("Usage: node email.js  [option] server  from  to");
    console.log("Options: ");
    console.log("  -c      a comma separated list of addresses for carbon copies");
    console.log("  -s      the subject of the mail message");
    console.log("  -m      the raw message content");
    console.log("  -r      the name or address of a mail server (mail relay)");
    console.log("  -f      the email address of the sender");
    console.log("  -t      a comma separated list of addresses for destinations");
    console.log("  -u      the username for the mail server");
    console.log("  -p      app password for the mail server");
    console.log(
      'Example: node email.js -c cc@mail.local -s test -m "test message" -r mail.local -f sender@mail.com -t recipient@mail.local' +
      'Example: node email.js -s GmailTest -m "test message using gmails smtp server" -r smtp.gmail.com -f user@gmail.com -t recipient@gmail.com -u user@gmail.com -p apppassword'
    );
    process.exit();
  }

  const smtp1 = new ipworks.smtp();

  smtp1.on("SSLServerAuthentication", function (e) {
    e.accept = true;
  });

  for (i = 0; i < argv.length; i++) {
    if (argv[i].startsWith("-")) {
      if (argv[i] === "-c") smtp1.setCc(argv[i + 1]); // args[i+1] corresponds to the value of argument [i]
      if (argv[i] === "-s") smtp1.setSubject(argv[i + 1]);
      if (argv[i] === "-m") smtp1.setMessageText(argv[i + 1]);
      if (argv[i] === "-r") smtp1.setMailServer(argv[i + 1]);
      if (argv[i] === "-f") smtp1.setMessageText(argv[i + 1]);
      if (argv[i] === "-t") smtp1.setMessageText(argv[i + 1]);
      if (argv[i] === "-u") smtp1.setMessageText(argv[i + 1]);
      if (argv[i] === "-p") smtp1.setMessageText(argv[i + 1]);
    }
  }

  smtp1.setMailServer(argv[argv.length - 3]);
  smtp1.setFrom(argv[argv.length - 2]);
  smtp1.setSendTo(argv[argv.length - 1]);
  smtp1.setTimeout(35);

  console.log("Sending message...");

  try {
    await smtp1.send();
    console.log("Message sent successfully.");
    process.exit();
  } catch (e) {
    console.log(e.message);
    process.exit();
  }
}


function prompt(promptName, label, punctuation, defaultVal)
{
  lastPrompt = promptName;
  lastDefault = defaultVal;
  process.stdout.write(`${label} [${defaultVal}]${punctuation} `);
}
