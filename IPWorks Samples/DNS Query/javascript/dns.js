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
  const args = process.argv;
  if (args.length !== 6) {
    console.log("Usage: node dns.js -s server -h hostname");
    console.log("");
    console.log("  server    the address of the DNS server.");
    console.log("  hostname  the host domain to query");
    console.log("Example: node dns.js -s 8.8.8.8 -h www.yahoo.com");
    return;
  }
  let server, hostname;
  for (let i = 0; i < args.length; i++) {
    if (args[i] === '-s') { server = args[i + 1] }
    if (args[i] === '-h') { hostname = args[i + 1] }
  }
  //console.log("Host is " + hostname + ' Server is ' + server);
  const dns1 = new ipworks.dns();
  const dnsMap = new Map();
  populateMap(dnsMap);
  dns1.on("Error", function (e) {
    console.log("Error:" + e.errorCode + "[" + e.description + "].");
  })
    .on("Response", function (e) {
      curQuery = dns1.getQueryType();
      if (e.statusCode === 0) {
        console.log('');
        console.log(dnsMap.get(curQuery) + ':');
        //there was a record in the response
        for (let i = 0; i < dns1.getRecords().size(); i++) {
          var curRecord = dns1.getRecords().item(i);
          for (let j = 0; j < curRecord.getFieldCount(); j++) {
            curRecord.setFieldIndex(j);
            if (j === 0) {
              console.log(
                "\t" + curRecord.getRecordTypeName() + "\t" + curRecord.getFieldName(i) + "\t" + curRecord.getFieldValue(i)
              );
            } else {

              console.log("\t");
              console.log("\t" + console.log(curRecord.getFieldName(i) + "\t" + curRecord.getFieldValue(i)));
            }
          }
        }
      }
    });

  console.log("Query Type\tType\tField\tValue");
  console.log("-------------------------------");
  for (const [key, value] of dnsMap) {
    try {
      dns1.setQueryType(key);
      dns1.setDNSServer(server);
      await dns1.query(hostname);
    } catch (err) {
      console.log('Error: ' + err.message);
    }
  }
  process.exit(0);
}
function populateMap(dnsmap) {
  dnsmap.set(1, 'Address Records');
  dnsmap.set(2, 'Name Server Records');
  dnsmap.set(3, 'Mail Destination Records');
  dnsmap.set(4, 'Mail Forwarder Records');
  dnsmap.set(5, 'Canonical Name Records');
  dnsmap.set(6, 'Start Of Authority Records');
  dnsmap.set(7, 'MailBox Records');
  dnsmap.set(8, 'Mail Group Records');
  dnsmap.set(9, 'MailBox Rename Records');
  dnsmap.set(10, 'NULL Records');
  dnsmap.set(11, 'Well - Known Services Records');
  dnsmap.set(12, 'Pointer Records');
  dnsmap.set(13, 'Host Information Records');
  dnsmap.set(14, 'Mail Information Records');
  dnsmap.set(15, 'Mail Exchange Records');
  dnsmap.set(16, 'Text Records');
  dnsmap.set(17, 'Responsible Person Records');
  dnsmap.set(18, 'Service Records');
  dnsmap.set(19, 'X25 Records');
  dnsmap.set(20, 'ISDN Records');
  dnsmap.set(21, 'Route Through Records');
  dnsmap.set(28, 'AAAA Record');
  dnsmap.set(33, 'SRV Record(location of services)');
  dnsmap.set(35, 'NAPTR Record(Naming Authority Pointer)');
  dnsmap.set(37, 'Certificate Record(e.g., Stores PKIX, SPKI, PGP)');
  dnsmap.set(100, 'Reverse Lookup(Reverse Lookup)');
}


function printBanner() {
  console.log("******************************************************************************");
  console.log("* This demo shows how to use the DNS component to query various record types *");
  console.log("*                  of a specific DNS server for a hostname                   *");
  console.log("******************************************************************************\n");
}

function prompt(promptName, label, punctuation, defaultVal)
{
  lastPrompt = promptName;
  lastDefault = defaultVal;
  process.stdout.write(`${label} [${defaultVal}]${punctuation} `);
}
