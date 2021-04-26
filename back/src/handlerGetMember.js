const Pg = require("./model/Pg");

require("dotenv").config();

exports.handler = (event, context, callback) => {
  const newPg = new Pg(
    process.env.PGHOST,
    process.env.PGPORT,
    process.env.PGUSER,
    process.env.PGPASS,
    process.env.PGDB
  );

  newPg.getMembers().then((res) => {
    callback(null, res);
  });
};
