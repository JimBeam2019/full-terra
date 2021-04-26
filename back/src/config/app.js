/* eslint-disable import/no-extraneous-dependencies */
const express = require("express");

const PgRoute = require("../route/PgRoute");

/**
 *
 *
 * @class App
 */
class App {
  /**
   * Creates an instance of App.
   * @memberof App
   */
  constructor() {
    this.app = express();
    this.config();
  }

  /**
   *
   *
   * @memberof App
   */
  config() {
    this.app.use(express.json());
    this.app.use(express.urlencoded({ extended: false }));

    const pgRoute = new PgRoute().route;

    this.app.use("/pg", pgRoute);
  }
}

module.exports = App;
