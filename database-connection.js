const PGPromise = require('pg-promise');

let initOptions = {
  promiseLib: Promise,
  pgNative: true,
}

if (process.env.DEBUG) {
  initOptions.query = (e)=>{console.log(e.query)}
}

const pgp = PGPromise(initOptions);
module.exports = pgp(`postgres://postgres@${process.env.DBHOST}:${process.env.DBPORT}/annotations`);

