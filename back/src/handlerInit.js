const fs = require('fs');
const path = require('path');

const Pg = require('./model/Pg');

require('dotenv').config();

exports.handler = (event, context, callback) => {
  const sqlFile = path.join(process.cwd(), '/sql/init.sql');

  const sqlScript = fs.readFileSync(sqlFile).toString();

  const newPg = new Pg(
    process.env.PGHOST,
    process.env.PGPORT,
    process.env.PGUSER,
    process.env.PGPASS,
    process.env.PGDB
  );

  newPg.query(sqlScript).then((res) => {
    callback(null, res);
  });
};
