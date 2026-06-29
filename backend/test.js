const dns = require("dns");

dns.resolveSrv(
  "_mongodb._tcp.cluster0.sssmod8.mongodb.net",
  (err, addresses) => {
    console.log("Error:", err);
    console.log("Addresses:", addresses);
  }
);