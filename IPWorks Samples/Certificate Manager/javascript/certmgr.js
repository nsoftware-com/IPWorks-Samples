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

let certmgr = new ipworks.certmgr();
async function main() {

    printBanner();
    printUsage();
    let quit = false;
    while (!quit) {
        const input = await question1();
        quit = await handleCommand(input);
    }
}
const commands = [
    {
        name: "load",
        syntax: "-c load -f <fileName> [-p <password> -s <certSubject>]",
        desc: "Loads a certificate from a file, optionally specifying a password and subject."
    },
    {
        name: "createcsr",
        syntax: "-c createcsr -s <subject> -k <keyName> -f <fileName>",
        desc: "Generates a certificate signing request using the specified key and subject, then exports it to the file."
    },
    {
        name: "signcsr",
        syntax: "-c signcsr -r <csrFile> -n <serialNumber> -o <outputFile>",
        desc: "Signs the specified CSR using the loaded certificate, assigning it the given serial number."
    },
    {
        name: "importcsr",
        syntax: "-c importcsr -f <fileName> -k <keyName>",
        desc: "Imports a signed CSR from a file using the specified key name."
    },
    {
        name: "export",
        syntax: "-c export -f <fileName> -p <password> -e <fileFormat>",
        desc: "Exports the loaded certificate to a file using the given format and password."
    },
    {
        name: "help",
        syntax: "help",
        desc: "Displays this help menu."
    },
    {
        name: "quit",
        syntax: "quit",
        desc: "Exits the demo."
    }
];


async function loadCertificate(fileName, certPassword = '', certSubject = '*') {
    try {
        certmgr.setCert(new ipworks.Certificate(ipworks.CertMgrCertStoreTypes.cstAuto, fileName, certPassword, certSubject));
        console.log("Loaded Certificate " + certmgr.getCert().getSubject());
    } catch (err) {
        console.log("Error: " + err.message);
    }
}
async function createCSR(certSubject, keyName, filename) {

    const csr = await certmgr.generateCSR(certSubject, keyName);
    fs.writeFileSync(filename, csr);
    console.log('Generated a CSR and stored the request in file : ' + filename);
}
async function signCSR(fileName, serialNumber, postSignFileName) {
    if (!fs.existsSync(fileName)) {
        console.log("Cannot load file.");
        return false;
    }
    if (certmgr.getCert() === null || !certmgr.getCert().getPrivateKeyAvailable()) {
        console.log("Cannot sign a CSR without a Cert with a private key available");
        return false;
    }
    const csr = fs.readFileSync(fileName);
    const bytes = new TextEncoder().encode(csr);
    const csrsigned = await certmgr.signCSR(bytes, serialNumber);
    fs.writeFileSync(postSignFileName, csrsigned);
    console.log('Successfully signed csr with cert ' + certmgr.getCert().getSubject() + ' Signed CSR saved to: ' + postSignFileName);

}
async function importSignedCSR(fileName, keyName) {
    if (!fs.existsSync(fileName)) {
        console.log("Cannot load file.");
        return false;

    }
    const signedcsr = fs.readFileSync(fileName);
    const bytes = new TextEncoder().encode(signedcsr);
    certmgr.importSignedCSR(bytes, keyName);
    console.log('Successfully imported signed CSR ' + certmgr.getCert().getSubject());
}
async function exportCert(fileFormat, filename, password, exportPriv) {
    if (certmgr.getCert() === null) {
        console.log('Must load a cert before exporting');
    }
    certmgr.setExportFormat(fileFormat);
    certmgr.setExportPrivateKey(exportPriv);
    await certmgr.exportCertificate(filename, password);
    console.log('Private key Certificate exported to ' + filename);
}

async function handleCommand(input) {
    if (!input || !input.trim()) return false;

    const args = parseArgs(input);
    const cmd = (args.c || args.command || '').toLowerCase();

    switch (cmd) {
        case 'load':
            if (!args.f) return console.log("Usage: -c load -f <fileName> [-p <password> -s <certSubject>]");
            await loadCertificate(args.f, args.p || '', args.s || '*');
            break;

        case 'createcsr':
            if (!args.s || !args.k || !args.f)
                return console.log("Usage: -c createcsr -s <subject> -k <keyName> -f <fileName>");
            await createCSR(args.s, args.k, args.f);
            break;

        case 'signcsr':
            if (!args.r || !args.n || !args.o)

                return console.log("Usage: -c signcsr -r <csrFile> -n <serialNumber> -o <outputFile>");
            await signCSR(args.r, parseInt(args.n), args.o);
            break;

        case 'importcsr':
            if (!args.f || !args.k)
                return console.log("Usage: -c importcsr -f <fileName> -k <keyName>");
            await importSignedCSR(args.f, args.k);
            break;

        case 'export':
            if (!args.e || !args.f || !args.p)
                return console.log("Usage: -c export -f <fileName> -p <password> -e <fileFormat>");
            await exportCert(args.e, args.f, args.p);
            break;

        case 'help':
            printUsage();
            break;

        case 'quit':
            return true;

        default:
            console.log('Invalid command. Type "help" for a list of commands.');
    }

    return false;
}


const question1 = () => {
    return new Promise((resolve, reject) => {
        rl.question('\ncertmgr> ', (input) => {
            resolve(input)
        })
    })
}
function printBanner() {
    console.log('*****************************************************************\n')
    console.log('*       This demo shows how to use the CertMgr component        *\n')
    console.log('*       to load Certs from files, export Certs and manage       *\n')
    console.log('*           the CSR process from beginning to end.              *\n')
    console.log('*****************************************************************\n')

}

function printUsage() {


    console.log("\nAvailable Commands:\n");
    for (const cmd of commands) {
        console.log(`  ${cmd.syntax}`);
        console.log(`    ${cmd.desc}\n`);
    }
}

function parseArgs(input) {
    const regex = /[^\s"]+|"([^"]*)"/g;
    const matches = [...input.matchAll(regex)].map(m => m[1] ?? m[0]);
    const result = {};
    let key = null;

    for (const arg of matches) {
        if (arg.startsWith('-')) {
            key = arg.replace(/^-+/, '').toLowerCase();
            result[key] = true;
        } else if (key) {
            result[key] = arg;
            key = null;
        }
    }

    return result;
}
main();

function prompt(promptName, label, punctuation, defaultVal)
{
  lastPrompt = promptName;
  lastDefault = defaultVal;
  process.stdout.write(`${label} [${defaultVal}]${punctuation} `);
}
