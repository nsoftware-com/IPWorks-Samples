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
	if (argv.length < 9) {
		printUsage();
		process.exit();
	}

	const htmlmailer1 = new ipworks.htmlmailer();
	const oauth1 = new ipworks.oauth();
	htmlmailer1.on("SSLServerAuthentication", function (e) {
		e.accept = true;
	});
	let hasOAuth = false;
	for (i = 0; i < argv.length; i++) {
		if (argv[i].startsWith("-")) {
			if (argv[i] === "-ssl") htmlmailer1.setSSLEnabled(true);
			if (argv[i] === "-s") htmlmailer1.setSubject(argv[i + 1]);
			if (argv[i] === "-m") htmlmailer1.setMessageHTML(argv[i + 1]);
			if (argv[i] === "-a") htmlmailer1.addAttachment(argv[i + 1]);
			if (argv[i] === "-u") htmlmailer1.setUser(argv[i + 1]);
			if (argv[i] === "-p") htmlmailer1.setPassword(argv[i + 1]);
			if (argv[i] === "-serv") htmlmailer1.setMailServer(argv[i + 1]);
			if (argv[i] === "-from") htmlmailer1.setFrom(argv[i + 1]);
			if (argv[i] === "-to") htmlmailer1.setSendTo(argv[i + 1]);
			if (argv[i] === '-cid') oauth1.setClientId(argv[i + 1]);
			if (argv[i] === '-cs') oauth1.setClientSecret(argv[i + 1]);
			if (argv[i] === '-oauth') hasOAuth = true;
		}
	}
	if (hasOAuth) {
		oauth1.setServerAuthURL("https://accounts.google.com/o/oauth2/auth");
		oauth1.setServerTokenURL("https://oauth2.googleapis.com/token");
		htmlmailer1.setAuthMechanism(ipworks.HTMLMailerAuthMechanisms.amXOAUTH2);
		htmlmailer1.config("loglevel=3");
		oauth1.setAuthorizationScope("https://mail.google.com/");
		const token = await oauth1.getAuthorization().then((e) => {
			return e;
		}).catch((e) => console.log(e.message));
		console.log(token);
		htmlmailer1.config("AuthorizationIdentity=" + token);

	}
	htmlmailer1.setTimeout(60);
	console.log('Sending message...');

	try {
		await htmlmailer1.send();
		console.log("Message sent successfully.");
	} catch (ex) {
		console.log("Error: " + ex.message);
	}
	process.exit();
}
function printBanner() {
	console.log('********************************************************');
	console.log('* This demo demonstrates sending email messages using  *');
	console.log('*    the HTMLMailer component with support for both    *');
	console.log('*        standard authentication and OAuth 2.0.        *')
	console.log('********************************************************');
}
function printUsage() {
	console.log("usage: node htmlmailer.js [options]");
	console.log("Options:");
	console.log("  -serv <server>        Mail server hostname or IP address (e.g., smtp.gmail.com)[required]");
	console.log("  -ssl                  Enable SSL/TLS for secure connections");
	console.log("  -from <address>       Sender email address[required]");
	console.log("  -to <address>         Recipient email address[required]");
	console.log("  -s <subject>          Subject line of the email[required]");
	console.log("  -m <message>          Message body (HTML format)[required]");
	console.log("  -a <file>             Attach a file to the message");
	console.log("  -u <username>         Username or email for authentication[required]");
	console.log("  -p <password>         Password for authentication");
	console.log("  -cid <client id>      OAuth client ID");
	console.log("  -cs <client secret>   OAuth client secret");
	console.log("  -oauth                Use OAuth 2.0 authentication instead of password");
	console.log("*Note: Oauth is set up for Gmail, adjust oauth settings as needed for other servers.")
	console.log("\nExamples:");
	console.log("  node htmlmailer.js -serv smtp.gmail.com -ssl -from you@gmail.com -to friend@gmail.com \\");
	console.log("    -s \"Hello\" -m \"<b>Hi there!</b>\" -u you@gmail.com -p yourpassword");
	console.log();
	console.log("  node htmlmailer.js -serv smtp.gmail.com -ssl -u you@gmail.com -from you@gmail.com -to friend@gmail.com \\");
	console.log("    -s \"OAuth Test\" -m \"This email uses OAuth.\" -oauth -cid yourClientId -cs yourClientSecret");
	console.log();
}

function prompt(promptName, label, punctuation, defaultVal)
{
  lastPrompt = promptName;
  lastDefault = defaultVal;
  process.stdout.write(`${label} [${defaultVal}]${punctuation} `);
}
