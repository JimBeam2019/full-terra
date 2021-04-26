/* eslint-disable import/no-extraneous-dependencies */
const express = require("express");
const fs = require("fs");
const path = require("path");

const Pg = require("../model/Pg");

require("dotenv").config();

/**
 *
 *
 * @class PgRoute
 */
class PgRoute {
  /**
   * Creates an instance of PgRoute.
   * @memberof PgRoute
   */
  constructor() {
    this.route = express.Router();

    this.runPg();
  }

  runPg() {
    // http://localhost:4200/pg/members
    this.route.get("/members", async (req, res) => {
      const newPg = new Pg(
        process.env.PGHOST,
        process.env.PGPORT,
        process.env.PGUSER,
        process.env.PGPASS,
        process.env.PGDB
      );

      newPg
        .getMembers()
        .then((result) => {
          res.status(200).send({ code: 200, result });
        })
        .catch((err) => {
          res.status(404).send({ code: 404, err });
        });
    });

    // http://localhost:4200/pg/init
    this.route.get("/init", async (req, res) => {
      const sqlFile = path.join(process.cwd(), "/sql/init.sql");

      const sqlScript = fs.readFileSync(sqlFile).toString();

      const newPg = new Pg(
        process.env.PGHOST,
        process.env.PGPORT,
        process.env.PGUSER,
        process.env.PGPASS,
        process.env.PGDB
      );

      newPg
        .query(sqlScript)
        .then((result) => {
          res.status(200).send({ code: 200, result });
        })
        .catch((err) => {
          res.status(404).send({ code: 404, err });
        });
    });
  }
}

module.exports = PgRoute;
